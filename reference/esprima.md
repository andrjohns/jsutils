# Parse or Tokenize JavaScript code using Esprima

Use the Esprima library to parse or tokenize JavaScript code. Note that
the first time this function is called, it will load the esprima library
into the JavaScript context, which may take a few seconds. Subsequent
calls will be faster.

## Usage

``` r
esprima_parse(input, options = NULL, type = "script")

esprima_tokenize(input, options = list())
```

## Arguments

- input:

  Either a path to a file or a character string containing the
  JavaScript code to be parsed or tokenized.

- options:

  A list of configuration options to pass to the Esprima parser or
  tokenizer.

- type:

  A character string specifying the type of code to parse: "script"
  (default) or "module".

## Value

For `esprima_parse`, a list representing the Abstract Syntax Tree (AST)
of the parsed code. For `esprima_tokenize`, a list of tokens extracted
from the input code.

## Examples

``` r
js_code <- 'const answer = 42;'
esprima_parse(js_code)
#> $type
#> [1] "Program"
#> 
#> $body
#> $body[[1]]
#> $body[[1]]$type
#> [1] "VariableDeclaration"
#> 
#> $body[[1]]$declarations
#> $body[[1]]$declarations[[1]]
#> $body[[1]]$declarations[[1]]$type
#> [1] "VariableDeclarator"
#> 
#> $body[[1]]$declarations[[1]]$id
#> $body[[1]]$declarations[[1]]$id$type
#> [1] "Identifier"
#> 
#> $body[[1]]$declarations[[1]]$id$name
#> [1] "answer"
#> 
#> 
#> $body[[1]]$declarations[[1]]$init
#> $body[[1]]$declarations[[1]]$init$type
#> [1] "Literal"
#> 
#> $body[[1]]$declarations[[1]]$init$value
#> [1] 42
#> 
#> $body[[1]]$declarations[[1]]$init$raw
#> [1] "42"
#> 
#> 
#> 
#> 
#> $body[[1]]$kind
#> [1] "const"
#> 
#> 
#> 
#> $sourceType
#> [1] "script"
#> 
esprima_tokenize(js_code)
#> [[1]]
#> [[1]]$type
#> [1] "Keyword"
#> 
#> [[1]]$value
#> [1] "const"
#> 
#> 
#> [[2]]
#> [[2]]$type
#> [1] "Identifier"
#> 
#> [[2]]$value
#> [1] "answer"
#> 
#> 
#> [[3]]
#> [[3]]$type
#> [1] "Punctuator"
#> 
#> [[3]]$value
#> [1] "="
#> 
#> 
#> [[4]]
#> [[4]]$type
#> [1] "Numeric"
#> 
#> [[4]]$value
#> [1] "42"
#> 
#> 
#> [[5]]
#> [[5]]$type
#> [1] "Punctuator"
#> 
#> [[5]]$value
#> [1] ";"
#> 
#> 
```
