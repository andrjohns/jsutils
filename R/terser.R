#' Minify JavaScript code using Terser
#'
#' This function uses the Terser JavaScript library to minify JavaScript code.
#' It leverages the QuickJSR package to run JavaScript code within R.
#'
#' @param code A character string containing the JavaScript code to be minified.
#' @param options A list of options to pass to Terser for minification.
#' See the [Terser documentation](https://terser.org/docs/api-reference#minify-options) for available options.
#'
#' @return A list containing the minified code and any warnings or errors.
#' @examples
#' js_code <- "function add(a, b) { return a + b; }"
#' terser(js_code, list(sourceMap = TRUE))
#'
#' @export
terser <- function(code, options = list()) {
  if (!ctx_terser$get("terser_loaded")) {
    ctx_terser$source(system.file("js", "terser.js", package = "jsutils", mustWork = TRUE))
    ctx_terser$assign("terser_loaded", TRUE)
  }
  res <- ctx_terser$call("terser.minify_sync", code, options)
  if (!is.null(res$error)) {
    stop(res$error$message, call. = FALSE)
  }
  res
}
