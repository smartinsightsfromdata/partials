tagList(
  tabsetPanel(
    tabPanel("Demand",
             fluidPage(fluidRow(
               column(10,htable( "htbl", # clickId="tblClick",
                                 colHeaders="provided", 
                                 rowNames="disabled", readOnly = TRUE))
             )                
             )), # end of Preparation / Summary                
    tabPanel("Activity")        
  )
  
)
