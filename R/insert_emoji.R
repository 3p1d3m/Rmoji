#' Insert Emoji into R Script using a function
#'
#' Inserts an emoji by name from the emoji_dict through writing the function in the cursor position of the Rstudio Document.
#'
#' @param name The name of the emoji (case-insensitive).
#' @param default A default emoji to use if the name is not found.
#' @return The emoji used (invisibly).
#' @export
#'
#' @examples
#' if (interactive()) {
#'   insert_emoji("smile")
#'   insert_emoji("notarealemoji", default = "?")
#' }
insert_emoji <- function(name, default = NULL) {
  name <- tolower(name)
  if (!name %in% names(emoji_dict)) {
    if (!is.null(default)) {
      rstudioapi::insertText(text = default)
      return(invisible(default))
    } else {
      stop("Emoji name not found.")
    }
  }
  emoji <- emoji_dict[[name]]
  rstudioapi::insertText(text = emoji)
  invisible(emoji)
}

