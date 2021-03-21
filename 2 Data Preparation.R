getwd()
setwd( "C:\\Users\\Devesh Prasad\\Documents\\Codes\\R Programming Advanced Analytics In R For Data Science Codes")
getwd()
#  basic import fin<-read.csv(file.choose())
fin<-read.csv(file.choose(),na.strings =c('') )# to solve it at core all empty character = na
head(fin,10)
tail(fin,10)
str(fin)
summary(fin)
attach(fin)
# changing from non actor to factor
fin$ID<-factor(fin$ID)
str(fin)
fin$Inception<-factor(fin$Inception)
str(fin)
# THE FACTOR VARIABLE TRAP (FVT)
# converting factor into non factors
a<-c('12','13','14','12','12')
a
typeof(a)# character
b<-as.numeric(a)
b
typeof(b)#double a type of numeric
# converting into numeric for factors
z<-factor(c('12','13','14','12','12'))
z
typeof(z)#integer      # factorization integer
levels(z)#12,13,14
# converting it to numeric
y<-as.numeric(z)
y  #1,2,3,1,1
typeof(y)#double
##################correct method
# first convert z to character then no
# then numeric
x<-as.numeric(as.character(z))
x# 12,13,14,12,12 
typeof(x)# double
############################ FVT EXAMPLE
str(fin)
fin$Profit<-factor(fin$Profit)
str(fin)
#converting factor profit into numeric
# wrong
#    dangerous         overwrite  fin$Profit<-as.numeric(fin$Profit)# wrong method value changes 
#leads to different result



################ sub() and gsub()
?sub # replaces first instance
?gsub# replaces all instances
fin$Expenses<-gsub('Dollars','',fin$Expenses)# replace dollar with no space
head(fin)
fin$Expenses<-gsub(',','',fin$Expenses)# replace dollar with no space
str(fin)
# expense is chr
fin$Revenue<-gsub('$','',fin$Revenue)
# $ is still there to address the $ sign you need escape sequence \\$
fin$Revenue<-gsub('\\$','',fin$Revenue)
head(fin)
str(fin)
fin$Revenue<-gsub(',','',fin$Revenue)
str(fin)
fin$Growth<-gsub('%','',fin$Growth)
head(fin)
# much easier than factor to numeric as factor to chr is done so asnumeric is left to apply
fin$Expenses<-as.numeric(fin$Expenses)
fin$Revenue<-as.numeric(fin$Revenue)
fin$Growth<-as.numeric(fin$Growth)
fin$Profit<-as.numeric(fin$Profit)
str(fin)
head(fin)
############## DEALING WITH MISSING DATA
# method 1 - PREDICTION with 100% accuracy
# method 2 - leave record as is 
# method 3 -  remove record row entirely
# method 4 - replace with mean or median(preffered as less effect)
# method 5 - fill in by exploring correlations and similarities
# method 6 - introduce dummy variable for 'missingness'
#################################################################################    NA
?NA
# true 1
# false 0
# na      for confusing situations
TRUE==FALSE# false
TRUE==5 # FALSE
  FALSE==FALSE # TRUE
TRUE==1# TRUE
FALSE==0# TRUE
NA==TRUE  #NA
NA==FALSE # NA
NA==15 # NA
NA==NA # NA
# ELEGANT WAY TO LOOK AT MISSING VALUE
head(fin,24)
# there are NA and empty values and <NA>
complete.cases(fin) # picks up row with one NA
#  vector containing true and false value
# subset of data frame
fin[!complete.cases(fin),]# rows with NA in them
# we only have 6 rows but we have more than 6  because the value are not NA but emoty chr therefore different
# fix the problem at its core
# go to top  update import
head(fin)
fin[!complete.cases(fin),]# rows with NA in them now modified
str(fin)

#######################################    which() for non missing data
head(fin)
fin[fin$Revenue==9746272,]
# here you will get 3 row two with na which is helpful
which(fin$Revenue==9746272,)   #3
fin[which(fin$Revenue==9746272,),]
# you will get the required row
fin[fin$Employees==45,] # here also na row so use which
fin[which(fin$Employees==45),]
# which will remove na
#####################################################        IS.NA() for missing dat

fin$Expenses==NA
# shows NA
fin[fin$Expenses==NA,]# full table changes to NA so use isna()
is.na()# checks if something is na as NA CANNOT BE COMPARED
a<-c(1,2,34,NA,5)
is.na(a)
# show where are na
is.na(fin$Expenses)
fin[is.na(fin$Expenses),]

fin[is.na(fin$State),]

######################## removing records with missing data
########################      first ctreate a backup
fin_backup<-fin
fin[!complete.cases(fin),]
fin[!is.na(fin$Industry),]############## rows which are not empty
fin[is.na(fin$Industry),]

fin<-fin[!is.na(fin$Industry),]######### two rows 14,15 have been removed which had null 
fin
head(fin,18)


