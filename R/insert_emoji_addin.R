#' Insert Emoji Addin for RStudio
#'
#' This RStudio addin allows users to easily insert emojis by name into their R scripts, R Markdown, or Quarto documents.
#' A popup will appear, prompting the user to enter the name of an emoji. If the emoji name is valid, the corresponding emoji will be inserted at the cursor's position in the active editor.
#'
#' @return Inserts the selected emoji at the cursor position in the active R script or R Markdown document.
#' @export
#'
#' @examples
#' # Use this addin by running insert_emoji_addin() from the RStudio Addins menu.
#' # A prompt will appear where you can type an emoji name like "smile" or "heart" to insert it.
insert_emoji_addin <- function() {
  # Check if RStudio is available
  if (!rstudioapi::isAvailable()) {
    stop("This addin requires RStudio.")
  }

  # Ask user to input emoji name
  emoji_name <- rstudioapi::showPrompt(
    title = "Insert Emoji",
    message = "Enter emoji name:",
    default = ""
  )

  # Check if the emoji name is valid
  if (!is.null(emoji_name) && emoji_name %in% names(emoji_dict)) {
    emoji <- emoji_dict[[emoji_name]]

    # Insert the emoji at the cursor position
    rstudioapi::insertText(text = emoji)
  } else {
    message("Invalid or no emoji selected.")
  }
}
