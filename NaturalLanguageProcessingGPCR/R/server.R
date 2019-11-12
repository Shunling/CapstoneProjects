source('data-processing.R', local = TRUE)



function(input, output, session){
  updateSelectInput(session,
                  "selected_receptor",
                  choices = names
  )

  output$Receptor_hotness <- renderPlot({
    if (input$update_chart == 0) {
      return()
    }
    
    plot_trend(
      isolate(input$selected_receptor)
    )
  }) 
  
  output$Top15 <- renderTable({
    if (input$update_chart == 0) {
      return()
    }
    
    show_table(
      isolate(input$selected_receptor)
    )
  })
  
  output$connectome <- renderImage(
    {list(src = "connectome.png",
          width = "800px")},
    deleteFile = FALSE
  )
  
}




