# Developer Data Product Assignment
# ui.R
# York Huang

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("How Much Does Your Kid Weigh"),
  sidebarPanel(
    radioButtons('gender', 'Gender',
                       c('Boy' = 'M',
                         'Girl'='F')),
    sliderInput('age', 'Age (month): ', 36, min =3, max =144),
    sliderInput('height', 'Height (cm): ' , 100, min =3, max =180),
    h4('Help'),
    div("Select gender, age and height, your kid's wegiht will be calculated on the mail panel."),
    a("Source code is on github", href="https://github.com/yorkhuang-au/ddp-project")
  ),
  mainPanel(
    h3(textOutput('WeightMessage'))
  )
))

