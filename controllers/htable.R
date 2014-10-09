    require(shinyTable)
    dtable <- reactive({
    if( is.null( input$htbl )) {
    tbl <- data.frame(  value = 1:10, select = TRUE  ) 
    } else {
       tbl <- data.frame(  value = 11:20, select = TRUE  ) 
    }
    })

    output$htbl <- renderHtable({ dtable() })
