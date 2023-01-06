
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CTVsuggest

<!-- badges: start -->

[![R-CMD-check](https://github.com/DylanDijk/CTVsuggest/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/DylanDijk/CTVsuggest/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The aim of CTVsuggest is to provide recommendations for packages to be
added to available [CRAN Task
Views](https://github.com/cran-task-views/ctv#available-task-views).

The CTVsuggest R package has a single simple function: `CTVsuggest()`,
that outputs package suggestions.

The model training is carried out by the
[CTVsuggestTrain](https://dylandijk.github.io/CTVsuggestTrain/) package,
for further detail on the workflow view the [Packages Workflow
Section](https://dylandijk.github.io/CTVsuggest/articles/CTVsuggest-Overview.html#the-package-workflow)
of the [CTVsuggest Overview
Vignette](https://dylandijk.github.io/CTVsuggest/articles/CTVsuggest-Overview.html).

## Installation

You can install the development version of CTVsuggest from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("DylanDijk/CTVsuggest")
```

## Example

`CTVsuggest()` function takes a Task View name (`taskview`) and `n` as
arguments. Then outputs a `data.frame` containing the top `n`
recommendations for the chosen Task View.

``` r
library(CTVsuggest)

CTVsuggest(taskview = "NaturalLanguageProcessing", n = 5)
#>                NaturalLanguageProcessing       Packages
#> LSX                            0.9981190            LSX
#> doc2vec                        0.9917591        doc2vec
#> jiebaRD                        0.9835720        jiebaRD
#> text.alignment                 0.9726128 text.alignment
#> R.temis                        0.9644548        R.temis
```
