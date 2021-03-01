# ADVANCED VISUALISATION WITH GGPLOT2 USING MOVIE DATA 
# various things in a ggplot
# data
# aesthetics
# geometries
# statistics
# facets
# coordinates
# themes
?install.packages()
?xlim
# FACTORS
# PART OF DATA SET
movies<-read.csv(file.choose())
head(movies)
# percentage dollar and bracket signs are seen as dots in rows
# how to fix
colnames(movies)<-c('FILM','GENRE','CRITIC','AUDIENCE','BUDGETMILLIONS','YEAR')
head(movies)
tail(movies)
str(movies)
# factor is a categorical variables
summary(movies)
# converting year into factor
factor(movies$YEAR)
movies$YEAR<-factor(movies$YEAR)
summary(movies)
str(movies)

# AESTHETICS
library(ggplot2)
# to activate
attach(movies)
ggplot(data = movies,aes(x=CRITIC,y=AUDIENCE))
# nothin if runned only background is displayed
# geom is needed 
ggplot(data = movies,aes(x=CRITIC,y=AUDIENCE))+geom_point()
#  adding color
ggplot(data = movies,aes(x=CRITIC,y=AUDIENCE,col="red"))+geom_point()
ggplot(data = movies,aes(x=CRITIC,y=AUDIENCE,col=GENRE))+geom_point()
# adding size
ggplot(data = movies,aes(x=CRITIC,y=AUDIENCE,col=GENRE,size=GENRE))+geom_point()
# adding size in a better way
ggplot(data = movies,aes(x=CRITIC,y=AUDIENCE,col=GENRE,size=BUDGETMILLIONS))+geom_point()
# this is no one with legend  for 0 100 200 300 millions and genre
# THIS WAS NO 1


# PLOTTING WITH LAYERS
P<-ggplot(data = movies,aes(x=CRITIC,y=AUDIENCE,col=GENRE,size=BUDGETMILLIONS))
# this is stored as list 
# now if we write p same backgrounnd with no points appear
P
P+geom_point()
# P is the foundation of this or starting layer of data its got its asthetics 
# lines
P+geom_line()
# multiple layers
P+geom_point()+geom_line()
# here lines are on top so you cant see the points really
# try it otherwise
P+geom_line()+geom_point()


# OVERRIDING AESTHETICS
q<-ggplot(data = movies,aes(x=CRITIC,y=AUDIENCE,col=GENRE,size=BUDGETMILLIONS))

q+geom_point()

# overriding
q+geom_point(aes(size=CRITIC))

# col
q+geom_point(aes(col=BUDGETMILLIONS))
# to get back the original as q remains the same
q=geom_point()
# we can overide x and y
q+geom_point(aes(x=BUDGETMILLIONS))
# adding xlab
q+geom_point(aes(x=BUDGETMILLIONS))+xlab("BUDGET $$$")
# setting 
q+geom_line(size=1)+geom_point() 
# reduce line size
# not used aes because mapping and setting are different in aes used we are mapping otherwise setting in geomline

# MAPPING VS SETTING

r<-ggplot(data = movies,aes(x=CRITIC,y=AUDIENCE))
r+geom_point()


# add color
# MAPPING uses asthectic and a bit more complicated
r+geom_point(aes(col=GENRE))

# using setting
r+geom_point(col="DarkGreen")
# now error adding color using asthetics
r+geom_point(aes(col="DarkGreen"))
# will create a label with light red color

# mapping
r+geom_point(aes(size=BUDGETMILLIONS))
# setting
r+geom_point(size=10)
# aesthetics is not suitable for size
r+geom_point(aes(size=10)) # slightly bigger not 10
# IF YOU WANT TO SET SOMETHING DONT USE AESTHETIC AND IF YOU WANT TO MAP SOMETHING USE ASTHETIC

#
# HISTOGRAM AND DENSITY CHARTS
s<-ggplot(data = movies,aes(x=Budget..million...))
s+geom_histogram()           #  for histogram
# you can set its bin width
s+geom_histogram(binwidth = 10)           #  for histogram
#  setting to set color
s+geom_histogram(binwidth = 10,fill="Green")
s+geom_histogram(binwidth = 10,fill=Genre) # error occurs
# to map the color aesthetically

s+geom_histogram(binwidth = 10,aes(fill=Genre))
# you will notice to get black border use this 
s+geom_histogram(binwidth = 10,aes(fill=Genre),col="Black")


# density chart
s+geom_density()
s+geom_density(aes(fill=Genre))
# it will be overiding each other so not recommended
s+geom_density(aes(fill=Genre),position = "stack")
# overiding is solved

# starting layers tip you can create one chart in many ways
# AUDIENCE RATINGS
t<-ggplot(data = movies,aes(x=Audience.Ratings..))
t+geom_histogram(binwidth=5,fill="Black",col="White")
# anothr method
t<-ggplot(data = movies)
t+geom_histogram(aes(x=Audience.Ratings..),fill="Black",col="Red")
# CRITICS RATING
t+geom_histogram(aes(x=CRITIC),fill="Black",col="Red")

