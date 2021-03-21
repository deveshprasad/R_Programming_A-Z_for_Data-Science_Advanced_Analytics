util<-read.csv(file.choose())
summary(util)
str(util)
head(util)
tail(util)
attach(util)
# DDERIVING UTILIZATION COLUMN =1-percent.idle
util$Utilization<-1-Percent.Idle
head(util,12)

# HANDLING DATE AND TIME 
?POSIXct
# HERE THE DATA SET HAVE EUROPEAN FORMAT BY CHECKING HEAD AND TAIL
# BUT IF WE DONT KNOW
as.POSIXct(util$Timestamp,format="%d/%m/%Y %H:%M")
head(util)
#setting the above as a variable
util$PosixTime<-as.POSIXct(util$Timestamp,format="%d/%m/%Y %H:%M")
head(util,12)
######## rearranging the dataframe 
util$Timestamp<-NULL
head(util)
#REARRANING COLUMNS 
util<-util[,c(4,1,2,3)]
head(util,15)
# making list for rl1
RL1<-util[util$Machine=="RL1",]
summary(RL1)
# PosixTime Machine Percent.Idle Utilization
# 1  2016-09-01 00:00:00     RL1           NA          NA
# 2  2016-09-01 01:00:00     RL1           NA          NA
# 3  2016-09-01 02:00:00     RL1           NA          NA
# 4  2016-09-01 03:00:00     RL1           NA          NA
# 5  2016-09-01 04:00:00     RL1           NA          NA
# 6  2016-09-01 05:00:00     RL1           NA          NA
# 7  2016-09-01 06:00:00     RL1           NA          NA
# 8  2016-09-01 07:00:00     RL1   0.01994048   0.9800595
# 9  2016-09-01 08:00:00     RL1   0.01997024   0.9800298
# 10 2016-09-01 09:00:00     RL1   0.02119048   0.9788095
# 11 2016-09-01 10:00:00     RL1   0.01375000   0.9862500
# 12 2016-09-01 11:00:00     RL1   0.01916667   0.9808333
# 13 2016-09-01 12:00:00     RL1   0.03086310   0.9691369
# 14 2016-09-01 13:00:00     RL1   0.03086310   0.9691369
# 15 2016-09-01 14:00:00     RL1   0.03377976   0.9662202
# 
# PosixTime                   Machine     Percent.Idle      Utilization    
# Min.   :2016-09-01 00:00:00   RL1 :720   Min.   :0.00500   Min.   :0.8492  
# 1st Qu.:2016-09-08 11:45:00   RL2 :  0   1st Qu.:0.03208   1st Qu.:0.9403  
# Median :2016-09-15 23:30:00   SR1 :  0   Median :0.04613   Median :0.9539  
# Mean   :2016-09-15 23:30:00   SR4A:  0   Mean   :0.04830   Mean   :0.9517  
# 3rd Qu.:2016-09-23 11:15:00   SR6 :  0   3rd Qu.:0.05967   3rd Qu.:0.9679  
# Max.   :2016-09-30 23:00:00              Max.   :0.15077   Max.   :0.9950  
#                                          NA's   :7         NA's   :7       

RL1$Machine<-factor(RL1$Machine)
summary(RL1)
# PosixTime                   Machine    Percent.Idle      Utilization    
# Min.   :2016-09-01 00:00:00   RL1:720   Min.   :0.00500   Min.   :0.8492  
# 1st Qu.:2016-09-08 11:45:00             1st Qu.:0.03208   1st Qu.:0.9403  
# Median :2016-09-15 23:30:00             Median :0.04613   Median :0.9539  
# Mean   :2016-09-15 23:30:00             Mean   :0.04830   Mean   :0.9517  
# 3rd Qu.:2016-09-23 11:15:00             3rd Qu.:0.05967   3rd Qu.:0.9679  
# Max.   :2016-09-30 23:00:00             Max.   :0.15077   Max.   :0.9950  
#                                         NA's   :7         NA's   :7   

# EXCLUDING NA HOURS FINDING FOR MONTH THE MIN MAX MEAN UTILIZATION OF RL1
UTIL_STATS_RL1<-c(min(RL1$Utilization,na.rm=T),
                  mean(RL1$Utilization,na.rm=T),
                  max(RL1$Utilization,na.rm=T))
UTIL_STATS_RL1
#0.8492262 0.9516976 0.9950000

# TO FIND IF ANY MANY HAS UTILIZATION LESS THAN 90%

