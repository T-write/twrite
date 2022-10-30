#' Create Twrite project folder and file structure
#'
#' @description
#' The `twriteproject` function will create the folder and file structure
#' of a T-write project.
#'
#' @return Folder and file structure for a T-write project
#' @export twriteproject
#'
#' @examples
#' \dontrun{
#' twriteproject()
#' }
twriteproject <- function(){

  ## create folders
  dir.create("data", showWarnings = FALSE)
  dir.create("output", showWarnings = FALSE)

  ## create files
  file.create("01-samplesize.R", showWarnings = FALSE)
  file.create("02-datamanagement.R", showWarnings = FALSE)
  file.create("03-dataanalysis.R", showWarnings = FALSE)
}
