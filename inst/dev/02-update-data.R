## code to prepare `DATASET` for the colours goes here

## create colour data ####
## .. Discrete colours ####
## .. .. general colours

## https://loading.io/color/feature/hootsuite/
default <-
  c("navyblue" = rgb(red = 0, green = 50, blue = 101, maxColorValue = 255),
    "beige" = rgb(red = 247, green = 232, blue = 213, maxColorValue = 255),
    "yellow" = rgb(red = 255, green = 189, blue = 10, maxColorValue = 255),
    "beige1" = rgb(red = 198, green = 175, blue = 146, maxColorValue = 255),
    "grey" = rgb(red = 113, green = 104, blue = 95, maxColorValue = 255),
    "brown" = rgb(red = 84, green = 73, blue = 63, maxColorValue = 255),
    "darkbrown" = rgb(red = 56, green = 50, blue = 45, maxColorValue = 255))

## https://loading.io/color/feature/delectable/
sex <-
  c("men" = rgb(red = 51, green = 72, blue = 88, maxColorValue = 255),
    "women" = rgb(red = 205, green = 89, blue = 90, maxColorValue = 255),
    "both" = rgb(red = 148, green = 147, blue = 143, maxColorValue = 255))

## Belgian colors
region <-
  c("belgium" = rgb(red = 0, green = 0, blue = 0, maxColorValue = 255),
    "brussels" = rgb(red = 3, green = 60, blue = 196, maxColorValue = 255),
    "flanders" = rgb(red = 253, green = 218, blue = 36, maxColorValue = 255),
    "wallonia" = rgb(red = 239, green = 51, blue = 64, maxColorValue = 255))

## https://loading.io/color/feature/hootsuite/
cat5  <-
  c("navyblue" = rgb(red = 0, green = 50, blue = 101, maxColorValue = 255),
    "beige" = rgb(red = 247, green = 232, blue = 213, maxColorValue = 255),
    "yellow" = rgb(red = 255, green = 189, blue = 10, maxColorValue = 255),
    "grey" = rgb(red = 113, green = 104, blue = 95, maxColorValue = 255),
    "brown" = rgb(red = 84, green = 73, blue = 63, maxColorValue = 255))

cat10 <-
  c("navyblue" = rgb(red = 0, green = 50, blue = 101, maxColorValue = 255),
    "beige" = rgb(red = 247, green = 232, blue = 213, maxColorValue = 255),
    "yellow" = rgb(red = 255, green = 189, blue = 10, maxColorValue = 255),
    "beige1" = rgb(red = 198, green = 175, blue = 146, maxColorValue = 255),
    "grey" = rgb(red = 113, green = 104, blue = 95, maxColorValue = 255),
    "brown" = rgb(red = 84, green = 73, blue = 63, maxColorValue = 255),
    "darkbrown" = rgb(red = 56, green = 50, blue = 45, maxColorValue = 255))

## .. Save the colours in a list
twrite_col_d <-
   list("default" = default,
        "sex" = sex,
        "region" = region,
        "cat5" = cat5,
        "cat10" = cat10)

## .. continuous colours ####
twrite_col_c <-
   list("green" = c("#F7FCF5", "#006D2C"),
        "red" = c("#FFF5F0", "#CB181D"),
        "red-yellow-green" = c("#D73027", "#F46D43", "#FDAE61", "#FEE08B",
                               "#FFFFBF", "#D9EF8B", "#A6D96A", "#66BD63",
                               "#1A9850"))

## .. .. examples of the colors
## .. .. a) GREEN
colfunc <- colorRampPalette(c("#006D2C", "#F7FCF5"))
scales::show_col(colfunc(100), labels = FALSE)

## .. .. b) RED
colfunc <- colorRampPalette(c("#CB181D", "#FFF5F0"))
scales::show_col(colfunc(100), labels = FALSE)

## .. .. c) GREEN - YELLOW - RED
colfunc <- colorRampPalette(c("#D73027", "#F46D43", "#FDAE61", "#FEE08B",
                              "#FFFFBF", "#D9EF8B", "#A6D96A", "#66BD63",
                              "#1A9850"))
scales::show_col(colfunc(1000), labels = FALSE)

## create example data (based on gaminder) ####
## create example dataset
# dta <- read_csv("https://raw.githubusercontent.com/open-numbers/ddf--gapminder--life_expectancy/master/ddf--datapoints--life_expectancy_at_birth--by--geo--time.csv")
# dta <- read_csv("https://burden.sciensano.be/shiny/daly/session/33266afb66727f845fe25968b354f344/download/downloadData?w=")
# dta <- readRDS("inst/extdata/BeBOD-COD-20220329.rds")

## save data
usethis::use_data(twrite_col_d, twrite_col_c, internal = TRUE, overwrite = TRUE)