RL1[which(RL1$Utilization<0.90),]
#       PosixTime            Machine Percent.Idle Utilization
# 31  2016-09-02 06:00:00     RL1    0.1206250   0.8793750
# 32  2016-09-02 07:00:00     RL1    0.1353869   0.8646131
# 33  2016-09-02 08:00:00     RL1    0.1352083   0.8647917
# 34  2016-09-02 09:00:00     RL1    0.1098810   0.8901190
# 35  2016-09-02 10:00:00     RL1    0.1098810   0.8901190
# 36  2016-09-02 11:00:00     RL1    0.1300893   0.8699107
# 37  2016-09-02 12:00:00     RL1    0.1365774   0.8634226
# 326 2016-09-14 13:00:00     RL1    0.1070833   0.8929167
# 327 2016-09-14 14:00:00     RL1    0.1140179   0.8859821
# 328 2016-09-14 15:00:00     RL1    0.1202976   0.8797024
# 329 2016-09-14 16:00:00     RL1    0.1082440   0.8917560
# 330 2016-09-14 17:00:00     RL1    0.1129167   0.8870833
# 331 2016-09-14 18:00:00     RL1    0.1151190   0.8848810
# 332 2016-09-14 19:00:00     RL1    0.1059524   0.8940476
# 484 2016-09-21 03:00:00     RL1    0.1186905   0.8813095
# 485 2016-09-21 04:00:00     RL1    0.1374107   0.8625893
# 486 2016-09-21 05:00:00     RL1    0.1507738   0.8492262
# 487 2016-09-21 06:00:00     RL1    0.1393155   0.8606845
# 488 2016-09-21 07:00:00     RL1    0.1409226   0.8590774
# 489 2016-09-21 08:00:00     RL1    0.1261607   0.8738393
# 490 2016-09-21 09:00:00     RL1    0.1341667   0.8658333
# 491 2016-09-21 10:00:00     RL1    0.1210119   0.8789881
# 702 2016-09-30 05:00:00     RL1    0.1143452   0.8856548
# 703 2016-09-30 06:00:00     RL1    0.1347619   0.8652381
# 704 2016-09-30 07:00:00     RL1    0.1276488   0.8723512
# 705 2016-09-30 08:00:00     RL1    0.1052083   0.8947917
# 706 2016-09-30 09:00:00     RL1    0.1041964   0.8958036
length(RL1[which(RL1$Utilization<0.90),])
#4
length(which(RL1$Utilization<0.90))
#27

############### TO GET IT IN LOGICAL FORM
UTIL_UNDER_90<-length(which(RL1$Utilization<0.90))>0
UTIL_UNDER_90
#TRUE
listRL1<-list("RL1",UTIL_STATS_RL1,UTIL_UNDER_90)
listRL1
# [[1]]
# [1] "RL1"
# 
# [[2]]
# [1] 0.8492262 0.9516976 0.9950000
# 
# [[3]]
# [1] TRUE

############## NAMING LIST
names(listRL1)<-c('RL1',"STATS","logical")
listRL1
# $RL1
# [1] "RL1"
# 
# $STATS
# [1] 0.8492262 0.9516976 0.9950000
# 
# $logical
# [1] TRUE

############ another time saving method attack the problem at its source

rm(listRL1)
listRL1<-list(Machine="RL1",stats=UTIL_STATS_RL1,logic=UTIL_UNDER_90)
listRL1
# $Machine
# [1] "RL1"
# 
# $stats
# [1] 0.8492262 0.9516976 0.9950000
# 
# $logic
# [1] TRUE

############# EXTRACTING COMPONENTS OF A LIST
#[] WILL RETURN A LIST
#[[]] WILL RETURN AN OBJECT
# $ SAME AS [[ ]] BUT PRETTY
listRL1[1]
# $Machine
# [1] "RL1"
listRL1[[1]]
#[1] "RL1"
listRL1$Machine
#[1] "RL1"
 listRL1[2]
# $stats
# [1] 0.8492262 0.9516976 0.9950000
typeof(listRL1[2])
#[1] "list"
listRL1[[2]]
typeof(listRL1[[2]])
#[1] "double"
typeof(listRL1$stats)
#[1] "double"
############# to get subset of a list
listRL1[2][3]
# $<NA>
#   NULL
listRL1[[2]][3]
#[1] 0.995
typeof(listRL1[[2]][3])
# double
listRL1$stats[1]
#[1] 0.8492262
typeof(listRL1$stats[1])
#double

######### ADDING AND DELETING LIST COMPONENTS
listRL1[4]<-"NEW COMPONENT"
names(listRL1)<-c('RL1',"STATS","logical","new")
listRL1
# $RL1
# [1] "RL1"
# 
# $STATS
# [1] 0.8492262 0.9516976 0.9950000
# 
# $logical
# [1] TRUE
# 
# $new
# [1] "NEW COMPONENT"

######## vector : all hours where utilisation is na 
unknown_hours<-RL1[is.na(RL1$Utilization),"PosixTime"]
listRL1$unknown_hours<-RL1[is.na(RL1$Utilization),"PosixTime"]
listRL1
# $RL1
# [1] "RL1"
# 
# $STATS
# [1] 0.8492262 0.9516976 0.9950000
# 
# $logical
# [1] TRUE
# 
# $new
# [1] "NEW COMPONENT"
# 
# $unknown_hours
# [1] "2016-09-01 00:00:00 IST" "2016-09-01 01:00:00 IST" "2016-09-01 02:00:00 IST" "2016-09-01 03:00:00 IST"
# [5] "2016-09-01 04:00:00 IST" "2016-09-01 05:00:00 IST" "2016-09-01 06:00:00 IST"