# resetting the dataframe index or row no
fin
rownames(fin)<-1:nrow(fin)
fin# 498 rows
tail(fin)

# hack 
fin<-fin_backup
rownames(fin)<-NULL
nrow(fin)# 498

#########################################   CORRECTING DATA WITH FACTUAL ANALYSIS WITH 100% CERTAINITY
fin[!complete.cases(fin),]
#
fin[is.na(fin$State),]
# correction
fin[is.na(fin$State) & fin$City=="New York",]
fin[is.na(fin$State) & fin$City=="New York","State"]<-"NY"  # to update state as NY
fin[c(11,377),]
fin[!complete.cases(fin),]
fin[is.na(fin$State) & fin$City=="San Francisco","State"]<-"CA"  # to update state as NY
fin[c(82,265),]
fin[!complete.cases(fin),]# 6 rows left only
###########################################     CORRECTING DATA USING MEDIAN PART 1
fin[!complete.cases(fin),]
median(fin[,"Employees"],na.rm = T)
#56
mean(fin[,"Employees"],na.rm = T)  #149
#
med_ind_emp<-median(fin[fin$Industry=="Retail","Employees"],na.rm = T)
#28
# now putting na to median for retail employees
fin[is.na(fin$Employees) & fin$Industry=="Retail",]
fin[is.na(fin$Employees) & fin$Industry=="Retail","Employees"]<-med_ind_emp
#check
fin[3,]
med_fin_ser<-median(fin[fin$Industry=="Financial Services","Employees"],na.rm = T)
med_fin_ser#80
fin[is.na(fin$Employees) & fin$Industry=="Financial Services","Employees"]<-med_fin_ser
fin[!complete.cases(fin),] # 4  left
fin[Industry=="Financial Services",]
fin[330,]
##################################  median imputation method part2
med_growth_const<-median(fin[fin$Industry=="Construction","Growth"],na.rm=T)
med_growth_const#10
fin[is.na(fin$Growth) & fin$Industry=="Construction",]  #you will get row 8
# 
fin[is.na(fin$Growth) & fin$Industry=="Construction","Growth"]<- med_growth_const #you will get row 8
fin[8,]
#  growth=10
fin[!complete.cases(fin),]
med_rev_const<-median(fin[fin$Industry=="Construction","Revenue"],na.rm = T)
med_rev_const
fin[is.na(fin$Revenue) & fin$Industry=="Construction",]  #you will get row 8
# you get 2 rows 8 and 44
fin[is.na(fin$Revenue) & fin$Industry=="Construction","Revenue"]<-med_rev_const
fin[!complete.cases(fin),]# revenue gets fulfilled
#################### for 17 value of expense will be derived by revenue and profit
######## for expenses
med_exp_const<-median(fin[fin$Industry=="Construction","Expenses"],na.rm = T)
med_exp_const # 4506976
fin[is.na(fin$Expenses) & fin$Industry=="Construction","Expenses"]<-med_exp_const############ this is one method other method
################ OTHER METHOD
#profit has also be missing  otherwise it can be calculated from expense and revenue
fin[is.na(fin$Expenses) & fin$Industry=="Construction" & is.na(fin$Profit),"Expenses"]<-med_exp_const############ this is one method other method
fin[!complete.cases(fin),]
# now we have 2 profit na and 1 expense na

################### DERIVING VALUES METHOD REPLACING MISSING DATA
# REVENUE-EXPENSES=PROFIT
fin[is.na(fin$Profit),"Profit"]<-fin[is.na(fin$Profit),"Revenue"]-fin[is.na(fin$Profit),"Expenses"]
fin[c(8,42),]
head(fin)
head(fin,20)
fin[!complete.cases(fin),]
fin[is.na(fin$Expenses),"Expenses"]<-fin[is.na(fin$Expenses),"Revenue"]-fin[is.na(fin$Expenses),"Profit"]
fin[15,]
fin[!complete.cases(fin),]################  NOW ONLY 1 NA IN INCEPTIONS
##################################
###################################    VISUALISATION OF FILTERED DATA
library(ggplot2)
p=ggplot(data=fin)
# scatterplot revenue,expenses,profit,
p+geom_point(aes(x=Revenue,y=Expenses,color=Industry,size=Profit))
###############  A SCATTERPLOT WITH INDUSTRY TRENDS FOR EXPENSES-REVENUE RELATIONSHIP
d<-ggplot(data=fin,aes(x=Revenue,y=Expenses,color=Industry))
d+geom_point()+geom_smooth()  # not nice so some changes are required
d+geom_point()+geom_smooth(fill=NA,size=1.5)
##################################    BOXPLOTS
f<-ggplot(data=fin,aes(x=Industry,y=Growth,color=Industry))
f+geom_boxplot()
f+geom_jitter()+geom_boxplot(size=1.2,alpha=0.5,outlier.color =NA )


