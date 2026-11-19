library(dplyr)
library(tidyr)
library(ggplot2)

args <- commandArgs(trailingOnly = TRUE)
species_a <- args[1]
species_b <- args[2]
image_size <- as.integer(args[3])

selected_species <- c(species_a, species_b)


iris_data <- datasets::iris

species_colours <- c(
  setosa = "tomato",
  versicolor = "steelblue",
  virginica = "gold"
)

iris_subset <- iris_data |>
  filter(Species %in% selected_species)

output_file <- paste0("iris_",species_a,"_vs_",species_b,".png")

species_plot <- iris_subset |>
  ggplot(aes(x=Petal.Width, y=Petal.Length, colour=Species))+
           geom_point()+
           labs(x="Petal width", y="Petal length", 
                title=paste0(species_a,"vs",species_b))

ggsave(filename = output_file,
       plot=species_plot,
       width = image_size,
       height = image_size,
       units = "px",
       dpi=150)

# Read command-line arguments
#args <- commandArgs(trailingOnly = TRUE)
# species_a <- args[1] # The first argument is the name of the first species

# EXERCISE: Store the second arguments as species_b.
# species_b <- ...
#species_b <- args[2]

# EXERCISE: Convert the third argument to an integer and store it as image_size.
# image_size <- as.integer(...)
#image_size <- as.integer(args[3])

# EXERCISE: Put species_a and species_b into one vector called selected_species.
# selected_species <- ...
#selected_species <- c(species_a, species_b)

#iris_data <- datasets::iris

#species_colours <- c(
 # setosa = "tomato",
 # versicolor = "steelblue",
 # virginica = "gold"
#)

# Keep only data from the selected species
#iris_subset <- iris_data[iris_data$Species %in% selected_species, ]
#iris_subset <- filter(iris_data$Species %in% selected_species)

# EXERCISE: Create an output filename using species_a and species_b.
#
# Example: "iris_setosa_vs_versicolor.png"
#
# output_file <- paste0(
#   "iris_",
#   species_a,
#   "_vs_",
#   species_b,
#   ".png"
# )
#output_file <- paste0("iris_",species_a,"_vs_",species_b,".png")

# Open plot
#png(
 # filename = output_file,
 # width = image_size,
 # height = image_size
#)



#iris_subset |>
 # ggplot(aes(x=Petal.Length, y=Petal.Width, colour=Species)+
         #  geom_point()+
        #   labs(x="Petal width", y="Petal length")
#)

#main = paste(species_a, "and", species_b)

#legend(
 # "topleft",
 # legend = selected_species,
  #col = species_colours[selected_species],
  #pch = 19,
  #bty = "n"
#)

#dev.off() # Close plot