library(qcc)

defect <- c(27, 789, 9, 65, 12, 109, 30, 15, 45, 621)

#案例一

names(defect) <- c("Too noisy", "Overpriced", "Food not fresh", 
                   "Food is tasteless", "Unfriendly staff",
                   "Wait time", "Not clean", "Food is too salty", 
                   "No atmosphere", "Small portions") 

pareto.chart(defect, xlab = "Categories", # x-axis label
             ylab="Frequency",  # label y left
             
             # colors of the chart             
             col=heat.colors(length(defect)), 
             
             # ranges of the percentages at the right
             cumperc = seq(0, 100, by = 20),  
             
             # label y right
             ylab2 = "Cumulative Percentage", 
             
             # title of the chart
             main = "Complaints of different customers" 
)

#案例二

defect <- c(7000, 4000, 5200, 3000, 800)

# x axis titles
names(defect) <- c("Class A", "Class B", "Class C",
                   "Class D", "Class E") 

pareto.chart(defect, xlab = "Categories",
             ylab="Frequency",
             col=heat.colors(length(defect)),
             cumperc = seq(0, 100, by = 10),
             ylab2 = "Cumulative Percentage",
             main = "Defects"
)


library(ggQC)
library(tidyverse)

#案例三

df <- tibble(
  defect = c(27, 789, 9, 65, 12, 109, 30, 15, 45, 621),
  name = c("Too noisy", "Overpriced", "Food not fresh", 
           "Food is tasteless", "Unfriendly staff",
           "Wait time", "Not clean", "Food is too salty", 
           "No atmosphere", "Small portions") 
)

df %>% 
  ggplot(aes(name,defect)) +
  stat_pareto(point.color = "red",
              point.size = 3,
              line.color = "black",
              #size.line = 1,
              bars.fill = c("blue", "orange"),
  ) + 
 theme(axis.text.x = element_text(angle = 45, hjust = .5, vjust = .5))  #修改横轴文本标签

