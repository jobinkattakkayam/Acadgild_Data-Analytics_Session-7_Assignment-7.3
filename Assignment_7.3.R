summary(cars)
boxplot(mtcars$mpg)
boxplot(mtcars$mpg, horizontal = TRUE)
boxplot(mtcars$mpg, col = 'blue')
boxplot(mtcars$mpg, border = 'red')
boxplot(mtcars$mpg, range = 0)
boxplot(mtcars$mpg, range = 1)
boxplot(mtcars$mpg, range = 1, outline = FALSE)
boxplot(mtcars$mpg ~ mtcars$cyl)
mpg_split <- split(mtcars$mpg, mtcars$cyl)
mpg_split
mpg_4 <- mpg_split$`4`
mpg_6 <- mpg_split$`6`
mpg_8 <- mpg_split$`8`
boxplot(mpg_4, mpg_6, mpg_8)
boxplot(mtcars$mpg ~ mtcars$cyl, col = 'blue')
boxplot(mtcars$mpg ~ mtcars$cyl,col = c('red', 'blue', 'yellow'))
boxplot(mtcars$mpg ~ mtcars$cyl, range = 1, outline = TRUE,horizontal = TRUE, col = c('red', 'blue', 'yellow'), main = 'Miles Per Gallon by Cylinders',ylab = 'Number of Cylinders', xlab = 'Miles Per Gallon',names = c('Four', 'Six', 'Eight'))

library(ggplot2)
library(xtable)
head(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
mtcars$labels <- row.names(mtcars)
summary(mtcars)
library(gridExtra)
library(ggplot2)
library(ggthemes)
library(tufte)
p <- ggplot(data = mtcars, aes(x = cyl, y = mpg, fill = cyl))

p <- p + geom_boxplot() +ggtitle("Car Milage Data") +labs(x = "Number of Cylinders", y = "Miles Per Gallon") +scale_fill_discrete(name = "Cylinders")

p

p <- ggplot(mtcars, aes(x = wt, y = mpg)) +geom_point() +ggtitle("Cars")
p2 <- ggplot(mtcars, aes(x = wt, y = mpg, colour = factor(gear))) +geom_point() +ggtitle("Cars")

p3 <- p2 + facet_wrap(~ am)p + geom_rangeframe() +theme_tufte() + scale_x_continuous(breaks = extended_range_breaks()(mtcars$wt)) +scale_y_continuous(breaks = extended_range_breaks()(mtcars$mpg))

p4 <- ggplot(mtcars, aes(factor(cyl), mpg))p4 + theme_tufte(ticks=FALSE) + geom_tufteboxplot()p4 + theme_tufte(ticks=FALSE) +geom_tufteboxplot(median.type = "line")p4 + theme_tufte(ticks=FALSE) +geom_tufteboxplot(median.type = "line", whisker.type = 'point', hoffset = 0)p4 + theme_tufte(ticks=FALSE) +geom_tufteboxplot(median.type = "line", whisker.type = 'line', hoffset = 0, width = 3)
