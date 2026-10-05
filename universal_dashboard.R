# =========================================================
# ADVANCED UNIVERSAL DATA ANALYSIS DASHBOARD
# FINAL FULLY UPGRADED PROJECT
# WITH SEPARATE YEAR ANALYSIS MODULE
# =========================================================

# ==============================
# INSTALL PACKAGES (RUN ONCE)
# ==============================

# install.packages("shiny")
# install.packages("shinydashboard")
# install.packages("plotly")
# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("tidyverse")
# install.packages("corrplot")
# install.packages("DT")
# install.packages("GGally")

# ==============================
# LOAD LIBRARIES
# ==============================

library(shiny)
library(shinydashboard)
library(plotly)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(corrplot)
library(DT)
library(GGally)

# =========================================================
# USER INTERFACE
# =========================================================

ui <- dashboardPage(
  
  skin = "blue",
  
  dashboardHeader(
    title = "Advanced Universal Data Analysis Dashboard"
  ),
  
  dashboardSidebar(
    
    sidebarMenu(
      
      menuItem(
        "Upload Dataset",
        tabName = "upload",
        icon = icon("upload")
      ),
      
      menuItem(
        "Dataset Overview",
        tabName = "overview",
        icon = icon("table")
      ),
      
      menuItem(
        "Summary Statistics",
        tabName = "summary",
        icon = icon("chart-bar")
      ),
      
      menuItem(
        "Missing Values",
        tabName = "missing",
        icon = icon("exclamation-triangle")
      ),
      
      menuItem(
        "Numerical Analysis",
        tabName = "numerical",
        icon = icon("chart-line")
      ),
      
      menuItem(
        "Categorical Analysis",
        tabName = "categorical",
        icon = icon("chart-pie")
      ),
      
      menuItem(
        "Year Analysis",
        tabName = "yearanalysis",
        icon = icon("calendar")
      ),
      
      menuItem(
        "Scatter Analysis",
        tabName = "scatter",
        icon = icon("braille")
      ),
      
      menuItem(
        "Correlation Matrix",
        tabName = "correlation",
        icon = icon("chart-area")
      ),
      
      menuItem(
        "Business Insights",
        tabName = "insights",
        icon = icon("lightbulb")
      )
    )
  ),
  
  dashboardBody(
    
    tabItems(
      
      # =====================================================
      # UPLOAD DATASET
      # =====================================================
      
      tabItem(
        
        tabName = "upload",
        
        fluidRow(
          
          box(
            width = 12,
            title = "Upload CSV Dataset",
            status = "primary",
            solidHeader = TRUE,
            
            fileInput(
              "file",
              "Choose CSV File",
              accept = ".csv"
            ),
            
            br(),
            
            h4("Dataset Preview"),
            
            DTOutput("preview")
          )
        )
      ),
      
      # =====================================================
      # DATASET OVERVIEW
      # =====================================================
      
      tabItem(
        
        tabName = "overview",
        
        fluidRow(
          
          valueBoxOutput("rowsBox", width = 4),
          valueBoxOutput("colsBox", width = 4),
          valueBoxOutput("missingBox", width = 4)
        ),
        
        fluidRow(
          
          box(
            width = 12,
            title = "Column Information",
            status = "info",
            solidHeader = TRUE,
            
            tableOutput("columnInfo")
          )
        )
      ),
      
      # =====================================================
      # SUMMARY STATISTICS
      # =====================================================
      
      tabItem(
        
        tabName = "summary",
        
        fluidRow(
          
          box(
            width = 12,
            title = "Statistical Summary",
            status = "success",
            solidHeader = TRUE,
            
            verbatimTextOutput("summaryStats")
          )
        )
      ),
      
      # =====================================================
      # MISSING VALUES
      # =====================================================
      
      tabItem(
        
        tabName = "missing",
        
        fluidRow(
          
          box(
            width = 12,
            title = "Missing Value Analysis",
            status = "warning",
            solidHeader = TRUE,
            
            tableOutput("missingTable")
          )
        )
      ),
      
      # =====================================================
      # NUMERICAL ANALYSIS
      # =====================================================
      
      tabItem(
        
        tabName = "numerical",
        
        fluidRow(
          
          box(
            width = 4,
            title = "Select Numerical Column",
            status = "primary",
            solidHeader = TRUE,
            
            selectInput(
              "numeric_col",
              "Choose Numeric Variable",
              choices = NULL
            )
          ),
          
          box(
            width = 8,
            title = "Histogram",
            status = "primary",
            solidHeader = TRUE,
            
            plotlyOutput("histPlot")
          )
        ),
        
        fluidRow(
          
          box(
            width = 6,
            title = "Boxplot",
            status = "warning",
            solidHeader = TRUE,
            
            plotlyOutput("boxPlot")
          ),
          
          box(
            width = 6,
            title = "Density Plot",
            status = "success",
            solidHeader = TRUE,
            
            plotlyOutput("densityPlot")
          )
        ),
        
        fluidRow(
          
          box(
            width = 12,
            title = "Line Chart",
            status = "danger",
            solidHeader = TRUE,
            
            plotlyOutput("linePlot")
          )
        )
      ),
      
      # =====================================================
      # CATEGORICAL ANALYSIS
      # =====================================================
      
      tabItem(
        
        tabName = "categorical",
        
        fluidRow(
          
          box(
            width = 4,
            title = "Select Category Column",
            status = "danger",
            solidHeader = TRUE,
            
            selectInput(
              "cat_col",
              "Choose Category Variable",
              choices = NULL
            )
          ),
          
          box(
            width = 8,
            title = "Category Distribution",
            status = "danger",
            solidHeader = TRUE,
            
            plotlyOutput("barPlot")
          )
        )
      ),
      
      # =====================================================
      # YEAR ANALYSIS
      # =====================================================
      
      tabItem(
        
        tabName = "yearanalysis",
        
        fluidRow(
          
          box(
            width = 4,
            title = "Select Date Column",
            status = "primary",
            solidHeader = TRUE,
            
            selectInput(
              "year_date_col",
              "Choose Date Column",
              choices = NULL
            )
          ),
          
          box(
            width = 8,
            title = "Year-wise Dataset Analysis",
            status = "success",
            solidHeader = TRUE,
            
            plotlyOutput("yearPlot")
          )
        ),
        
        fluidRow(
          
          box(
            width = 12,
            title = "Year Summary Table",
            status = "warning",
            solidHeader = TRUE,
            
            DTOutput("yearTable")
          )
        )
      ),
      
      # =====================================================
      # SCATTER ANALYSIS
      # =====================================================
      
      tabItem(
        
        tabName = "scatter",
        
        fluidRow(
          
          box(
            width = 6,
            title = "Select X Variable",
            status = "primary",
            solidHeader = TRUE,
            
            selectInput(
              "x_col",
              "X Variable",
              choices = NULL
            )
          ),
          
          box(
            width = 6,
            title = "Select Y Variable",
            status = "primary",
            solidHeader = TRUE,
            
            selectInput(
              "y_col",
              "Y Variable",
              choices = NULL
            )
          )
        ),
        
        fluidRow(
          
          box(
            width = 12,
            title = "Scatter Plot",
            status = "success",
            solidHeader = TRUE,
            
            plotlyOutput("scatterPlot")
          )
        )
      ),
      
      # =====================================================
      # CORRELATION MATRIX
      # =====================================================
      
      tabItem(
        
        tabName = "correlation",
        
        fluidRow(
          
          box(
            width = 12,
            title = "Correlation Matrix",
            status = "info",
            solidHeader = TRUE,
            
            plotOutput("corrPlot")
          )
        )
      ),
      
      # =====================================================
      # BUSINESS INSIGHTS
      # =====================================================
      
      tabItem(
        
        tabName = "insights",
        
        fluidRow(
          
          box(
            width = 12,
            title = "Automatic Business Insights",
            status = "success",
            solidHeader = TRUE,
            
            htmlOutput("insightText")
          )
        )
      )
    )
  )
)

