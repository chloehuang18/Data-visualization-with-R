# Chapter 7 Reading Notes 
### Devtools and Exploratory Data Analysis


### Usage
 All devtools functions accept a path as an argument, e.g. load_all("path/to/mypkg"). If you don't specify a path, devtools will look in the current working directory - this is a recommended practice.

#### Frequent development tasks:
* load_all() simulates installing and reloading your package, loading R code in R/, compiled shared objects in src/ and data files in data/. During development you would usually want to access all functions (even un-exported internal ones) so load_all() works as if all functions were exported in the package NAMESPACE.

* document() updates generated documentation in man/, file collation and NAMESPACE.

* test() reloads your code with load_all(), then runs all testthat tests.

* test_coverage() runs test coverage on your package with covr. This makes it easy to see what parts of your package could use more tests!

[more](https://github.com/r-lib/devtools)