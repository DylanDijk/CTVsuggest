#' Output suggestions for packages to be added to a Task View
#'
#' Outputs suggestions for packages to be added to a Task View.
#'
#' @param taskview A character vector with one element, must be one of the [Task Views available](https://github.com/cran-task-views/ctv#available-task-views)
#' @param n An integer that decides the number of suggestions to show.
#'
#' @return A data frame with suggested packages and there classification probability
#'
#'
#' @export
CTVsuggest = function(taskview = "Econometrics", n = 5){


load(url("https://github.com/DylanDijk/CRAN-Task-Views-Recommendations/blob/main/Output/predicted_probs_for_suggestions.rda?raw=true"))

  suggestions = predicted_probs_for_suggestions[,c(paste0(taskview), "Packages"), drop = F][order(predicted_probs_for_suggestions[,paste0(taskview)], decreasing = T),, drop = F][1:n,]
  return(suggestions)
}