############## removing a component using null
listRL1[4]<-NULL          # NUMERAATION GETS SHIFTED
listRL1       
# $RL1
# [1] "RL1"
# 
# $STATS
# [1] 0.8492262 0.9516976 0.9950000
# 
# $logical
# [1] TRUE
# 
# $unknown_hours
# [1] "2016-09-01 00:00:00 IST" "2016-09-01 01:00:00 IST" "2016-09-01 02:00:00 IST" "2016-09-01 03:00:00 IST"
# [5] "2016-09-01 04:00:00 IST" "2016-09-01 05:00:00 IST" "2016-09-01 06:00:00 IST"

# adding dataframe in the list
listRL1$data<-RL1
listRL1
summary(listRL1)
# Length Class      Mode     
# RL1           1      -none-     character
# STATS         3      -none-     numeric  
# logical       1      -none-     logical  
# unknown_hours 7      POSIXct    numeric  
# data          4      data.frame list 
str(listRL1)
# List of 5
# $ RL1          : chr "RL1"
# $ STATS        : num [1:3] 0.849 0.952 0.995
# $ logical      : logi TRUE
# $ unknown_hours: POSIXct[1:7], format: "2016-09-01 00:00:00" "2016-09-01 01:00:00" "2016-09-01 02:00:00" "2016-09-01 03:00:00" ...
# $ data         :'data.frame':	720 obs. of  4 variables:
#   ..$ PosixTime   : POSIXct[1:720], format: "2016-09-01 00:00:00" "2016-09-01 01:00:00" "2016-09-01 02:00:00" "2016-09-01 03:00:00" ...
# ..$ Machine     : Factor w/ 1 level "RL1": 1 1 1 1 1 1 1 1 1 1 ...
# ..$ Percent.Idle: num [1:720] NA NA NA NA NA ...
# ..$ Utilization : num [1:720] NA NA NA NA NA ...

#######################################################3 SUBSETTING A LIST
listRL1$unknown_hours[1]
listRL1[[1:3]]
#Error in listRL1[[1:3]] : recursive indexing failed at level 2
listRL1[1:3]
# $RL1
# [1] "RL1"
# 
# $STATS
# [1] 0.8492262 0.9516976 0.9950000
# 
# $logical
# [1] TRUE
listRL1[c(1,3)]
# $RL1
# [1] "RL1"
# 
# $logical
# [1] TRUE
listRL1[c("RL1","STATS")]
# $RL1
# [1] "RL1"
# 
# $STATS
# [1] 0.8492262 0.9516976 0.9950000

################################### CREATING A TIMESERIES PLOT
library(ggplot2)
p<-ggplot(data=util)
p+geom_line(aes(x=PosixTime,y=Utilization,color=Machine),size=1.2)# size is not mapped but set
p+geom_line(aes(x=PosixTime,y=Utilization,color=Machine),size=1.2,alpha=0.8)+geom_hline(yintercept=0.90,size=1.2)
######## to remove overlapping we use facet grids
p+geom_line(aes(x=PosixTime,y=Utilization,color=Machine),size=1.2)+facet_grid(Machine~.)
# adding y intercept
?linetype
q<-p+geom_line(aes(x=PosixTime,y=Utilization,color=Machine),size=1.2)+facet_grid(Machine~.)+geom_hline(yintercept=0.90,size=1.2,color="Orange",linetype=3)


#########33 plots can be added in list
listRL1$plot<-q
listRL1
summary(listRL1)
# 
# Length Class      Mode     
# RL1           1      -none-     character
# STATS         3      -none-     numeric  
# logical       1      -none-     logical  
# unknown_hours 7      POSIXct    numeric  
# data          4      data.frame list     
# plot          9      gg         list     
str(listRL1)
# 
# List of 6
# $ RL1          : chr "RL1"
# $ STATS        : num [1:3] 0.849 0.952 0.995
# $ logical      : logi TRUE
# $ unknown_hours: POSIXct[1:7], format: "2016-09-01 00:00:00" "2016-09-01 01:00:00" "2016-09-01 02:00:00" "2016-09-01 03:00:00" ...
# $ data         :'data.frame':	720 obs. of  4 variables:
#   ..$ PosixTime   : POSIXct[1:720], format: "2016-09-01 00:00:00" "2016-09-01 01:00:00" "2016-09-01 02:00:00" "2016-09-01 03:00:00" ...
# ..$ Machine     : Factor w/ 1 level "RL1": 1 1 1 1 1 1 1 1 1 1 ...
# ..$ Percent.Idle: num [1:720] NA NA NA NA NA ...
# ..$ Utilization : num [1:720] NA NA NA NA NA ...
# $ plot         :List of 9
# ..$ data       :'data.frame':	3600 obs. of  4 variables:

########### much more description about the plot




