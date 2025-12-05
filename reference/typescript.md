# Transpile TypeScript code to JavaScript

This function uses the TypeScript compiler to transpile TypeScript code
into JavaScript. Note that the first time this function is called, it
will load the TypeScript library into the JavaScript context, which may
take a few seconds. Subsequent calls will be faster.

## Usage

``` r
typescript(input, options = NULL)
```

## Arguments

- input:

  Either a path to a file or a character string containing the
  TypeScript code to be transpiled.

- options:

  A list of options to pass to the TypeScript transpiler. See the
  [TypeScript
  documentation](https://www.typescriptlang.org/docs/handbook/compiler-options.html)
  for available options.

## Value

A list containing the transpiled JavaScript code and any diagnostics.

## Examples

``` r
ts_code <- "const greet = (name: string): string => `Hello, ${name}!`;"
typescript(ts_code, list(compilerOptions = list(target = "ES5")))
#> $outputText
#> [1] "var greet = function (name) { return \"Hello, \".concat(name, \"!\"); };\n"
#> 
#> $diagnostics
#> logical(0)
#> 
#> $sourceMapText
#> NULL
#> 
```
