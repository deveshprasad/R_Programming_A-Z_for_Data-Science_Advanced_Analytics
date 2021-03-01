# HOMEWORK SOLUTIONS

#1
# LAW OF LARGE NO HW
n<-1000000
counter<-1
for (i in rnorm(n)) {
  if(i<1 & i>-1){
    counter<-counter+1
  }  
  
}
counter
answer<-counter/n
answer
# compare to 68.2
# for million and more zero we get 68.2 hence law of large no proved


#2
# HW FINANCIAL STATEMENT
#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
# profit for each month
profit<-revenue-expenses
profit
data.frame(profit)
# profit after tax for each month  tax is 30%
tax<-round(profit*0.30)
tax
data.frame(tax)
profitaftertax<-profit-tax
profitaftertax 
data.frame(profitaftertax)
#profitmargin=profit after tax/ revenue
profitmargin<-round(profitaftertax/revenue,2)*100

data.frame(profitmargin)

# good months where profit after tax gretor than mean profit after tax
mean_pat<-mean(profitaftertax)
mean_pat
goodmonths<-profitaftertax>mean_pat
goodmonths
# bad months
badmonths<-!goodmonths
badmonths

# best month where profit after tax was maximum
bestmonth<-max(profitaftertax)
bestmonth # to get the max value 
best.month<-profitaftertax==max(profitaftertax)
best.month  # to  get value in true or false

# worst month where profit after tax was minimum
worstmonth<-min(profitaftertax)
worstmonth # to get the max value 
worst.month<-profitaftertax==min(profitaftertax)
worst.month  # to  get value in true or false

# units of thounsand
revenue.1000<-round(revenue/1000)
revenue.1000
expenses.1000<-round(expenses/1000)
expenses.1000
profit.1000<-round(profit/1000)
profit.1000
profitaftertax.1000<-round(profitaftertax/1000)
profitaftertax.1000


# output
revenue.1000
expenses.1000
profit.1000
profitaftertax.1000
profitmargin
goodmonths
badmonths
best.month
worst.month
# matrix form
# TRUE FALSE AUTOMATICALLY  CHANGE TO 0-1

sol<-rbind(revenue.1000,
           expenses.1000,
           profit.1000,
           profitaftertax.1000,
           profitmargin,
           goodmonths,
           badmonths,
           best.month,
           worst.month
)
sol
colnames(sol)<-c("JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC")
sol




# basket ball homework where you have to create three chart but first two matrix
# cntrl a to select all hw data  and to load it in the environment
# create first matrix free throws  FT
freethrows<-rbind(KobeBryant_FT,JoeJohnson_FT,LeBronJames_FT,CarmeloAnthony_FT,DwightHoward_FT,ChrisBosh_FT,ChrisPaul_FT,KevinDurant_FT,DerrickRose_FT,DwayneWade_FT)
freethrows
# NOW ADDING COLNAMES
colnames(freethrows)<-Seasons
freethrows
# now adding row names or  removing the ft
rownames(freethrows)<-Players
freethrows


# NOW CREATING MATRIZ FOR FREE THROW ATTEMPTS FTA
freethrowattempts<-rbind(KobeBryant_FTA,JoeJohnson_FTA,LeBronJames_FTA,CarmeloAnthony_FTA,DwightHoward_FTA,ChrisBosh_FTA,ChrisPaul_FTA,KevinDurant_FTA,DerrickRose_FTA,DwayneWade_FTA)
freethrowattempts
colnames(freethrowattempts)<-Seasons
rownames(freethrowattempts)<-Players
freethrowattempts
# sekect -ft and press ctrl f to  replace it with fta 
# NOW LETS CREATE THE GRAPH
myplot1<-function(data,rows=1:10){                         # adding parameter rows
  Data<-data[rows,,drop=F]
  matplot(t(Data),type="b",pch=15:18,col = c(1:4,6))
  legend("bottomleft",inset = 0.01,legend = Players[rows],col=c(1:4,6),pch =15:18)
  
}
myplot1(freethrowattempts)
myplot1(freethrowattempts)


#  graph needed 
# free throws per game
myplot1(freethrowattempts/Games)

#2 free throw accuracy
myplot1(freethrows/freethrowattempts)

