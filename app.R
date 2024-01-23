
library(shiny)
library(shinythemes)
library(data.table)
library(ggplot2)
library(plotly)
library(lubridate)
library(tidyverse)
library(forcats)
library(DT)

# Data Loading Stage
sw_data <- read_csv("data/week7_starwars.csv", locale=locale(encoding="latin1"))

# Data Wrangling Process

sw_data_v2 <- sw_data %>%
  select(!c("Which character shot first?", "Are you familiar with the Expanded Universe?", "Do you consider yourself to be a fan of the Expanded Universe?\u008cæ", "Do you consider yourself to be a fan of the Star Trek franchise?"))

sw_data_v2 <- sw_data_v2[-1,]
sw_data_v3 <- sw_data_v2 %>%
  filter(sw_data_v2$`Have you seen any of the 6 films in the Star Wars franchise?` == "Yes")

sw_data_nonqualify <- sw_data_v2 %>%
  filter(sw_data_v2$`Have you seen any of the 6 films in the Star Wars franchise?` == "No")

sw_data_fans <- sw_data_v3 %>%
  filter(sw_data_v3$`Do you consider yourself to be a fan of the Star Wars film franchise?` == "Yes")

sw_data_nonfans <- sw_data_v3 %>%
  filter(sw_data_v3$`Do you consider yourself to be a fan of the Star Wars film franchise?` == "No")

Remark <- c("Total Observation", "Unqualified Obs Terminated", "Unqualified Obs Nonwatch", "StarWars Fans", "StarWars NonFans")
Number <- c(1186, 100, 250, 552, 284)

sw_overview <- data.frame(Remark, Number)

#---------------------

sw_data_fans_rank_pre <- sw_data_fans %>%
  select(c("Please rank the Star Wars films in order of preference with 1 being your favorite film in the franchise and 6 being your least favorite film.",
           "...11", "...12", "...13", "...14", "...15")) %>%
  rename("Rank Episode I" = "Please rank the Star Wars films in order of preference with 1 being your favorite film in the franchise and 6 being your least favorite film.",
         "Rank Episode II" = "...11",
         "Rank Episode III" = "...12",
         "Rank Episode IV" = "...13",
         "Rank Episode V" = "...14",
         "Rank Episode VI" = "...15")

sw_data_fans_rank <- sw_data_fans_rank_pre[-1,] %>%
  na.omit()

sw_data_nonfans_rank_pre <- sw_data_nonfans %>%
  select(c("Please rank the Star Wars films in order of preference with 1 being your favorite film in the franchise and 6 being your least favorite film.",
           "...11", "...12", "...13", "...14", "...15")) %>%
  rename("Rank Episode I" = "Please rank the Star Wars films in order of preference with 1 being your favorite film in the franchise and 6 being your least favorite film.",
         "Rank Episode II" = "...11",
         "Rank Episode III" = "...12",
         "Rank Episode IV" = "...13",
         "Rank Episode V" = "...14",
         "Rank Episode VI" = "...15")

sw_data_nonfans_rank <- sw_data_nonfans_rank_pre[-1,] %>%
  na.omit()

sw_data_dom_pre <- sw_data_v2 %>%
  select(c("RespondentID", "Gender", "Age", "Household Income", "Education", "Location (Census Region)" ))

sw_data_dom <- sw_data_dom_pre[-1,] %>%
  na.omit


sw_data_fans_rank_sum <- as.data.frame(unclass(sw_data_fans_rank), stringsAsFactors = TRUE) %>%
  rename("Rank_Episode_I" = "Rank.Episode.I",
         "Rank_Episode_II" = "Rank.Episode.II",
         "Rank_Episode_III" = "Rank.Episode.III",
         "Rank_Episode_IV" = "Rank.Episode.IV",
         "Rank_Episode_V" = "Rank.Episode.V",
         "Rank_Episode_VI" = "Rank.Episode.VI",)

sw_data_fans_rank_sum



sw_fans_final_rank <- sw_data_fans_rank_sum %>%
  group_by(Rank_Episode_I, Rank_Episode_II, Rank_Episode_III, Rank_Episode_IV, Rank_Episode_V, Rank_Episode_VI) %>%
  summarise(n=n()) %>%
  ungroup() %>%
  arrange(desc(n)) %>%
  head(10)


Film_Rank <- c("EP4-EP5-EP6-EP1-EP2-EP3", "EP5-EP6-EP1-EP2-EP3-EP4", "EP1-EP2-EP3-EP4-EP5-EP6", "EP4-EP6-EP5-EP1-EP2-EP3", "EP5-EP4-EP6-EP3-EP2-EP1", "EP5-EP4-EP6-EP1-EP2-EP3")
People_Choosen <- c(47, 27, 19, 19, 16, 15)

sw_fans_rank_df <- data.frame(Film_Rank, People_Choosen)



Film_Rank <- c("EP1-EP2-EP3-EP4-EP5-EP6", "EP5-EP6-EP1-EP2-EP3-EP4", "EP5-EP1-EP2-EP3-EP4-EP6", "EP4-EP5-EP6-EP1-EP2-EP3", "EP5-EP6-EP4-EP1-EP2-EP3", "EP6-EP5-EP1-EP2-EP3-EP4")
People_Choosen <- c(51, 37, 18, 17, 10, 9)

