library(shinyMUI)
library(shiny)

ui <- fluidPage(
  
  # Toggle Button -------------------------------------------------------
  
  # Application title
  titlePanel("Toggle Example"),
  
  tags$br(),
  ToggleButtonGroup("toggleV",
    orientation = "horizontal",
    size = "medium",
    exclusive = TRUE,
    onChange = JS("function(event, newAlignment) { Shiny.setInputValue('alignmentInput', newAlignment); }"),
    aria.label = "text alignment",
    ToggleButton(value = "left", aria.label = "left aligned", SettingsIcon()),
    ToggleButton(value = "center", aria.label = "centered", SettingsIcon()),
    ToggleButton(value = "right", aria.label = "right aligned", SettingsIcon()),
    ToggleButton(value = "justify", aria.label = "justified", disabled = TRUE, SettingsIcon())
  ),
  p(),
  textOutput("alignment")
)

server <- function(input, output) {
  output$alignment <- renderText({
    input$alignmentInput
  })
}

shinyApp(ui = ui, server = server)
