###IMPORTS
library(leaflet)

icons <- awesomeIcons(
  icon = 'ios-close',
  iconColor = 'black',
  library = 'ion',
  markerColor = primariesSP$colour
)

primary_map <- leaflet(data = primariesSP) %>%
  addTiles() %>%
  addAwesomeMarkers(icon = icons,
                    label = ~ Name,
                    clusterOptions = markerClusterOptions())

primary_map

rmarkdown::render("School_map.Rmd",
                  output_file = "Outputs/test.html")