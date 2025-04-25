#' Emoji Shortcut Function (to work with keyboard shortcut)
#'
#' Designed to be bound to a keyboard shortcut.
#'
#' @return Opens addin popup for emoji selection.
#' @export
#'
#' @examples
#' if (interactive()) {
#'   emoji_shortcut()
#' }
emoji_shortcut <- function() {
  insert_emoji_addin()
}

