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
    
    # input$autocomplete_input is a named vector, not a list of lists
    selected_labels <- input$autocomplete_input[names(input$autocomplete_input) == "label"]
    selected_values <- input$autocomplete_input[names(input$autocomplete_input) == "value"]
    
    # Print the extracted values
    if (length(selected_labels) > 0) {
      print(paste("Selected labels:", paste(selected_labels, collapse = ", ")))
    } else {
      print("No labels selected")
    }
    
    if (length(selected_values) > 0) {
      print(paste("Selected values:", paste(selected_values, collapse = ", ")))
    } else {
      print("No values selected")
    }
  })
}


shinyApp(ui, server)
