# 1. Name

print("Plotting Basics:Parva Patel")

r=getOption("repos")
r["CRAN"]="http://cran.us.r-project.org"
options(repos=r)
install.packages("vcd")
library(vcd)

# 2. Install plyr package

install.packages("plyr")

library(plyr)

# Install dplyr package

install.packages("dplyr")

library(dplyr)

# Install FSA package

install.packages("FSA")

library(FSA)

# Install FSAdata package

install.packages("FSAdata")

library(FSAdata)

# Install magrittr package

install.packages("magrittr")

library(magrittr)

# install plotrix package
install.packages("plotrix")

library(plotrix)

# install ggplot2 package

install.packages("ggplot2")

library(ggplot2)

# install moments package

install.packages("moments")

library(moments)

# 3. Load the dataset

data(BullTroutRML2)

BullTroutRML2

#4. Print first and last three records

# First 5 
head(BullTroutRML2,3)

# Last 5
tail(BullTroutRML2,3)

#5. Remove all except Harrison Lake

Harrisonlake<-filter(BullTroutRML2, lake=="Harrison")

Harrisonlake

#6. Display first and last 5 records of new dataset

#first 5
head(Harrisonlake,5)

#last 5
tail(Harrisonlake,5)

#7. Structure of a dataset

structure(Harrisonlake)

#8. Summary of a dataset

summary(Harrisonlake)

#9. Create a scatterplot with specifications

#assign values

fl<-Harrisonlake$fl
age<-Harrisonlake$age

#plot the data

par("mar")

par(mar=c(5.1,4.1,4.1,2.1))
plot(age~fl)

#plot with specifications

plot(age~fl,
     data = Harrisonlake,
     xlim=c(0,500), ylim=c(0,15),
     main="Plot 1: Harrison Lake Trout",
     xlab="fl", ylab="Age",
     pch=20)

#10. Plot a Histogram

hist(Harrisonlake$age,
     xlab = "Age(years)",
     ylab = "Frequency",
     main = "Plot 2: Harrison Fish Age Distribution",
     xlim=c(0,15),
     ylim=c(0,15),
     col = "cadetblue",
     col.main="cadetblue")

#11. Overdense plot with specifications

plot(age~fl,
     main="Plot 3: Harrison Density Shaded by era",
     ylab = "Age(years)",
     ylim=c(0,15),
     xlab="Fork length(mm)",
     xlim=c(0,500),
     pch = 16,
     col=rgb(0,(1:2)/2,0))

#12. New object tmp for first and last 3 records

tmp <- headtail(Harrisonlake,3)
tmp

#13. Display era column from tmp

tmp$era

#14. pchs vector

pchs <- c("+","x")
pchs

#15. cols vector

cols<-c("red", "gray60")
cols

#16. Convert era to numeric

tmp$era <- as.numeric(tmp$era)
tmp$era

is.numeric(tmp$era)

#17. Combine cols vector to tmp era values

cols[tmp$era]

#18. Create plot with specifications

par("mar")

par(mar=c(5,4,4,2))
plot(age~fl,
     data = Harrisonlake,
     main="Plot 4:Symbol and Colour by Era",
     xlim=c(0,500),
     ylim=c(0,15),
     ylab="Age(yrs)",
     xlab = "Fork length(mm)",
     pch=pchs,
     col=cols)

#19. Plot regression line

lm(age~fl, data = Harrisonlake)

plot(age~fl,
     data = Harrisonlake,
     main="Plot 5: Regression Overlay",
     xlim=c(0,500),
     ylim=c(0,15),
     ylab="Age(yrs)",
     xlab = "Fork length(mm)",
     pch=pchs,
     col=cols)
abline(lm(age~fl, data = Harrisonlake))

#20. Placing a legend

plot(age~fl,
     data = Harrisonlake,
     main="Plot 6: Legend overlay",
     xlim=c(0,500),
     ylim=c(0,15),
     ylab="Age(yrs)",
     xlab = "Fork length(mm)",
     pch=pchs,
     col=cols)
abline(lm(age~fl, data = Harrisonlake))
legend("topleft", inset = 0.05,
       legend = c("1997-80","1997-01"),
       bty = "1",
       cex = 0.8,
       pch = pchs,
       col = cols)

