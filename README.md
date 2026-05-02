This R package is an extension of the package "smatr" and uses the ggplot interface to make beautiful plots. Here's an example how to use it: 

datafile <- system.file("iris.csv", package = "ggsmatr")
df.iris <- read.csv(datafile, encoding = "UTF-8")

library(ggsmatr)
library(ggplot2)
library(smatr)
fit = sma(Sepal.Length ~ Sepal.Width + Species, 
          data = df.iris,shift=TRUE, elev.test=TRUE)
#
ggsmatr(data =  df.iris, groups = "Species", 
        xvar =  "Sepal.Width", yvar = "Sepal.Length", 
        sma.fit =  fit) + 
theme(legend.position = "top", legend.title=element_blank())+ 
ylab("Sepal.Length")+ 
xlab("Sepal.Width")+ 
theme(legend.position = "top")
