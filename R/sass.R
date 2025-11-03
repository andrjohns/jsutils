#' Compile SASS/SCSS to CSS using the sass.js library
#'
#' This function uses the sass.js library to compile SASS/SCSS code into CSS.
#' It leverages the QuickJSR package to run JavaScript code within R.
#'
#' @param input A character string containing the SASS/SCSS code to be compiled.
#' @param options A list of options to pass to the sass.js compiler.
#'
#' @return A list containing the compiled CSS code and any warnings or errors.
#' @examples
#' scss_code <- "h1 { font-size: 40px; code { font-face: Roboto Mono; } }"
#' sass(scss_code, list(style = "compressed"))
#'
#' @export
sass <- function(input, options = list()) {
  if (!isTRUE(ctx_sass$get("sass_loaded"))) {
    # https://github.com/dart-lang/sdk/issues/27979
    ctx_sass$source(code=paste0("globalThis.location = { href: '", getwd(), "' };"))
    ctx_sass$source(system.file("js", paste0("sass.", .SASS_VERSION, ".js"), package = "jsutils", mustWork = TRUE))
    ctx_sass$assign("sass_loaded", TRUE)
  }
  res <- ctx_sass$call("sass.compileString", input, options)
  if (!is.null(res$error)) {
    stop(res$error$message, call. = FALSE)
  }
  res
}