# skeletion plot is used if the datasets are different
# STATISTICAL TRANSFORMAGTIONS

?geom_smooth
u<-ggplot(data = movies,aes(x=CRITIC,y=AUDIENCE,col=GENRE))
u+geom_point()+geom_smooth()
# this is jizzy can be solved usinf fill=NA
u+geom_point()+geom_smooth(fill=NA)
# this shows a better relation btw audience and critics
# 

# boxplots
v<-ggplot(data = movies,aes(x=GENRE,y=AUDIENCE,col=GENRE))
v+geom_boxplot()
v+geom_boxplot(size=1.2)

# making attractive 
v+geom_boxplot(size=1.2)+geom_point()
# not that attractive so use this hack
v+geom_boxplot(size=1.2)+geom_jitter()
# throws random points more attractive
# you know about adding which layer first and transparency
v+geom_jitter()+geom_boxplot(size=1.2,alpha=0.5)
## most attractive now
#for critics
w<-ggplot(data = movies,aes(x=GENRE,y=CRITIC,col=GENRE))
w+geom_jitter()+geom_boxplot(size=1.2,alpha=0.5)
# the line on boxplot shows mean and narrowing of boxes show lesser variance
s<-ggplot(data = movies,aes(x=BUDGETMILLIONS))
s+geom_histogram(binwidth = 10,aes(fill=GENRE),col="Black")


# better to have diff for diff genre
# using facets
s+geom_histogram(binwidth = 10,aes(fill=GENRE),col="Black")+facet_grid(GENRE~.)
# you cant see properly genre in rows and in column you dont want nothing
s+geom_histogram(binwidth = 10,aes(fill=GENRE),col="Black")+facet_grid(GENRE~.,scales = "free")

# scatterplots
u<-ggplot(data = movies,aes(x=CRITIC,y=AUDIENCE,col=GENRE))
u+geom_point(size=3)
u+geom_point(size=3)+facet_grid(GENRE~.)
u+geom_point(size=3)+facet_grid(.~YEAR)
u+geom_point(size=3)+facet_grid(GENRE~YEAR)
# adding smoother
u+geom_point(size=3)+geom_smooth()+facet_grid(GENRE~YEAR)
# budget as size
u+geom_point(aes(size=BUDGETMILLIONS))+geom_smooth()+facet_grid(GENRE~YEAR)
# but still  improvement need for y axis as the scale is from -50 to 150

# coordinates
# how to limit axis and zoom
m<-ggplot(data = movies,aes(x=CRITIC,y=AUDIENCE,size=BUDGETMILLIONS,col=GENRE))
m+geom_point()
# now cutting graph
m+geom_point()+xlim(50,100)+ylim(25,50)
#  it actually removed 104 rows
# wont work well
n<-ggplot(data = movies,aes(x=BUDGETMILLIONS))
n+geom_histogram(aes(fill=GENRE),col="Black")
n+geom_histogram(aes(fill=GENRE),col="Black")+ylim(0,50)

# instead zoom
n+geom_histogram(aes(fill=GENRE),col="Black")+coord_cartesian(ylim = c(0,75))
# data not removed this how layering works
 
# improving data
u+geom_point(aes(size=BUDGETMILLIONS))+geom_smooth()+facet_grid(GENRE~YEAR)+coord_cartesian(ylim = c(0,100))

# PERFECTING BY ADDING THEMES
o<-ggplot(data=movies,aes(x=Budget..million...))
h<-o+geom_histogram(binwidth = 10,aes(fill=Genre),col="Black")
h
# adding  axis label
h+xlab("MONEY")+ylab("No of MOVIES")
# label formatting
h+xlab("MONEY")+ylab("No of MOVIES")+
  theme(axis.title.x = element_text(color = "Red",size=20),
        axis.title.y = element_text(color = "DarkBlue",size=20))

# axis text formatting

h+xlab("MONEY")+ylab("No of MOVIES")+
  theme(axis.title.x = element_text(color = "Red",size=20),
        axis.title.y = element_text(color = "DarkBlue",size=20),
        axis.text.x = element_text(size=15),
        axis.text.y =  element_text(size=15)
       )
?theme
# legend formatting
h+xlab("MONEY")+ylab("No of MOVIES")+
  theme(axis.title.x = element_text(color = "Red",size=20),
        axis.title.y = element_text(color = "DarkBlue",size=20),
        axis.text.x = element_text(size=15),
        axis.text.y =  element_text(size=15),
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1)
  )


# ADDING TITLE

h+xlab("MONEY")+ylab("No of MOVIES")+
  ggtitle("MOVIE DISTRIBUTION")+
  theme(axis.title.x = element_text(color = "Red",size=20),
        axis.title.y = element_text(color = "DarkBlue",size=20),
        axis.text.x = element_text(size=15),
        axis.text.y =  element_text(size=15),
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(color="Black",size = 40,family = "Algerian")
  )

# family= calighraphy
# c(1,1) for the top right corner and again c(1,1) to adjust so that it doesnt get out












