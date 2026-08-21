import { readdir, unlink } from "node:fs/promises";
import { join, resolve } from "node:path";

const bundleDir = import.meta.dir;
const projectDir = resolve(bundleDir, "../..");
const outputDir = join(projectDir, "inst", "js");
const versionsFile = join(projectDir, "R", "versions.R");

const bundles = [
  { packageName: "esprima", versionName: "ESPRIMA_VERSION" },
  {
    packageName: "sass",
    versionName: "SASS_VERSION",
    banner: "var __require = () => ({});",
  },
  { packageName: "terser", versionName: "TERSER_VERSION" },
  { packageName: "typescript", versionName: "TYPESCRIPT_VERSION" },
];

async function packageVersion(packageName) {
  const manifest = Bun.file(join(bundleDir, "node_modules", packageName, "package.json"));
  if (!(await manifest.exists())) {
    throw new Error(`Missing ${packageName}. Run \`bun install --frozen-lockfile\` first.`);
  }

  return JSON.parse(await manifest.text()).version;
}

async function removePreviousBundles(packageName) {
  const files = await readdir(outputDir);
  await Promise.all(
    files
      .filter((file) => file.startsWith(`${packageName}.`) && file.endsWith(".js"))
      .map((file) => unlink(join(outputDir, file))),
  );
}

async function buildBundle({ packageName, banner }, version, minify) {
  const suffix = minify ? ".min" : "";
  const result = await Bun.build({
    entrypoints: [join(bundleDir, `${packageName}.js`)],
    outdir: outputDir,
    naming: `${packageName}.${version}${suffix}.js`,
    target: "browser",
    format: "iife",
    minify,
    banner,
  });

  if (!result.success) {
    throw new Error(`Failed to bundle ${packageName}.`);
  }
}

const versions = Object.fromEntries(
  await Promise.all(
    bundles.map(async (bundle) => [bundle.versionName, await packageVersion(bundle.packageName)]),
  ),
);

for (const bundle of bundles) {
  await removePreviousBundles(bundle.packageName);
  const version = versions[bundle.versionName];
  await buildBundle(bundle, version, false);
  await buildBundle(bundle, version, true);
}

let versionContents = await Bun.file(versionsFile).text();
for (const [versionName, version] of Object.entries(versions)) {
  const pattern = new RegExp(`(\\.${versionName} <- ")[^"]*(")`);
  if (!pattern.test(versionContents)) {
    throw new Error(`Could not update ${versionName} in R/versions.R.`);
  }
  versionContents = versionContents.replace(pattern, `$1${version}$2`);
}
await Bun.write(versionsFile, versionContents);
