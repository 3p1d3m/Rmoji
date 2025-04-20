#' Emoji for Git Commit
#'
#' Get emoji(s) for Git commit messages by name.
#'
#' @param name A character vector of emoji names (e.g., \code{"fire"}, \code{"heart"}, or country names).
#'
#' @return A named character vector of emojis.
#' @export
#'
#' @examples
#' git_emoji("fire")
#' git_emoji(c("fire", "heart"))
#' try(git_emoji(c("Ethiopia", "UK", "Kenya")))
git_emoji <- function(name) {
  missing <- setdiff(name, names(emoji_dict))

  if (length(missing) > 0) {
    stop("Emoji name(s) not found: ", paste(missing, collapse = ", "))
  }

  return(emoji_dict[name])
}