sw_nonfans_rank_df <- data.frame(Film_Rank, People_Choosen)



#---------------------


sw_data_nonfans_rank_sum <- as.data.frame(unclass(sw_data_nonfans_rank), stringsAsFactors = TRUE) %>%
  rename("Rank_Episode_I" = "Rank.Episode.I",
         "Rank_Episode_II" = "Rank.Episode.II",
         "Rank_Episode_III" = "Rank.Episode.III",
         "Rank_Episode_IV" = "Rank.Episode.IV",
         "Rank_Episode_V" = "Rank.Episode.V",
         "Rank_Episode_VI" = "Rank.Episode.VI",)


sw_nonfans_final_rank  <- sw_data_nonfans_rank_sum %>%
  group_by(Rank_Episode_I, Rank_Episode_II, Rank_Episode_III, Rank_Episode_IV, Rank_Episode_V, Rank_Episode_VI) %>%
  summarise(n=n()) %>%
  arrange(desc(n))



# -------------------------




#sw_data_fans_seen_sum <- as.data.frame(unclass(sw_data_fans_seen), stringsAsFactors = TRUE) %>%
  #rename("Seen_Episode_I" = "Seen_Episode_I",
        # "Seen_Episode_II" = "Seen_Episode_II",
        # "Seen_Episode_III" = "RSeen_Episode_III",
         #"Seen_Episode_IV" = "Seen_Episode_IV",
         #"Seen_Episode_V" = "Seen_Episode_V",
         #"Seen_Episode_VI" = "Seen_Episode_VI",)


#sw_fans_final_seen <- sw_data_fans_seen_sum %>%
 # group_by(Seen_Episode_I, Seen_Episode_II, Seen_Episode_III, Seen_Episode_IV, Seen_Episode_V, Seen_Episode_VI) %>%
  #summarise(n=n()) %>%
  #arrange(desc(n))


#sw_data_nonfans_seen_sum <- as.data.frame(unclass(sw_data_nonfans_seen), stringsAsFactors = TRUE) %>%
 # rename("Seen_Episode_I" = "Seen.Episode.I",
  #       "Seen_Episode_II" = "Seen.Episode.II",
   #      "Seen_Episode_III" = "Seen.Episode.III",
    #     "Seen_Episode_IV" = "Seen.Episode.IV",
     #    "Seen_Episode_V" = "Seen.Episode.V",
      #   "Seen_Episode_VI" = "Seen.Episode.VI",)


#sw_nonfans_final_seen <- sw_data_nonfans_seen_sum %>%
 # group_by(Seen_Episode_I, Seen_Episode_II, Seen_Episode_III, Seen_Episode_IV, Seen_Episode_V, Seen_Episode_VI) %>%
  #summarise(n=n()) %>%
  #arrange(desc(n))



# UI ----------------------------------------


