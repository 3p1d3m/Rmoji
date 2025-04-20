#' Insert Emoji Addin for RStudio (with Searchable Dropdown)
#'
#' This RStudio addin allows users to easily insert emojis by name into their R scripts, R Markdown, or Quarto documents.
#' A Shiny-based GUI with a searchable dropdown will appear, allowing the user to select an emoji.
#' Once an emoji is selected, it will be inserted at the cursor's position in the active editor.
#'
#' @return Inserts the selected emoji at the cursor position in the active R script or R Markdown document.
#' @export
#' @importFrom shiny fluidPage titlePanel selectizeInput verbatimTextOutput actionButton
#' @importFrom shiny renderText observeEvent req runGadget dialogViewer stopApp
#' @importFrom shinyjs useShinyjs runjs
#' @importFrom rstudioapi insertText
#'
#' @examples
#' if (interactive()) {
#'   shiny_emoji()
#' }
#' # Use this addin by running shiny_emoji() from the RStudio Addins menu.
shiny_emoji <- function() {
  ui <- shiny::fluidPage(
    shinyjs::useShinyjs(),  # Initialize shinyjs
    shiny::titlePanel("Insert Emoji"),
    shiny::selectizeInput(
      inputId = "emoji_select",
      label = "Search for an emoji:",
      choices = names(emoji_dict),
      options = list(placeholder = 'Type to search...')
    ),
    shiny::verbatimTextOutput("emoji_preview"),
    shiny::actionButton("insert_button", "Insert Emoji")
  )

  server <- function(input, output, session) {
    output$emoji_preview <- shiny::renderText({
      req(input$emoji_select)
      emoji_dict[[input$emoji_select]]
    })

    shiny::observeEvent(input$insert_button, {
      emoji <- emoji_dict[[input$emoji_select]]
      if (!is.null(emoji)) {
        rstudioapi::insertText(text = emoji)
        shiny::stopApp()  # Close the Shiny app (pop-up) after insertion
      }
    })

    # Add JavaScript to listen for the Enter key press
    shinyjs::runjs("
      $(document).on('keypress', function(e) {
        if (e.which == 13) {  // Enter key code
          $('#insert_button').click();  // Trigger the action button click
        }
      });
    ")
  }

  shiny::runGadget(ui, server, viewer = shiny::dialogViewer("Insert Emoji"))
  invisible(NULL)
}
