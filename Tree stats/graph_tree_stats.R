
#################################################################################
##### Summary statistics of consistency index, retention index and fit ##########
#################################################################################

library(tidyverse)
library(hablar)
library(ggplot2)
library(farver)
library(egg)

setwd("path/to/directory")

# importa dataframe
df <- read.csv("graph_tree_stats_dataframe.csv")

# convert into a tibble data frame for easier data analysis
df_t <- as_tibble(df)

# creating a dataframe with no N/A's
df_t_clean <- df_t %>% 
          filter(!grepl('N/A', CI))

# keep only rows with True values of Informativeness
df_t_clean_info <- df_t_clean %>% 
                  filter(!grepl('FALSE', Informativeness))

# convert cells in CI, RI and Fit to numerical (uses package 'hablar')
df_t_clean_info_2 <- df_t_clean_info %>% convert(num(CI, RI, Fit), chr(body_part, character_system))

# *mean* summary statistics by body_part
stats_mean <- df_t_clean_info_2 %>%
  group_by(body_part) %>% 
  summarise(mean_CI = mean(CI), mean_RI = mean(RI))

# show tbl in descending order (used dply) [this is just to visualize the data]
arrange(stats_mean, desc(mean_CI))

# *median* summary statistics by body_part
stats_median <- df_t_clean_info_2 %>%
  group_by(body_part) %>% 
  summarise(median_CI = median(CI), median_RI = median(RI))
write.csv(is.data.frame(stats_median), file = "stats_median.csv")

# show tbl in descending order (used dply) [this is just to visualize the data]
arrange(stats_median, desc(median_CI))

# mean and median of Fit values by body_part
stats_fit <- df_t_clean_info_2 %>%
  group_by(body_part) %>% 
  summarise(median_Fit = median(Fit), mean_Fit = mean(Fit))

# show tbl in descending order (used dply) [this is just to visualize the data]
arrange(stats_fit, mean_Fit)

###########
# Create plots
plot1 <- ggplot(stats_mean, aes(x = body_part, y = mean_CI)) +
    theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # this is to remove all names in the x-axis
  ylab("Mean") + 
  ggtitle("CI, RI") +
  geom_point(shape=18,size=4) + 
  geom_point(aes(y = stats_mean$mean_RI), shape=15,size=4, color="darkgrey")

plot2 <- ggplot(stats_median, aes(x = body_part, y = median_CI)) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) + # this is to remove all names in the x-axis
  ylab("Median") + 
  geom_point(shape=18,size=4) + 
  geom_point(aes(y = stats_median$median_RI), shape=15,size=4, color="darkgrey")

plot3 <- ggplot(stats_fit, aes(x = body_part, y = median_Fit)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Fit (median, mean)") +
  xlab("Body part") +
  ylab("Value") + 
  scale_x_discrete(labels= xlables.new) +
  geom_point(shape=19,size=4) + # http://www.sthda.com/english/wiki/ggplot2-point-shapes
  geom_point(aes(y = stats_fit$mean_Fit), shape=19,size=4, color="darkgrey")


# changing x labels [the original labels have underscore, but the final plot should be ready for publication, i.e. no underscores in names]
xlables.new <- c("Carapace", "Cheliceral basal segment","Cheliceral claw", "Ocelli", "Genital operculum", 
  "Gonopod female","Gonopod male","Leg IV basitibia","Leg IV distitibia","Leg IV tarsomere",
  "Opisthosoma", "Pedipalp coxae", "Pedipalp femur", "Pedipalp patella", "Pedipalp tarsus", 
  "Pedipalp tibia", "Pedipalp trochanter",  "Sternum","Tarsus 1", "Tibia 1")

# ploting the 3 graphs
ggarrange(plot1, plot2, plot3, ncol=1)