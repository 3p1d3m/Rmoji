
#' Insert Emoji into R Script
#'
#' Inserts an emoji by name from the emoji_dict.
#'
#' @param name The name of the emoji (e.g. "smile").
#'
#' @return Inserts the emoji at cursor in RStudio.
#' @export
#'
#' @examples
#' # insert_emoji("start")
insert_emoji <- function(name) {
  if (!name %in% names(emoji_dict)) {
    stop("Emoji name not found.")
  }
  emoji <- emoji_dict[[name]]
  rstudioapi::insertText(text = emoji)
}

