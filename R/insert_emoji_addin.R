#' For an R studio addin dropdown to insert emoji
#'
#' @param test_input For internal testing. If supplied, this will be used instead of prompting the user.
#' @return Inserted emoji or NULL
#' @export
insert_emoji_addin <- function(test_input = NULL) {
  if (!rstudioapi::isAvailable() && is.null(test_input)) {
    stop("This addin requires RStudio.")
  }

  emoji_name <- if (!is.null(test_input)) {
    test_input
  } else {
    rstudioapi::showPrompt(
      title = "Insert Emoji",
      message = "Enter emoji name:",
      default = ""
    )
  }

  emoji_name <- tolower(emoji_name)

  if (!is.null(emoji_name) && emoji_name %in% names(emoji_dict)) {
    emoji <- emoji_dict[[emoji_name]]
    if (is.null(test_input)) {
      rstudioapi::insertText(text = emoji)
    }
    return(emoji)
  } else {
    message("Invalid or no emoji selected.")
    return(NULL)
  }
}
#' @examples
#' # Interactive Example: Will prompt the user to enter an emoji name in RStudio
#' # The function will insert the emoji at the cursor position if the name is valid.
#' if (interactive()) {
#'   insert_emoji_addin()  # Prompts for emoji name input in RStudio
#' }
#'
#' # Non-interactive Example: For testing purposes, inserts a predefined emoji
#' insert_emoji_addin(test_input = "smile")  # Inserts the smile emoji
