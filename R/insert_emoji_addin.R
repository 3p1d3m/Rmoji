#' Insert Emoji Addin for RStudio
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
