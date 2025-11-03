.ESPRIMA_VERSION <- ""
.SASS_VERSION <- ""
.TERSER_VERSION <- ""
.TYPESCRIPT_VERSION <- ""

#' Get versions of bundled JavaScript libraries
#'
#' This function returns the versions of the bundled JavaScript libraries used in the package.
#'
#' @return A named list with the versions of Esprima, sass.js, Terser, and TypeScript.
#' @examples
#' js_versions()
#' @export
js_versions <- function() {
  list(
    esprima = .ESPRIMA_VERSION,
    sass = .SASS_VERSION,
    terser = .TERSER_VERSION,
    typescript = .TYPESCRIPT_VERSION
  )
}
