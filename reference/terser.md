# Minify JavaScript code using Terser

Uses the Terser JavaScript library to minify JavaScript code. Note that
the first time this function is called, it will load the terser library
into the JavaScript context, which may take a few seconds. Subsequent
calls will be faster.

## Usage

``` r
terser(input, options = NULL)
```

## Arguments

- input:

  Either a path to a file or a character string containing the
  JavaScript code to be minified.

- options:

  A list of options to pass to Terser for minification. See the [Terser
  documentation](https://terser.org/docs/api-reference/#minify-options)
  for available options.

## Value

A list containing the minified code and any warnings or errors.

## Examples

``` r
js_code <- "function add(a, b) { return a + b; }"
terser(js_code, list(sourceMap = TRUE))
#> $code
#> [1] "function add(n,d){return n+d}"
#> 
#> $map
#> [1] "{\"version\":3,\"names\":[\"add\",\"a\",\"b\"],\"sources\":[\"0\"],\"mappings\":\"AAAA,SAASA,IAAIC,EAAGC,GAAK,OAAOD,EAAIC,CAAG\",\"ignoreList\":[]}"
#> 
#> $decoded_map
#> $decoded_map$version
#> [1] 3
#> 
#> $decoded_map$names
#> [1] "add" "a"   "b"  
#> 
#> $decoded_map$sources
#> [1] "0"
#> 
#> $decoded_map$mappings
#> $decoded_map$mappings[[1]]
#> $decoded_map$mappings[[1]][[1]]
#> [1] 0 0 0 0
#> 
#> $decoded_map$mappings[[1]][[2]]
#> [1] 9 0 0 9 0
#> 
#> $decoded_map$mappings[[1]][[3]]
#> [1] 13  0  0 13  1
#> 
#> $decoded_map$mappings[[1]][[4]]
#> [1] 15  0  0 16  2
#> 
#> $decoded_map$mappings[[1]][[5]]
#> [1] 18  0  0 21
#> 
#> $decoded_map$mappings[[1]][[6]]
#> [1] 25  0  0 28  1
#> 
#> $decoded_map$mappings[[1]][[7]]
#> [1] 27  0  0 32  2
#> 
#> $decoded_map$mappings[[1]][[8]]
#> [1] 28  0  0 35
#> 
#> 
#> 
#> $decoded_map$ignoreList
#> logical(0)
#> 
#> 
```
