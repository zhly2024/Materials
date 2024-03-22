library(shiny)
library(shinydashboard)
library(tidyverse)
library(readxl)
library(writexl)
library(DT)

ui <- dashboardPage(
  dashboardHeader(title = "滑动条传入参数"),
  
  dashboardSidebar(
    sliderInput("integer", "整数：", min=0, max=1000, value=500),
    sliderInput("decimal", "小数：", min = 0, max = 1, value = 0.5, step= 0.1),
    sliderInput("range", "范围：",min = 1, max = 1000, value = c(200,500)),
    sliderInput("animation", "循环动画", 1, 2000, 1, step = 10,
                animate=animationOptions(interval=300, loop=T))
  ),
  
  dashboardBody(
    fluidRow(box(tableOutput("values")))
  )
)

server <- function(input, output) { 
  sliderValues <- reactive({
    data.frame(
      Name = c("整数", 
               "小数",
               "范围",
               "动画"),
      Value = as.character(c(input$integer, 
                             input$decimal,
                             paste(input$range, collapse=' '),
                             input$animation)), 
      stringsAsFactors=FALSE)
  })
  
  output$values <- renderTable({
    sliderValues()
  })
}

shinyApp(ui, server)