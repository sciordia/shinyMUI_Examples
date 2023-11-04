library(shinyMUI)
library(shiny)
library(shinyjs)

jsCode <- "
function(event) {
  Shiny.setInputValue('controlledRadioButtonsGroup', event.target.value);
}
"

ui <- fluidPage(
  shinyjs::useShinyjs(), # Include shinyjs into the user interface
  
  # RadioGroup Input -------------------------------------------------------
  
  # Application title
  titlePanel("RadioGroup Example"),
  
  tags$br(),
  FormControl(
    FormLabel(id = "demo-radio-buttons-group-label", "Gender"),
    RadioGroup(
      row = T, # Orientation
      inputId = "controlledRadioButtonsGroup",
      aria.labelledby = "demo-controlled-radio-buttons-group",
      name = "controlled-radio-buttons-group",
      defaultValue = "female",
      Value = "female",
      FormControlLabel(value = "female",
                       labelPlacement="start",
                       control = Radio(color="success", size = "large"),
                       label = "Female"),
      FormControlLabel(value = "male",
                       labelPlacement="start",
                       control = Radio(color="secondary", size = "large"),
                       label = "Male"),
      onChange = JS(jsCode)
    )
  ),
  textOutput("genderOutput")
)

server <- function(input, output, session) {
  
  ## Tefoor option (KO)
  # output$genderOutput <- renderText({
  #   paste("Selected Gender:", input$controlledRadioButtonsGroup)
  # })
  
  # To handle the initial value
  gender <- reactiveVal("female")
  
  output$genderOutput <- renderText({
    paste("Selected Gender:", gender())
  })
  
  observeEvent(input$controlledRadioButtonsGroup, {
    gender(input$controlledRadioButtonsGroup)
  })
}

shinyApp(ui = ui, server = server)
