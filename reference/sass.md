# Compile SASS/SCSS to CSS using the sass.js library

This function uses the sass.js library to compile SASS/SCSS code into
CSS. It leverages the QuickJSR package to run JavaScript code within R.
Note that the first time this function is called, it will load the
sass.js library into the JavaScript context, which may take a few
seconds. Subsequent calls will be faster.

## Usage

``` r
sass(input, options = NULL)
```

## Arguments

- input:

  Either a path to a file or a character string containing the SASS/SCSS
  code to be compiled.

- options:

  A list of options to pass to the sass.js compiler.

## Value

A list containing the compiled CSS code and any warnings or errors.

## Examples

``` r
scss_code <- "h1 { font-size: 40px; code { font-face: Roboto Mono; } }"
sass(scss_code, list(style = "compressed"))
#> $css
#> [1] "h1{font-size:40px}h1 code{font-face:Roboto Mono}"
#> 
#> $loadedUrls
#> logical(0)
#> 
```
