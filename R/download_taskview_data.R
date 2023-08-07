#' Downloads Task View data
#'
#' This is a modification of the RWsearch::tvdb_down function, this modified version does not save a file to disk.
#' Default option is to extract Task View data from CRAN Task View repository: "https://cran.rstudio.com/src/contrib/Views.rds"
#'
#' This function also exists in the CTVsuggestTrain package, [CTVsuggestTrain:::download_taskview_data()], I have copied the code to the CTVsuggest package to avoid dependencies.
#'
#' @param repos Default option set to the CRAN repository "https://cran.rstudio.com/".
#'
#' @return Data of the current Task Views available.
#'
#'

download_taskview_data = function(repos = getOption("repos")[1]){
  urlrds <- paste0(repos, "/src/contrib/Views.rds")
  dest <- tempfile()
  trdl <- RWsearch:::trydownloadurl(urlrds, dest)
  if (trdl != 0) {
    message(paste("File does not exist:", urlrds))
    message("Is your repository out of service? Check with cranmirrors_down().")
    return(invisible(NULL))
  }
  tvdb <- readRDS(dest)
  names(tvdb) <- ntv <- sapply(tvdb, function(x) x$name)
  tvdb <- tvdb[sort(ntv)]
  return(tvdb)
}
