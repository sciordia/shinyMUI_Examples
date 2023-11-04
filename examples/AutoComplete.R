library(shiny)
# Assuming your package name is shinyMUI
library(shinyMUI)

ui <- fluidPage(

  # AutoComplete Input------------------------------------------------------------
  
  # Application title
  titlePanel("Autocomplete Example"),
  
  tags$br(),
  FormControl(
    FormLabel(id = "demo-autocomplete-label", "Selection Panel"),
    fullWidth = T,
    Autocomplete.shinyInput("autocomplete_input",
                            label = "Options",
                            options = list(
                              list(label = "Option 1", value = 1),
                              list(label = "Option 2", value = 2),
                              list(label = "Option 3", value = 3)
                            ),
                            value = list(list(label = "Option 1", value = 1), list(label = "Option 2", value = 2)), # default selected values for multiple selection
                            inputProps = list(label = "Options"), # Passing label within inputProps
                            selectOnFocus = T,
                            multiple = TRUE,
                            filterSelectedOptions = T
    ),
    p(),
    actionButton("submit_btn", "Submit")
  ),
  
  mainPanel(
    # Display the selected value(s)
    textOutput("selected_value")
  )
)

server <- function(input, output, session) {
  
  observeEvent(input$submit_btn, {
    
    # Extracting label and value from the input
    selected_label <- input$autocomplete_input[["label"]]
    selected_value <- input$autocomplete_input[["value"]]
    
    # Printing the extracted values
    print(paste("Selected label:", selected_label))
    print(paste("Selected value:", selected_value))
  })
}


shinyApp(ui, server)
