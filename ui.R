library(shiny)
library(shinyTime)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
            , textInput("CourseCode", "Course Code")
            , selectizeInput("CourseDays", "Course Day(s)", choices = weekdaysList, multiple = TRUE)
            , timeInput("StartTime", "Start Time", value = strptime("09:00:00", "%T"), seconds = FALSE)
            , timeInput("EndTime", "End Time", value = strptime("11:00:00", "%T"), seconds = FALSE)
            , sliderInput("Freq", "Frequency", min = 1, max = 5, value = 2)
            , selectizeInput("CourseTerms", "Availablility", choice = c("S2", "Summer"))
            , numericInput("Cost", "Cost")
            , actionButton("AddItems", "Add Course Item")
            # , actionButton("AddToDB", "Add Course to DB")
            , actionButton("ShowTable", "Show Current Timetable")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