ui <- fluidPage(theme = shinytheme("united"),
                navbarPage(title = "Star Wars Survey Summary",
                           intro_page <- tabPanel(title = "Introduction",
                                                  titlePanel("Introduction from a galaxy far, far away..."),
                                                  sidebarLayout(
                                                    sidebarPanel(
                                                      h2("Survey Overview"),
                                                      p("This survey is conducted in 2018 as census with respondent from all over the globe, with the main purpose of finding respondent's relatability with Star Wars franchise
                           . This survey, however, is conducted randomly without limiting any criteria. Thus, some observation may be irrelevant since respondent must have some familiarity with Star Wars.
                           As a result, not all observation will be eligible to be used in this summary application.
                           Furthermore, this application consist of 3 Tabs; namely Introduction, Overview, Star Wars Fans Analysis, Star Wars Non-Fans Analysis and About"),
                                                      br(),
                                                      p("After reading through this introduction page, please navigate to", strong("Overview"), "in order to proceed through this application"),
                                                    ),
                                                    mainPanel(
                                                      h2("Data Overview: Facts"),
                                                      p("- The total of 1186 people had participated in this survey"),
                                                      p("- 100 of observations are non-eligible due to incompletion of survey"),
                                                      br(),
                                                      actionButton("help", "Help Me, How do I use this app?"),
                                                      h3("Demographic Data"),
                                                      br(),
                                                      dataTableOutput("DomesticTable"),
                                                    )
                                                  )
                           ),

                           first_page <- tabPanel(title = "Overview",
                                                  titlePanel("Overview of the survey"),
                                                  sidebarLayout(
                                                    sidebarPanel(
                                                      h3("Overview Detail"),
                                                      p("Remark information in this survey,
                               - Total Obs = 1186 persons
                               - Unqualified Obs (Terminated Survey) = 100 persons
                               - Unqualified Obs (Never watch Star Wars) = 250 persons
                               - Qualified Obs (Have watched Star Wars, at least one) = 836 persons
                               - Star Wars fans = 552 persons
                               - Star Wars Non-fans = 284 persons"),
                                                    ),
                                                    mainPanel(
                                                      h2("Survey Overview graph"),
                                                      plotlyOutput("overview_plot"),
                                                    )
                                                  )
                           ),

                           second_page <- tabPanel(title = "Star Wars Fans Analysis",
                                                   titlePanel("What do Star Wars Fans think of the series?"),
                                                   fluidRow(
                                                     column(3),
                                                     column(6,
                                                            shiny::HTML("<br><br><center> <h1>Ranking Fans Favorite Movies</h1> </center><br>")
                                                     ),
                                                     column(3),
                                                   sidebarLayout(
                                                     sidebarPanel(
                                                       h3("Information"),
                                                       p("This Fans analysis shows how do they (fans) rank their favorite movies in likeability order.
                                As well as how many movies have they seen, to the extend of deeming oneself a 'Star Wars Fan'
                                                         Note: The order of the ranking is in an ascending order; meaning that from most left is the first rank
                                                         to the most right being the last rank.
                                                         Note2: With multiple combinations, this visualisation only choosen top 6 with most repetitive and popular
                                                         choices only."),
                                                     ),
                                                     mainPanel(
                                                       selectInput(inputId = "rfans", label = strong("Ranking Order:"),
                                                                   choices = unique(sw_fans_rank_df$Film_Rank),
                                                                   ),
                                                       h2("Star Wars Fans: Movie Ranking"),
                                                       plotlyOutput("fans_rank_plot"),
                                                     )
                                                   )
                           )),

                           thrid_page <- tabPanel(title = "Star Wars Non-Fans Analysis",
                                                  titlePanel("What do Star Wars Non-Fans think of the series?"),
                                                  fluidRow(
                                                    column(3),
                                                    column(6,
                                                           shiny::HTML("<br><br><center> <h1>Ranking Non-Fans Favorite Movies</h1> </center><br>")
                                                    ),
                                                    column(3),
                                                  sidebarLayout(
                                                    sidebarPanel(
                                                      h3("Information"),
                                                      p("This Fans analysis shows how do non-fans rank their favorite movies in likeability order.
                                As well as how many movies have they seen, to the extend of deeming oneself a 'Star Wars Fan'
                                                         Note: The order of the ranking is in an ascending order; meaning that from most left is the first rank
                                                         to the most right being the last rank.
                                                         Note2: With multiple combinations, this visualisation only choosen top 6 with most repetitive and popular
                                                         choices only."),
                                                    ),
                                                    mainPanel(
                                                      h2("Star Wars Non-Fans: Movie Ranking"),
                                                      plotlyOutput("nonfans_rank_plot"),
                                                    )
                                                  )
                           )),

                           about_page <- tabPanel(title = "About",
                                                  about_page <- tabPanel(title = "ABOUT",
                                                  fluidRow(
                                                  column(12,
                                                  div(class = "about",
                                                  uiOutput('about'))
                                                  )
                                                  ),
                                                  includeCSS("styles.css")
                                                  )
                           )
                ),
                includeCSS("styles.css")
)









# Server ------------------------------------------


server <- function(input, output) {

  observeEvent(input$help, {
    showModal(modalDialog(
      title = "Help Message:",
      "Be confused, you shall not. You can choose tabs to explore above, there are.
      Exploring at your own pass, you must. May the force be with you, always",
      easyClose = TRUE
    ))
  })

  output$overview_plot <- renderPlotly({

    ov <- ggplot(sw_overview, aes(y = Remark, x = Number, color = Remark)) +
      labs(x = "Number of Survey Remark Type") +
      geom_col()

    ggplotly(ov)

  })

  output$fans_rank_plot <- renderPlotly({

    char_fans_rank <- input$rfans

    r_fans <- sw_fans_rank_df %>%
      group_by(Film_Rank) %>%
      filter(Film_Rank == char_fans_rank)

    ggplotly(ggplot(sw_fans_rank_df, aes(x = Film_Rank, y = Number_of_People_Choosen, fill = Film_Rank)) +
               geom_bar(stat = "identity") +
               ggtitle("Film Ranking by Fans") +
               xlab("Film Rank in Ascending Order") +
               ylab("Number of people choosen"))


  })

  output$DomesticTable <- DT::renderDataTable({
      datatable(
        sw_data_dom,
        rownames = FALSE,
        class = "table",
        option = list(pageLength = 10, scrollX = T),
        colnames = c("RespondentID", "Gender", "Age", "Household Income", "Education", "Location (Census Region)"
        )
      )

  })

  output$nonfans_rank_plot <- renderPlotly({

    ggplotly(ggplot(data = sw_nonfans_rank_df, aes(x = Film_Rank, y = Number_of_People_Choosen, fill = Film_Rank)) +
               geom_bar(stat = "identity") +
               ggtitle("Film Ranking by Non-Fans") +
               xlab("Film Rank in Ascending Order") +
               ylab("Number of people choosen"))

  })

  output$about <- renderUI({
    knitr::knit("about.Rmd", quiet = TRUE) %>%
      markdown::markdownToHTML(fragment.only = TRUE) %>%
      HTML()

})

}


# Run the application
shinyApp(ui, server)
