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
#> [1] "1.94.2"
#> 
#> $terser
#> [1] "5.44.1"
#> 
#> $typescript
#> [1] "5.9.3"
#> 
```
