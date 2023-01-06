#' Output CRAN Task View suggestions
#'
#' The `CTVsuggest()` function takes a Task View name and argument `n`,
#' then outputs a [data.frame] containing the top `n` recommendations for the chosen Task View.
#'
#' The predicted probabilities are computed from the model object constructed with the [`CTVsuggestTrain::Train_model()`](https://dylandijk.github.io/CTVsuggestTrain/reference/Train_model.html) function.
#'
#' @param taskview A character vector with one element, must be one of the [Task Views available](https://github.com/cran-task-views/ctv#available-task-views)
#' @param n An integer that decides the number of suggestions to show.
#'
#' @return A [data.frame] with suggested packages and there classification probability.
#'
#' @export
#'
#'
#' @examples
#' CTVsuggest(taskview = "Econometrics", n = 5)
#'
#'
#'


CTVsuggest = function(taskview = "Econometrics", n = 5){


load(url("https://github.com/DylanDijk/CTVsuggestTrain/blob/main/OUTPUT/predicted_probs_for_suggestions.rda?raw=true"))

  suggestions = predicted_probs_for_suggestions[,c(paste0(taskview), "Packages"), drop = F][order(predicted_probs_for_suggestions[,paste0(taskview)], decreasing = T),, drop = F][1:n,]
  return(suggestions)
}

# load(url("https://github.com/DylanDijk/CTVsuggestTrain/blob/main/OUTPUT/model_accuracy.rda?raw=true"))
