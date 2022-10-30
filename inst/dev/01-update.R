library(devtools)
library(usethis)
library(roxygen2)

## workflow
document()
check()
load_all()
build()

## add and import packages
usethis::use_package("png")
