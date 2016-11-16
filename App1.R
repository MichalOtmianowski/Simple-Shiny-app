library(shiny)
library(ggplot2)
df=data.frame(mtcars)
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("gear", "Liczba biegów", choices=sort(unique(df$gear)))
    ),
    mainPanel(
      plotlyOutput('plot')
    )
  )
)
srv <- function(input, output){
  output$plot <- renderPlotly({
    p<-ggplot(df[df$gear==input$gear,], aes(x=mpg,y=qsec))+geom_point()+geom_smooth(se=FALSE)
    ggplotly(p)
  })
}
shinyApp(ui, srv)