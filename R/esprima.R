#' @title Parse or Tokenize JavaScript code using Esprima
#' @name esprima
#'
#' @description Use the Esprima library to parse or tokenize JavaScript code. Note that the
#' first time this function is called, it will load the esprima library into the JavaScript context,
#' which may take a few seconds. Subsequent calls will be faster.
#'
#' @param input Either a path to a file or a character string containing the JavaScript code to be parsed or tokenized.
#' @param options A list of configuration options to pass to the Esprima parser or tokenizer.
#' @param type A character string specifying the type of code to parse: "script" (default) or "module".
#'
#' @return For `esprima_parse`, a list representing the Abstract Syntax Tree (AST) of the parsed code.
#' For `esprima_tokenize`, a list of tokens extracted from the input code.
#' @examples
#' js_code <- 'const answer = 42;'
#' esprima_parse(js_code)
#' esprima_tokenize(js_code)
NULL

#' @rdname esprima
#' @export
esprima_parse <- function(input, options = NULL, type = "script") {
  if (file.exists(input)) {
    input <- paste(readLines(input, warn = FALSE), collapse = "\n")
  }
  if (!(type %in% c("script", "module"))) {
    stop("type must be 'script' or 'module'", call. = FALSE)
  }
  if (!isTRUE(ctx_esprima$get("esprima_loaded"))) {
    ctx_esprima$source(system.file("js", paste0("esprima.", .ESPRIMA_VERSION, ".js"), package = "jsutils", mustWork = TRUE))
    ctx_esprima$assign("esprima_loaded", TRUE)
  }
  fun <- ifelse(type == "script", "esprima.parseScript", "esprima.parseModule")
  res <- ctx_esprima$call(fun, input, options)
  if (!is.null(res$error)) {
    stop(res$error$message, call. = FALSE)
  }
  res
}

#' @rdname esprima
#' @export
esprima_tokenize <- function(input, options = list()) {
  if (file.exists(input)) {
    input <- paste(readLines(input, warn = FALSE), collapse = "\n")
  }
  if (!isTRUE(ctx_esprima$get("esprima_loaded"))) {
    ctx_esprima$source(system.file("js", paste0("esprima.", .ESPRIMA_VERSION, ".js"), package = "jsutils", mustWork = TRUE))
    ctx_esprima$assign("esprima_loaded", TRUE)
  }
  res <- ctx_esprima$call("esprima.tokenize", input, options)
  if (!is.null(res$error)) {
    stop(res$error$message, call. = FALSE)
  }
  res
}
