library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    storeItems <- eventReactive(input$AddItems
                                , addItemToDB(input$CourseCode, input$CourseDays, input$StartTime
                                              , input$EndTime, input$Freq, input$cost))
    
    updatedTable <- eventReactive(input$ShowTable, {

    })
    
    output$courseTimetable <- renderDataTable({updatedTable})

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })

})
