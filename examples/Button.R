library(shinyMUI)
library(shiny)

ui <- fluidPage(
  
  # Button -------------------------------------------------------
  
  # Application title
  titlePanel("Button Example"),
  
  tags$br(),
  
  # Basic Buttons ------------------------------------------------------------------
  tags$text("Basic Buttons"),
  p(),
  Stack(spacing=2, direction="row", class = "button-basic",
        Button.shinyInput("button1", "Text", variant="text"),
        Button.shinyInput("button2", "Contained", variant="contained", color="success"),
        Button.shinyInput("button3", "Outlined", variant="outlined", color="error")
  ),
  tags$br(),
  
  tags$text("Text Buttons"),
  p(),
  Stack(spacing=2, direction="row", class = "button-text",
        Button.shinyInput("button4", "Secondary", variant="text", color = "secondary"),
        Button.shinyInput("button5", "Disabled", variant="outlined", color="success", disabled = T),
        Button.shinyInput("button6", "Link", variant="outlined", href = "#text-buttons")
  ),
  tags$br(),
  
  tags$text("Button Sizes"),
  p(),
  Stack(spacing=2, direction="row", class = "button-sizes-text",
        Button.shinyInput("button7", "Small", variant="text", size = "small"),
        Button.shinyInput("button8", "Medium", variant="text", size = "medium"),
        Button.shinyInput("button9", "Large", variant="text", size = "large")
  ),
  p(),
  Stack(spacing=2, direction="row", class = "button-sizes-outlined",
        Button.shinyInput("button10", "Small", variant="outlined", size = "small"),
        Button.shinyInput("button11", "Medium", variant="outlined", size = "medium"),
        Button.shinyInput("button12", "Large", variant="outlined", size = "large")
  ),
  p(),  Stack(spacing=2, direction="row", class = "button-sizes-contained",
        Button.shinyInput("button13", "Small", variant="contained", size = "small"),
        Button.shinyInput("button14", "Medium", variant="contained", size = "medium"),
        Button.shinyInput("button15", "Large", variant="contained", size = "large")
  ),
  p(),
  tags$br(),
  
)

server <- function(input, output) {
  output$alignment <- renderText({
    input$alignmentInput
  })
}

shinyApp(ui = ui, server = server)
