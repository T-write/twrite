#' Twrite Discrete Color Palettes
#'
#' Color palettes inspired by the housestyle of Twrite
#'
#' @param palette Palette type.
#' Currently there are four available general options:
#' \code{"default", "contrast", "GnRd", "PuBl"} containing all or a subset of the palette
#' (The default package is a 14-color palette inspired by \emph{Twrite}).
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#' @param reverse Logical. Should the order of the colors be reversed?
#'
#' @export pal_twrite
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom scales manual_pal
#'
#' @examples
#' \dontrun{library("scales")
#' show_col(pal_twrite("default")(14))
#' show_col(pal_twrite("default", alpha = 0.6)(14))}
pal_twrite <- function(palette = c("default", "sex", "region", "cat5", "cat10"),
                          alpha = 1, reverse = FALSE) {

  palette <- match.arg(palette)
  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- twrite_col_d[[palette]]
  raw_cols_rgb <- grDevices::col2rgb(raw_cols)
  alpha_cols <- grDevices::rgb(
    raw_cols_rgb[1L, ], raw_cols_rgb[2L, ], raw_cols_rgb[3L, ],
    alpha = alpha * 255L, names = names(raw_cols),
    maxColorValue = 255L
  )

  if (reverse) alpha_cols <- rev(alpha_cols)

  scales::manual_pal(unname(alpha_cols))
}

#' Twrite Discrete Color/Colour Scales
#'
#' See \code{\link{pal_twrite}} for details.
#'
#' @inheritParams pal_twrite
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_twrite
#'
#' @importFrom ggplot2 discrete_scale
#'
#' @rdname scale_twrite
#'
#' @examples
#' \dontrun{library("ggplot2")
#' data("diamonds")
#'
#' ggplot(
#'   subset(diamonds, carat >= 2.2),
#'   aes(x = table, y = price, colour = cut)
#' ) +
#'   geom_point(alpha = 0.7) +
#'   geom_smooth(method = "loess", alpha = 0.1, size = 1, span = 1) +
#'   theme_bw() + scale_color_twrite()
#'
#' ggplot(
#'   subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
#'   aes(x = depth, fill = cut)
#' ) +
#'   geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
#'   theme_bw() + scale_fill_twrite()}
scale_color_twrite <- function(palette = c("default", "sex", "region", "cat5", "cat10"),
                                  alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  discrete_scale("colour", "twrite", pal_twrite(palette, alpha, reverse), ...)
}

#' @export scale_colour_twrite
#' @rdname scale_twrite
scale_colour_twrite <- scale_color_twrite

#' @export scale_fill_twrite
#' @importFrom ggplot2 discrete_scale
#' @rdname scale_twrite
scale_fill_twrite <- function(palette = c("default", "sex", "region", "cat5", "cat10"),
                                 alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  discrete_scale("fill", "twrite", pal_twrite(palette, alpha, reverse), ...)
}

#' Twrite Continuous Color Palettes
#'
#' @param palette Palette type.
#' There are 3 available options:
#' \itemize{
#' \item \code{"red"}
#' \item \code{"green"}
#' \item \code{"red-yellow-green"}}
#' @param n Number of individual colors to be generated.
#' @param alpha Transparency level, a real number in (0, 1].
#' See \code{alpha} in \code{\link[grDevices]{rgb}} for details.
#' @param reverse Logical. Should the order of the colors be reversed?
#'
#' @export rgb_twrite_c
#'
#' @importFrom grDevices colorRamp rgb
#' @importFrom scales manual_pal
#' @importFrom grDevices colorRampPalette
#'
#' @examples
#' \dontrun{library("scales")
#' show_col(rgb_twrite_c("red")(10))
#' show_col(rgb_twrite_c("red", n = 30, alpha = 0.6, reverse = TRUE)(30))}
rgb_twrite_c <- function(palette = c("red", "green", "red-yellow-green"),
                            n = 10, alpha = 1, reverse = FALSE) {

  palette <- match.arg(palette)

  if (alpha > 1L | alpha <= 0L) stop("alpha must be in (0, 1]")

  raw_cols <- twrite_col_c[[palette]]
  func_cols <- colorRamp(raw_cols, space = "Lab", interpolate = "spline")
  mat_cols <- func_cols(seq(0L, 1L, length.out = n))
  alpha_cols <- rgb(
    mat_cols[, 1L], mat_cols[, 2L], mat_cols[, 3L],
    alpha = alpha * 255L, maxColorValue = 255L
  )

  if (reverse) alpha_cols <- rev(alpha_cols)

  alpha_cols
}

#' Twrite Continuous Color Palettes
#'
#' @inheritParams rgb_twrite_c
#'
#' @export pal_twrite_c
#'
#' @importFrom scales manual_pal
#'
#' @examples
#' \dontrun{library("scales")
#' show_col(pal_twrite("red-yellow-green")(10))
#' show_col(pal_twrite("red-yellow-green", n = 30, alpha = 0.6, reverse = TRUE)(30))}
pal_twrite_c <- function(
  palette = c("red", "green", "red-yellow-green"),
  n = 10, alpha = 1, reverse = FALSE) {
  palette <- match.arg(palette)

  alpha_cols <- rgb_twrite_c(palette, n, alpha, reverse)
  manual_pal(unname(alpha_cols))
}

#' Twrite Continuous Color Scales
#'
#' See \code{\link{pal_twrite_c}} for details.
#'
#' @inheritParams pal_twrite_c
#' @param ... additional parameters for \code{\link[ggplot2]{discrete_scale}}
#'
#' @export scale_color_twrite_c
#'
#' @importFrom ggplot2 scale_color_gradientn
#'
#' @rdname scale_twrite_c
#'
#' @examples
#' \dontrun{library("ggplot2")
#' library("reshape2")
#' data("mtcars")
#'
#' cor <- abs(cor(mtcars))
#' cor_melt <- melt(cor)
#'
#' ggplot(
#'   cor_melt,
#'   aes(x = Var1, y = Var2, fill = value)
#' ) +
#'   geom_tile(colour = "black", size = 0.3) +
#'   theme_bw() + scale_fill_twritec("red-yellow-green")}
scale_color_twrite_c <- function(
  palette = c("red", "green", "red-yellow-green"),
  alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  scale_color_gradientn(
    colours = rgb_twrite_c(
      palette,
      n = 512, alpha = alpha, reverse = reverse
    ),
    ...
  )
}

#' @export scale_colour_twrite_c
#' @rdname scale_twrite_c
scale_colour_twrite_c <- scale_color_twrite_c

#' @export scale_fill_twrite_c
#' @importFrom ggplot2 scale_fill_gradientn
#' @rdname scale_twrite_c
scale_fill_twrite_c <- function(
  palette = c("red", "green", "red-yellow-green"),
  alpha = 1, reverse = FALSE, ...) {
  palette <- match.arg(palette)
  scale_fill_gradientn(
    colours = rgb_twrite_c(
      palette,
      n = 512, alpha = alpha, reverse = reverse
    ),
    ...
  )
}
