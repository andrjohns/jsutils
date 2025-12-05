# jsutils

The `jsutils` package provides a portable collection of JavaScript
utility functions and libraries for R users. The package currently
provides bindings to the following JavaScript libraries:

- `esprima`: Tokeniser and Parser for JavaScript
- `sass`: A CSS preprocessor, compiling SCSS or SASS files to CSS
- `terser`: A minifier/mangler for JavaScript code
- `typescript`: A superset of JavaScript that compiles to clean
  JavaScript output

## Installation

You can install the development version of jsutils from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("andrjohns/jsutils")
```

## Example

### `sass`: A CSS preprocessor

The `sass` function compiles SCSS or SASS code to CSS:

``` r
library(jsutils)

scss_code <- "h1 { font-size: 40px; code { font-face: Roboto Mono; } }"

# Compile SCSS code to CSS
sass(scss_code)
#> $css
#> [1] "h1 {\n  font-size: 40px;\n}\nh1 code {\n  font-face: Roboto Mono;\n}"
#> 
#> $loadedUrls
#> logical(0)

# With options
sass(scss_code, options = list(style = "compressed"))
#> $css
#> [1] "h1{font-size:40px}h1 code{font-face:Roboto Mono}"
#> 
#> $loadedUrls
#> logical(0)
```

### `terser`: A minifier/mangler for JavaScript code

The `terser` function minifies JavaScript code:

``` r
js_code <- "function hello() { console.log('Hello, world!'); }"

# Minify JavaScript code
terser(js_code)
#> $code
#> [1] "function hello(){console.log(\"Hello, world!\")}"

# With options
terser(js_code, list(mangle=list(toplevel = TRUE)))
#> $code
#> [1] "function o(){console.log(\"Hello, world!\")}"
```

### `typescript`: A superset of JavaScript that compiles to clean JavaScript output

The `typescript` function compiles TypeScript code to JavaScript:

``` r
ts_code <- "let arrow_func = (msg: string): void => { console.log(msg); };"

# Compile TypeScript code to JavaScript
typescript(ts_code)
#> $outputText
#> [1] "var arrow_func = function (msg) { console.log(msg); };\n"
#> 
#> $diagnostics
#> logical(0)
#> 
#> $sourceMapText
#> NULL

# With options
typescript(ts_code, options = list(compilerOptions = list(target = "ES2015")))
#> $outputText
#> [1] "let arrow_func = (msg) => { console.log(msg); };\n"
#> 
#> $diagnostics
#> logical(0)
#> 
#> $sourceMapText
#> NULL
```

### `esprima`: Tokeniser and Parser for JavaScript

Separate `esprima_parse` and `esprima_tokenize` functions are provided
to parse or tokenize JavaScript code respectively:

``` r
js_code <- "function hello() { console.log('Hello, world!'); }"

# Parse JavaScript code
esprima_parse(js_code)
#> $type
#> [1] "Program"
#> 
#> $body
#> $body[[1]]
#> $body[[1]]$type
#> [1] "FunctionDeclaration"
#> 
#> $body[[1]]$id
#> $body[[1]]$id$type
#> [1] "Identifier"
#> 
#> $body[[1]]$id$name
#> [1] "hello"
#> 
#> 
#> $body[[1]]$params
#> logical(0)
#> 
#> $body[[1]]$body
#> $body[[1]]$body$type
#> [1] "BlockStatement"
#> 
#> $body[[1]]$body$body
#> $body[[1]]$body$body[[1]]
#> $body[[1]]$body$body[[1]]$type
#> [1] "ExpressionStatement"
#> 
#> $body[[1]]$body$body[[1]]$expression
#> $body[[1]]$body$body[[1]]$expression$type
#> [1] "CallExpression"
#> 
#> $body[[1]]$body$body[[1]]$expression$callee
#> $body[[1]]$body$body[[1]]$expression$callee$type
#> [1] "MemberExpression"
#> 
#> $body[[1]]$body$body[[1]]$expression$callee$computed
#> [1] FALSE
#> 
#> $body[[1]]$body$body[[1]]$expression$callee$object
#> $body[[1]]$body$body[[1]]$expression$callee$object$type
#> [1] "Identifier"
#> 
#> $body[[1]]$body$body[[1]]$expression$callee$object$name
#> [1] "console"
#> 
#> 
#> $body[[1]]$body$body[[1]]$expression$callee$property
#> $body[[1]]$body$body[[1]]$expression$callee$property$type
#> [1] "Identifier"
#> 
#> $body[[1]]$body$body[[1]]$expression$callee$property$name
#> [1] "log"
#> 
#> 
#> 
#> $body[[1]]$body$body[[1]]$expression$arguments
#> $body[[1]]$body$body[[1]]$expression$arguments[[1]]
#> $body[[1]]$body$body[[1]]$expression$arguments[[1]]$type
#> [1] "Literal"
#> 
#> $body[[1]]$body$body[[1]]$expression$arguments[[1]]$value
#> [1] "Hello, world!"
#> 
#> $body[[1]]$body$body[[1]]$expression$arguments[[1]]$raw
#> [1] "'Hello, world!'"
#> 
#> 
#> 
#> 
#> 
#> 
#> 
#> $body[[1]]$generator
#> [1] FALSE
#> 
#> $body[[1]]$expression
#> [1] FALSE
#> 
#> $body[[1]]$async
#> [1] FALSE
#> 
#> 
#> 
#> $sourceType
#> [1] "script"

# Tokenize JavaScript code
esprima_tokenize(js_code)
#> [[1]]
#> [[1]]$type
#> [1] "Keyword"
#> 
#> [[1]]$value
#> [1] "function"
#> 
#> 
#> [[2]]
#> [[2]]$type
#> [1] "Identifier"
#> 
#> [[2]]$value
#> [1] "hello"
#> 
#> 
#> [[3]]
#> [[3]]$type
#> [1] "Punctuator"
#> 
#> [[3]]$value
#> [1] "("
#> 
#> 
#> [[4]]
#> [[4]]$type
#> [1] "Punctuator"
#> 
#> [[4]]$value
#> [1] ")"
#> 
#> 
#> [[5]]
#> [[5]]$type
#> [1] "Punctuator"
#> 
#> [[5]]$value
#> [1] "{"
#> 
#> 
#> [[6]]
#> [[6]]$type
#> [1] "Identifier"
#> 
#> [[6]]$value
#> [1] "console"
#> 
#> 
#> [[7]]
#> [[7]]$type
#> [1] "Punctuator"
#> 
#> [[7]]$value
#> [1] "."
#> 
#> 
#> [[8]]
#> [[8]]$type
#> [1] "Identifier"
#> 
#> [[8]]$value
#> [1] "log"
#> 
#> 
#> [[9]]
#> [[9]]$type
#> [1] "Punctuator"
#> 
#> [[9]]$value
#> [1] "("
#> 
#> 
#> [[10]]
#> [[10]]$type
#> [1] "String"
#> 
#> [[10]]$value
#> [1] "'Hello, world!'"
#> 
#> 
#> [[11]]
#> [[11]]$type
#> [1] "Punctuator"
#> 
#> [[11]]$value
#> [1] ")"
#> 
#> 
#> [[12]]
#> [[12]]$type
#> [1] "Punctuator"
#> 
#> [[12]]$value
#> [1] ";"
#> 
#> 
#> [[13]]
#> [[13]]$type
#> [1] "Punctuator"
#> 
#> [[13]]$value
#> [1] "}"
```
