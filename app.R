library(shiny)
library(shinyMUI)

# Load Settings
options <- c("Option A", "Option B", "Option C", "Option D", "Option E")
values <- c("1", "2", "3", "4", "5")

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # CSS styles
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "./styles/styles.css")
  ),
  
  # AppBar ------------------------------------------------------------------
  AppBar(
    position="fixed", sx = 1.5,
    Toolbar(enableColorOnDark="TRUE",
            IconButton(size="large", edge="start", color="inherit", sx=2, BarChartIcon()),
            Typography(variant="h6", "News"),
            Button("LOGIN", color= "inherit")
    )
  ),
  
  tags$div(style="height:65px;"),
  hr(),
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  tags$br(),
  
  # Alert -------------------------------------------------------------------
  tags$text("Alert"),
  p(),
  Alert(severity = "info", 
        AlertTitle(tags$h5("Aviso")),
        tags$h6("This is an Alert")),
  tags$br(),
  
  # Button ------------------------------------------------------------------
  tags$text("Button"),
  p(),
  Stack(spacing=2, direction="row", class = "button1-text",
        shinyMUI::
          Button.shinyInput("button1", "Text", variant="text"),
        Button.shinyInput("button1", "Contained", variant="contained", color="success"),
        Button.shinyInput("button1", "Outlined", variant="outlined")
  ),
  tags$br(),
  
  # Button Group ------------------------------------------------------------
  tags$text("Button Group"),
  p(),
  Stack(spacing=2, direction="row", class = "button2-text",
        ButtonGroup(variant="contained", color="success",
                    id="outlined primary button group",
                    Button("button1"),
                    Button("button2"),
                    Button("button3"),
        )),
  tags$br(),
  
  # Card --------------------------------------------------------------------
  tags$text("Card"),
  Card(
    CardContent("Hello world!")
  ),
  tags$br(),
  
  
  # Select Input ------------------------------------------------------------
  tags$text("Select Input"),
  p(),
  FormControl(
    fullWidth = T,
    InputLabel(id = "demo-simple-select-label", "Election"),
    Select.shinyInput("text1",
                      #labelId = "demo-simple-select-label",
                      spacing = 2,
                      type = "required",
                      # value = 10, # Default value set to 10
                      label = "Election",
                      fullWidth = T,
                      MenuItem(value = values[1], options[1]),
                      MenuItem(value = values[2], options[2]),
                      MenuItem(value = values[3], options[3]),
                      #helperText="Some important text",
                      multiline = F
    )
  ),
  textOutput("textValue1"),
  tags$br(),
  
  
  # ThemeProvider -----------------------------------------------------------
  tags$text("ThemeProvider"),
  ThemeProvider(
    theme = list(palette = list(primary = list(main = "#01cfca", contrastText = "#FFFFFF"))),
    Typography(variant = "h1", "H1", color = "primary"),
    tagList(
      Typography(variant="h1", "H1"),
      Typography(variant="h2", "H2"),
      Typography(variant="body1", "Body 1"),
    )
  ),
  tags$br(),
  
  # TextField Input -----------------------------------------------------------
  tags$text("TextField Input"),
  p(),
  TextField.shinyInput("text3",
                       fullWidth = F,
                       label = "Trial",
                       value = "", #Default
                       variant = "outlined",
                       helperText = "Some important text",
                       multiline = F),
  textOutput("textValue3"),
  tags$br(),
  
  
  # Switch Input------------------------------------------------------------------
  tags$text("Switch Input"),
  p(),
  FormControl(FormLabel("Connectors Set"),
              FormGroup(
                Switch.shinyInput("text4", value = T, name = "Connector", color="success"),
                Switch.shinyInput("text4", value = T, label = "Connector", color="warning"),
                Switch.shinyInput("text4", value = T, label = "Connector", color="secondary"))
  ),
  textOutput("textValue4"),
  tags$br(),
  
  
  # Slider input ------------------------------------------------------------
  tags$text("Slider Input"),
  p(),
  Slider.shinyInput("text5",
                    value = 5,
                    color = "warning",
                    valueLabelDisplay = "auto"),
  textOutput("textValue5"),
  tags$br(),
  
  
  # Floating Action Button --------------------------------------------------
  tags$text("Floating Action Button"),
  p(),
  Fab(color="primary", size="medium", BarChartIcon()),
  tags$br(),
  
  
  # Checkbox Input ----------------------------------------------------------
  tags$text("Checkbox Input"),
  p(),
  Checkbox(defaultChecked =T, name= "Peach", size="large", color="secondary"),
  tags$br(),
  
  # Rating Input ------------------------------------------------------------
  tags$text("Rating Input"),
  p(),
  Rating("rating",
         name="simple-controlled",
         value=3.5,
         precision=0.5,
         size="large"),
  tags$br(),
  
)


# Define server logic 
server <- function(input, output) {
  
  # Output: Select Input
  output$textValue1 <- renderText({
    sprintf("Value: %s", input$text1)
  })
  
  #Output: TextField Input
  output$textValue3 <- renderText({
    sprintf("Value: %s", input$text3)
  })
  
  #Output: Switch Input
  output$textValue4 <- renderText({
    sprintf("Value: %s", input$text4)
  })
  
  #Output: Slider Input
  output$textValue5 <- renderText({
    sprintf("Value: %s", input$text5)
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