# =========================================================
# SERVER LOGIC
# =========================================================

options(shiny.maxRequestSize = 100*1024^2)

server <- function(input, output, session) {
  
  # =====================================================
  # READ DATA
  # =====================================================
  
  data <- reactive({
    
    req(input$file)
    
    read.csv(
      input$file$datapath,
      stringsAsFactors = FALSE
    )
  })
  
  # =====================================================
  # UPDATE DROPDOWNS
  # =====================================================
  
  observe({
    
    req(data())
    
    numeric_cols <- names(
      data()[sapply(data(), is.numeric)]
    )
    
    categorical_cols <- names(
      data()[sapply(data(), function(x)
        is.character(x) | is.factor(x))]
    )
    
    # Detect Date Columns
    
    date_cols <- names(data())
    
    updateSelectInput(
      session,
      "numeric_col",
      choices = numeric_cols
    )
    
    updateSelectInput(
      session,
      "cat_col",
      choices = categorical_cols
    )
    
    updateSelectInput(
      session,
      "year_date_col",
      choices = date_cols
    )
    
    updateSelectInput(
      session,
      "x_col",
      choices = numeric_cols
    )
    
    updateSelectInput(
      session,
      "y_col",
      choices = numeric_cols
    )
  })
  
  # =====================================================
  # DATA PREVIEW
  # =====================================================
  
  output$preview <- renderDT({
    
    datatable(
      head(data(), 10),
      options = list(pageLength = 10)
    )
  })
  
  # =====================================================
  # VALUE BOXES
  # =====================================================
  
  output$rowsBox <- renderValueBox({
    
    valueBox(
      nrow(data()),
      "Total Rows",
      icon = icon("table"),
      color = "blue"
    )
  })
  
  output$colsBox <- renderValueBox({
    
    valueBox(
      ncol(data()),
      "Total Columns",
      icon = icon("columns"),
      color = "green"
    )
  })
  
  output$missingBox <- renderValueBox({
    
    valueBox(
      sum(is.na(data())),
      "Missing Values",
      icon = icon("exclamation-triangle"),
      color = "red"
    )
  })
  
  # =====================================================
  # COLUMN INFORMATION
  # =====================================================
  
  output$columnInfo <- renderTable({
    
    data.frame(
      Column_Name = names(data()),
      Data_Type = sapply(data(), class)
    )
  })
  
  # =====================================================
  # MISSING VALUES
  # =====================================================
  
  output$missingTable <- renderTable({
    
    data.frame(
      Column = names(data()),
      Missing_Values = colSums(is.na(data()))
    )
  })
  
  # =====================================================
  # SUMMARY STATISTICS
  # =====================================================
  
  output$summaryStats <- renderPrint({
    
    summary(data())
  })
  
  # =====================================================
  # HISTOGRAM
  # =====================================================
  
  output$histPlot <- renderPlotly({
    
    req(input$numeric_col)
    
    p <- ggplot(
      data(),
      aes_string(x = input$numeric_col)
    ) +
      
      geom_histogram(
        bins = 30,
        fill = "cyan",
        color = "black"
      ) +
      
      theme_minimal()
    
    ggplotly(p)
  })
  
  # =====================================================
  # BOXPLOT
  # =====================================================
  
  output$boxPlot <- renderPlotly({
    
    req(input$numeric_col)
    
    p <- ggplot(
      data(),
      aes_string(y = input$numeric_col)
    ) +
      
      geom_boxplot(
        fill = "magenta",
        color = "black"
      ) +
      
      theme_minimal()
    
    ggplotly(p)
  })
  
  # =====================================================
  # DENSITY PLOT
  # =====================================================
  
  output$densityPlot <- renderPlotly({
    
    req(input$numeric_col)
    
    p <- ggplot(
      data(),
      aes_string(x = input$numeric_col)
    ) +
      
      geom_density(
        fill = "yellow",
        alpha = 0.5
      ) +
      
      theme_minimal()
    
    ggplotly(p)
  })
  
  # =====================================================
  # LINE CHART
  # =====================================================
  
  output$linePlot <- renderPlotly({
    
    req(input$numeric_col)
    
    p <- ggplot(
      data(),
      aes_string(
        x = "1:nrow(data())",
        y = input$numeric_col
      )
    ) +
      
      geom_line(
        color = "blue",
        linewidth = 1
      ) +
      
      theme_minimal()
    
    ggplotly(p)
  })
  
  # =====================================================
  # CATEGORICAL ANALYSIS
  # =====================================================
  
  output$barPlot <- renderPlotly({
    
    req(input$cat_col)
    
    cat_data <- data() %>%
      count(.data[[input$cat_col]])
    
    p <- ggplot(
      cat_data,
      aes_string(
        x = input$cat_col,
        y = "n"
      )
    ) +
      
      geom_bar(
        stat = "identity",
        fill = "steelblue"
      ) +
      
      coord_flip() +
      
      theme_minimal()
    
    ggplotly(p)
  })
  
  # =====================================================
  # YEAR ANALYSIS PLOT
  # =====================================================
  
  output$yearPlot <- renderPlotly({
    
    req(input$year_date_col)
    
    df <- data()
    
    # Convert Date
    df[[input$year_date_col]] <- as.Date(df[[input$year_date_col]])
    
    # Extract Year
    df$Year <- format(df[[input$year_date_col]], "%Y")
    
    # Remove NA years
    df <- df[!is.na(df$Year), ]
    
    # Count data by year
    year_data <- df %>%
      count(Year)
    
    # Plot
    
    p <- ggplot(
      year_data,
      aes(
        x = Year,
        y = n
      )
    ) +
      
      geom_bar(
        stat = "identity",
        fill = "darkgreen"
      ) +
      
      geom_text(
        aes(label = n),
        vjust = -0.5
      ) +
      
      labs(
        title = "Year-wise Dataset Distribution",
        x = "Year",
        y = "Total Records"
      ) +
      
      theme_minimal()
    
    ggplotly(p)
  })
  
  # =====================================================
  # YEAR SUMMARY TABLE
  # =====================================================
  
  output$yearTable <- renderDT({
    
    req(input$year_date_col)
    
    df <- data()
    
    # Convert Date
    df[[input$year_date_col]] <- as.Date(df[[input$year_date_col]])
    
    # Extract Year
    df$Year <- format(df[[input$year_date_col]], "%Y")
    
    # Remove NA years
    df <- df[!is.na(df$Year), ]
    
    # Create Summary Table
    year_table <- df %>%
      count(Year)
    
    datatable(
      year_table,
      options = list(pageLength = 10)
    )
  })
  
  # =====================================================
  # SCATTER PLOT
  # =====================================================
  
  output$scatterPlot <- renderPlotly({
    
    req(input$x_col)
    req(input$y_col)
    
    p <- ggplot(
      data(),
      aes_string(
        x = input$x_col,
        y = input$y_col
      )
    ) +
      
      geom_point(
        color = "red",
        size = 2
      ) +
      
      theme_minimal()
    
    ggplotly(p)
  })
  
  # =====================================================
  # CORRELATION MATRIX
  # =====================================================
  
  output$corrPlot <- renderPlot({
    
    numeric_data <- data() %>%
      select(where(is.numeric))
    
    if(ncol(numeric_data) < 2){
      return(NULL)
    }
    
    corr_matrix <- cor(
      numeric_data,
      use = "complete.obs"
    )
    
    corrplot(
      corr_matrix,
      method = "color",
      type = "upper"
    )
  })
  
  # =====================================================
  # BUSINESS INSIGHTS
  # =====================================================
  
  output$insightText <- renderUI({
    
    df <- data()
    
    HTML(
      
      paste0(
        
        "<h2>Dataset Insights</h2>",
        
        "<ul>",
        
        "<li><b>Total Rows:</b> ",
        nrow(df),
        "</li><br>",
        
        "<li><b>Total Columns:</b> ",
        ncol(df),
        "</li><br>",
        
        "<li><b>Total Missing Values:</b> ",
        sum(is.na(df)),
        "</li><br>",
        
        "<li><b>Numeric Columns:</b> ",
        length(names(df[sapply(df, is.numeric)])),
        "</li><br>",
        
        "<li><b>Categorical Columns:</b> ",
        length(names(df[sapply(df,
                               function(x)
                                 is.character(x) | is.factor(x))])),
        "</li><br>",
        
        "<li><b>Advanced Feature:</b> ",
        "Separate Year-wise trend analysis added.",
        "</li><br>",
        
        "<li><b>Recommendation:</b> ",
        "Use visual analytics to identify trends and business patterns.",
        "</li>",
        
        "</ul>"
      )
    )
  })
}

# =========================================================
# RUN APPLICATION
# =========================================================

shinyApp(ui,server)