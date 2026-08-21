# Get versions of bundled JavaScript libraries

This function returns the versions of the bundled JavaScript libraries
used in the package.

## Usage

``` r
js_versions()
```

## Value

A named list with the versions of Esprima, sass.js, Terser, and
TypeScript.

## Examples

``` r
js_versions()
#> $esprima
#> [1] "4.0.1"
#> 
#> $sass
#> [1] "1.103.1"
#> 
#> $terser
#> [1] "5.50.0"
#> 
#> $typescript
#> [1] "6.0.3"
#> 
```
