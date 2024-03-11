library(sjPlot)
library(sjmisc) 
data(efc)
mydf <- find_var(efc, pattern = "cop", out = "df")
plot_likert(mydf)
plot_stackfrq(mydf)

plot_likert(mydf,
            geom.colors = "RdBu",
            values = "sum.inside",
            show.prc.sign = TRUE)

plot_likert(mydf,
            geom.colors = "gs",
            values = "sum.outside",
            show.prc.sign = TRUE)