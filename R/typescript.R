#' Transpile TypeScript code to JavaScript
#'
#' This function uses the TypeScript compiler to transpile TypeScript code into JavaScript.
#'
#' @param input A character string containing the TypeScript code to be transpiled.
#' @param transpileOptions A list of options to pass to the TypeScript transpiler. See the
#' [TypeScript documentation](https://www.typescriptlang.org/docs/handbook/compiler-options.html) for available options.
#'
#' @return A list containing the transpiled JavaScript code and any diagnostics.
#' @examples
#' ts_code <- "const greet = (name: string): string => `Hello, ${name}!`;"
#' typescript_transpile(ts_code, list(compilerOptions = list(target = "ES5")))
#'
#' @export
typescript_transpile <- function(input, transpileOptions = list()) {
  if (!ctx_typescript$get("typescript_loaded")) {
    ctx_typescript$source(system.file("js", "typescript.js", package = "jsutils", mustWork = TRUE))
    ctx_typescript$assign("typescript_loaded", TRUE)
  }
  res <- ctx_typescript$call("ts.transpileModule", input, transpileOptions)
  if (!is.null(res$error)) {
    stop(res$error$message, call. = FALSE)
  }
  res
}