# player styles 2-3 pointers   gives point from field goals
myplot1((Points-freethrows)/FieldGoals)
# the lowest line shows better field player than penalty more two pointer or closes baskets than 3 pointer




# data frame homework world trendz

data<-read.csv(file.choose())
head(data)
# 1960
tail(data)
# 2013
# we have to  first filter it differently for the two years
str(data)
summary(data)
attach(data)

# changing year into factor
temp<-factor(Year)
temp
levels(temp)
# numeric changed into factor now filtering the  data
data1960<-data[Year==1960,]
data2013<-data[Year==2013,]

# checking rows 
nrow(data1960)
nrow(data2013)
# both are 187
# open the vector data  sheet to add data in environment

# creating additional dataframes
add1960<-data.frame(Code=Country_Code,Life.exp=Life_Expectancy_At_Birth_1960)
add2013<-data.frame(Code=Country_Code,Life.exp=Life_Expectancy_At_Birth_2013)

# check summary
summary(add1960)
summary(add2013)

#  both the tables have country code common so taking it as a common dataframe creating a merged table
merged1960<-merge(data1960,add1960,by.x = "Country.Code",by.y ="Code")
merged2013<-merge(data2013,add2013,by.x = "Country.Code",by.y ="Code")
attach(merged1960)
attach(merged2013)
# check  the new structures
str(merged1960)
str(merged2013)

# making the year column null
merged1960$Year=NULL
merged2013$Year=NULL

# new modified structure
str(merged1960)
str(merged2013)


# visualising the plots 1960 and 2013 ffor life expectany,fertility rate
library(ggplot2)
# 1960 DATA SET
qplot(data=merged1960,x=Fertility.Rate,y=Life.exp,color=Region,size=I(4),alpha=I(0.5),main = "LIFE EXPECTANCY VS FERTILITY 1960")
# 2013 DATASET
qplot(data=merged2013,x=Fertility.Rate,y=Life.exp,color=Region,size=I(4),alpha=I(0.5),main = "LIFE EXPECTANCY VS FERTILITY 2013")


# gross movie domestic chart where we have to draw the exact same boxplot
mov<-read.csv(file.choose())
attach(mov)
head(mov)
tail(mov)
str(mov)
summary(mov)

library(ggplot2)
ggplot(data=mov,aes(x=Day.of.Week))
ggplot(data=mov,aes(x=Day.of.Week))+geom_bar()  # most movies are released on what day can be seen on thiis graph

# lets filter the data
# 1 method
filt<-mov$Genre=="action"|mov$Genre=="adventure"|mov$Genre=="animation"|mov$Genre=="comedy"|mov$Genre=="drama"
mov2<-mov[filt,]
mov2



# filter 2 method
filt2<-mov$Studio %in% c("Buena Vista Studios","WB","Fox","Universal","Sony","Paramount Pictures")
# we have filter the data for genre  by one method and for studio by second method

filt
filt2
mov3<-mov[filt&filt2,]
mov3

# filtering is done
 #visualisation

p<-ggplot(data=mov3,aes(x=Genre,y=Gross...US))
# adding geometry
p+geom_boxplot()
# to remove the blackdot part of boxplot can be removed using outlier color=NA
p+geom_jitter(aes(color=Studio,size=Budget...mill.))+geom_boxplot(alpha=0.7)
# to remove blackpoints as jitters already do it
q<-p+geom_jitter(aes(color=Studio,size=Budget...mill.))+geom_boxplot(alpha=0.7,outlier.colour = NA)

# data ink
q<-q+xlab("GENRE")+ylab("GROSS % US")+ggtitle("DOMESTIC GROSS % BY GENRE")
# THEME
z<-q+theme(
  axis.title.x = element_text(colour = "Red",size = 25),
  axis.title.y = element_text(colour = "Red",size = 25),
  axis.text.x = element_text(size = 15),
  axis.text.y = element_text(size = 15),
  plot.title = element_text(size=30,family = ""),  # to change individual  text font
  legend.title = element_text(size = 20),
  legend.text = element_text(size=10)
)
# to change the text type of all axis labels

z<-z+text=element_text(family = "Arial")
z$labels$size<-" Budget $"
z












