#' Insert Emoji Addin for RStudio (with Searchable Dropdown)
#'
#' This RStudio addin allows users to easily insert emojis by name into their R scripts, R Markdown, or Quarto documents.
#' A Shiny-based GUI with a searchable dropdown will appear, allowing the user to select an emoji.
#' Once an emoji is selected, it will be inserted at the cursor's position in the active editor.
#'
#' @return Inserts the selected emoji at the cursor position in the active R script or R Markdown document.
#' @export
#' @import shiny
#'
#' @examples
#' # Use this addin by running insert_emoji_addin() from the RStudio Addins menu.
shiny_emoji <- function() {
  # Load emoji dictionary from Masterlist.R
  source("R/emoji_masterlist.R")  # Use relative path

  ui <- fluidPage(
    titlePanel("Insert Emoji"),
    selectizeInput(
      inputId = "emoji_select",
      label = "Search for an emoji:",
      choices = names(emoji_dict),
      options = list(placeholder = 'Type to search...')
    ),
    verbatimTextOutput("emoji_preview"),
    actionButton("insert_button", "Insert Emoji")
  )

  server <- function(input, output, session) {
    output$emoji_preview <- renderText({
      req(input$emoji_select)
      emoji_dict[[input$emoji_select]]
    })

    observeEvent(input$insert_button, {
      emoji <- emoji_dict[[input$emoji_select]]
      if (!is.null(emoji)) {
        rstudioapi::insertText(text = emoji)
      }
    })
  }

  # Launch the Shiny app as the addin
  shiny::runGadget(ui, server, viewer = shiny::dialogViewer("Insert Emoji"))
}
