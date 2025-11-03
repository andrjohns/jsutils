.onLoad <- function(libname, pkgname) {
  for (lib in c("terser", "sass", "esprima", "typescript")) {
    assign(paste0("ctx_", lib), QuickJSR::JSContext$new(stack_size = 10 * 1024 * 1024), envir = topenv())
  }
}
