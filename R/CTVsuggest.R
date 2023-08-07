#' Output CRAN Task View suggestions
#'
#' The `CTVsuggest()` function takes a Task View name and argument `n`,
#' then outputs a [data.frame] containing the top `n` recommendations for the chosen Task View.
#'
#' The predicted probabilities are computed from the model object constructed with the [`CTVsuggestTrain::Train_model()`](https://dylandijk.github.io/CTVsuggestTrain/reference/Train_model.html) function.
#'
#' @param taskview A character vector with one element, must be one of the [Task Views available](https://github.com/cran-task-views/ctv#available-task-views)
#' @param n An integer that decides the number of suggestions to show.
#' @param ignore A character vector of package names that you want to ignore from output suggestions.
#'
#' @return A [data.frame] with suggested packages and there classification probability.
#'
#' @export
#'
#'
#' @examples
#' # Output top 5 suggestions for the Econometrics Task View,
#' # whilst hiding the GVARX package from suggestions.
#' CTVsuggest(taskview = "Econometrics", n = 5, ignore = "GVARX")
#'
#' # Output predicted probabilities for the task view assignment of the doc2vec package
#' CTVsuggest(package = "doc2vec")


CTVsuggest = function(taskview = "Econometrics", n = 5, ignore = NULL, package = NA, ranktaskview = NA){

  if(!is.na(package)){
    # Outputting probability vector for a package

    load(url("https://github.com/DylanDijk/CTVsuggestTrain/blob/main/OUTPUT/predicted_probs_all.rda?raw=true"))

    package_prob = as.matrix(predicted_probs_all[package,-which(colnames(predicted_probs_all) == "Packages"), drop = F])
    package_prob = round(package_prob,4)
    package_prob = package_prob[,order(package_prob)]
    return(package_prob)

  } else if (!is.na(ranktaskview)) {
    # ranking packages within a Task View

    load(url("https://github.com/DylanDijk/CTVsuggestTrain/blob/main/OUTPUT/predicted_probs_all.rda?raw=true"))

    # need to load in packages from that Task View
    tvdb = CTVsuggest:::download_taskview_data()
    task_view_packages = Reduce(c,RWsearch::tvdb_pkgs(char = ranktaskview, tvdb = tvdb))
    task_view_packages = unique(task_view_packages)
    pckgs_ranked = predicted_probs_all[task_view_packages,ranktaskview, drop = F]
    pckgs_ranked = pckgs_ranked[order(pckgs_ranked[,paste0(ranktaskview)], decreasing = T),,drop = F]

  } else {
    # Outputting packages with highest probabilities for a Task View

    load(url("https://github.com/DylanDijk/CTVsuggestTrain/blob/main/OUTPUT/predicted_probs_for_suggestions.rda?raw=true"))

    suggestions = predicted_probs_for_suggestions[,c(paste0(taskview), "Packages"), drop = F][order(predicted_probs_for_suggestions[,paste0(taskview)], decreasing = T),, drop = F][1:(n+length(ignore)),]

      if(!is.null(ignore)){
        suggestions = suggestions[!(rownames(suggestions) %in% ignore),]
      }
    suggestions = suggestions[1:n,]

    return(suggestions)
  }
}

# load(url("https://github.com/DylanDijk/CTVsuggestTrain/blob/main/OUTPUT/model_accuracy.rda?raw=true"))
