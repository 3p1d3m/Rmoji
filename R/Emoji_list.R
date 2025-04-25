#'  Print list of All Available Emoji names and actual emojis in the console
#'
#' Prints all emoji names with their corresponding emoji symbols from the master list.
#'
#' @return prints the name of the emoji and the emoji image in the console
#' @export
#'
#' @examples
#' emoji_list()
#'
emoji_list <- function() {
  cat("Available Emojis in Rmoji\n\n")
  for (name in names(emoji_dict)) {
    cat(sprintf("%-15s %s\n", name, emoji_dict[[name]]))
  }
}

