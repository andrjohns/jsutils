#' @title Transpile TypeScript code to JavaScript
#'
#' @description This function uses the TypeScript compiler to transpile TypeScript code into JavaScript. Note that the
#' first time this function is called, it will load the TypeScript library into the JavaScript context,
#' which may take a few seconds. Subsequent calls will be faster.
#'
#' @param input Either a path to a file or a character string containing the TypeScript code to be transpiled.
#' @param options A list of options to pass to the TypeScript transpiler. See the
#' [TypeScript documentation](https://www.typescriptlang.org/docs/handbook/compiler-options.html) for available options.
#'
#' @return A list containing the transpiled JavaScript code and any diagnostics.
#' @examples
#' ts_code <- "const greet = (name: string): string => `Hello, ${name}!`;"
#' typescript(ts_code, list(compilerOptions = list(target = "ES5")))
#'
#' @export
typescript <- function(input, options = NULL) {
  if (file.exists(input)) {
    input <- paste(readLines(input, warn = FALSE), collapse = "\n")
  }
  if (!isTRUE(ctx_typescript$get("typescript_loaded"))) {
    ctx_typescript$source(system.file("js", paste0("typescript.", .TYPESCRIPT_VERSION, ".js"), package = "jsutils", mustWork = TRUE))
    ctx_typescript$assign("typescript_loaded", TRUE)
  }
  res <- ctx_typescript$call("ts.transpileModule", input, options)
  if (!is.null(res$error)) {
    stop(res$error$message, call. = FALSE)
  }
  res
}
