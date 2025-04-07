#' Emoji for Git Commit
#'
#' Get emoji for Git commit messages.
#'
#' @param name The emoji name.
#'
#' @return Emoji string for use in git commit messages.
#' @export
#'
#' @examples
#' # git_emoji("fire")
#' # git_emoji("heart")
git_emoji <- function(name) {
  if (!name %in% names(emoji_dict)) {
    stop("Emoji name not found.")
  }
  return(emoji_dict[[name]])
}
