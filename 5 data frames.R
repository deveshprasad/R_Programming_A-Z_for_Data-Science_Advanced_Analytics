# DATA FRAMES

# IMPORTING FILE
# method  of selecting the file manually
stats<-read.csv(file.choose())
# method 2 usinng location
# settinf work directory
# first see the directory
getwd()
# setting work directory
# winndows
setwd('C:\\Users\\Devesh Prasad\\Documents\\R Programming A-ZT R For Data Science Codes')
getwd()
# after setting the working directory now all your files will save there
setwd("C:/Users/Devesh Prasad/Documents/CODES")
# for mac 
setwd("/users/deveshprasad/desktop/rprogramming")
# to remove use rm
?rm
rm(stats)
#  now importing the file using its name
stats<-read.csv("DemographicData.csv")
getwd()


# EXPLORING THE DATASETS
stats
nrow(stats)
ncol(stats)
head(stats,3)
tail(stats,10)
# str very important stands for structure
# tells about every column like factor with levels
# levels can be used to find the level of factors

# runif  pronounced as R-UNIF STANDS FOR RANDOM VARIABLES  DISTRIBUTED UNIFORMLY


#
summary(stats)
stats[3,3]
attach(stats)

# we can get this value in same ways
stats[3,"Birth.rate"]
# we cant use rows as they are part of table not rownames
is.matrix(stats[3,3])#FALSE
is.data.frame(stats[3,3])#FALSE
is.vector(stats[3,3])#TRUE

# NA will be the output
levels(stats$Income.Group)
is.data.frame(stats[1,])   # TRUE  # NO NEED FOR  DROP F IN NO COLUMN DEFINED
is.data.frame(stats[,1])
# false so drop F needed
is.data.frame(stats[1,,drop=F])
# NOW TRUE


# ADDING A COLUMN IN A TABLE
stats$xyz<-1:5
head(stats)


# stats$xyz and 1:5 should be a multiple than only possible otherwise error
stats$xyz<-1:4
# REMOVE A COLUMN
stats$xyz<-NULL
head(stats)

# filtering a data frame
names(stats)
attach(stats)
stats[Country.Name=="India",]
# filtering focuses more on rows
filter<-stats$Internet.users<2
filter
# you will get in true false to get in table form
stats[filter,]
# another method
stats[stats$Birth.rate>40,]
stats[stats$Birth.rate>40 & stats$Internet.users<2,]
stats[stats$Income.Group=="High income",]
stats[Country.Name=="Malta",]

stats[Birth.rate>40,]



#INTRODUCTION TO QPLOT WE NEED PACKAGE GGPLOT2
install.packages("ggplot2")
library(ggplot2)
?qplot
attach(stats)
qplot(data = stats,x=Internet.users)
# A DISTRIBUTION APPEAR AS A HISTOGRAM 
qplot(data = stats,x=Income.Group,y=Birth.rate)# a categorical on x and numeric on y axis
# size=3 
# size doesnot change but legend appears same with color instead of assigning value we are mapping it thats what R  think
# use size=I(number)
qplot(data = stats,x=Income.Group,y=Birth.rate,size=I(3))
qplot(data = stats,x=Income.Group,y=Birth.rate,size=I(3),col="blue")
# you will not get blue and confusing legend will appear  so use I()
qplot(data = stats,x=Income.Group,y=Birth.rate,size=I(3),col=I("red"))
qplot(data = stats,x=Income.Group,y=Birth.rate,geom = "boxplot")
# so easy  to use a geom to  choose the type you want

# VISUALIZING MORE
qplot(data=stats,x=Internet.users,y=Birth.rate)
# you will get dotted graph
qplot(data=stats,x=Internet.users,y=Birth.rate,size=I(3),col=Income.Group)
# yow wil get 4 colors using
getwd()
# CREATING DATAFRAMES
# first ctrl a to select compelete dat of country region vector
mydf<-data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)
# now you have created a dataframe you change col names in two method similar can be used with rbind and cbind
colnames(mydf)<-c("COUNTRIES","CODES","REGIONS")
head(mydf)
names(mydf)
# next method

rm(mydf)
mydf<-data.frame(country=Countries_2012_Dataset,code=Codes_2012_Dataset,regions=Regions_2012_Dataset)
head(mydf)
names(mydf)
summary(mydf)

# MERGING DATA FRAMES
 
head(stats)
head(mydf)
 # now merging so that regions hget added in stats without any duplicacies
merged<-merge(x=stats,y=mydf,by.x = "Country.Code",by.y = "CODES")
# merge(x,y,by.x=from x table,y=from y table)
head(merged)
# it has a duplicacies of countries  we can remove it
merged$COUNTRIES<-NULL
head(merged)
str(merged)
# 6 columns as we wanted
# NOW CREATE THE PLOT WE WANT WITH  REGIONS
qplot(data = merged,x=Internet.users,y=Birth.rate)
attach(merged)
#
qplot(data = merged,x=Internet.users,y=Birth.rate,col=REGIONS,size=I(3))
# shapes=1 -25
qplot(data = merged,x=Internet.users,y=Birth.rate,col=REGIONS,size=I(3),shape=I(19))
# FOR THE DOTS COLLIDING WE CAN USE TRANSPARENCY FROM 0 TO 1 ALPHA
qplot(data = merged,x=Internet.users,y=Birth.rate,col=REGIONS,size=I(3),shape=I(19),alpha=I(0.5))
# you know about main , xlim, ylab.......



