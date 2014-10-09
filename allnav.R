library(shiny)
setwd("/Users/e/GDrive/DevLib/MyRLib/Cleveland-partials")
##
runApp(list( ui = navbarPage("Test", id = "partial", 
                             footer = uiOutput("container"),
  # h2("Demonstration of partials"),
  # We're not putting anything in this tabsetPanel's tabs; we're just
  # rendering the tabs themselves, and using the selected value to tell
  # us which partial to render in the uiOutput("container") below
  # tabsetPanel(id = "partial" , #, type = "pill",
              tabPanel("Load", value="load"),
              tabPanel("Overview", value="load"),
              tabPanel("Supply-Demand", value="load"),
              tabPanel("Administration", value="load"),
              tabPanel("Manipulate", value="manipulate"),
              tabPanel("Plot", value="plot"),
  # ),
  
), server = function(input, output, session) {
  output$container <- renderUI({
    if (is.null(input$partial))
      return(NULL)
    # Make sure there's nothing malicious, like ../. The \\W pattern
    # (note the uppercase W) will match any non-letter characters.
    if (grepl("\\W", input$partial))
      return(NULL)
    
    # Source the partials/<pageTab>.R file and return the result.
    # It's important to pass local=TRUE so evaluation happens here,
    # not in the global environment.
    observe({
    updateTabsetPanel(session, inputId="partial", selected="manipulate")
    })
    source(file.path("partials", paste0(input$partial, ".R")), local=TRUE)$value
  })
  
  for (file in list.files("controllers")) {
    source(file.path("controllers", file), local = TRUE)
  }
}))
########

