#' @title Minify JavaScript code using Terser
#'
#' @description Uses the Terser JavaScript library to minify JavaScript code. Note that the
#' first time this function is called, it will load the terser library into the JavaScript context,
#' which may take a few seconds. Subsequent calls will be faster.
#'
#' @param input Either a path to a file or a character string containing the JavaScript code to be minified.
#' @param options A list of options to pass to Terser for minification.
#' See the [Terser documentation](https://terser.org/docs/api-reference/#minify-options) for available options.
#'
#' @return A list containing the minified code and any warnings or errors.
#' @examples
#' js_code <- "function add(a, b) { return a + b; }"
#' terser(js_code, list(sourceMap = TRUE))
#'
#' @export
terser <- function(input, options = NULL) {
  if (file.exists(input)) {
    input <- paste(readLines(input, warn = FALSE), collapse = "\n")
  }
  if (!isTRUE(ctx_terser$get("terser_loaded"))) {
    ctx_terser$source(system.file("js", paste0("terser.", .TERSER_VERSION, ".js"), package = "jsutils", mustWork = TRUE))
    ctx_terser$assign("terser_loaded", TRUE)
  }
  res <- ctx_terser$call("terser.minify_sync", input, options)
  if (!is.null(res$error)) {
    stop(res$error$message, call. = FALSE)
  }
  res
}
