#####################         APPLY
# you can set working directory using this method too
setwd(".\\R Advanced")   #  . mean from  USER TO DOCUMENTS
chicago<-read.csv(file.choose())
chicago
# here rownmaes are not as required so use row.names=1
chicago<-read.csv(file.choose(),row.names = 1)
chicago
newyork<-read.csv(file.choose(),row.names = 1)
houston<-read.csv(file.choose(),row.names = 1)
sanfrancisco<-read.csv(file.choose(),row.names = 1)
newyork
houston
sanfrancisco
############ these are dataframes
is.data.frame(chicago)
#true
############# CONVERTING IT TO MATRIX
Chicago<-as.matrix(chicago)
Houston<-as.matrix(houston)
NewYork<-as.matrix(newyork)
SanFrancisco<-as.matrix(sanfrancisco)
Chicago
is.matrix(Chicago)
# # true
#                    Jan    Feb    Mar    Apr    May    Jun    Jul    Aug    Sep    Oct    Nov    Dec
# AvgHigh_F        32.00  36.00  46.00  59.00  70.00  81.00  84.00  82.00  75.00  63.00  48.00  36.00
# AvgLow_F         18.00  21.00  30.00  41.00  52.00  63.00  68.00  66.00  57.00  46.00  34.00  23.00
# AvgPrecip_inch    2.05   1.93   2.72   3.62   4.13   4.06   4.02   3.98   3.31   3.23   3.43   2.56
# DaysWithPrecip   10.00   8.00  11.00  11.00  11.00  10.00   9.00   9.00   8.00  10.00  11.00  11.00
# HoursOfSunshine 135.00 136.00 187.00 215.00 281.00 311.00 318.00 283.00 226.00 193.00 113.00 106.00


########### LETS PUT ALL 4 MATRIX IN A LIST
Weather<-list(Chicago=Chicago,Houston=Houston,NewYork=NewYork,SanFrancisco=SanFrancisco)
Weather
# $Chicago
#                   Jan    Feb    Mar    Apr    May    Jun    Jul    Aug    Sep    Oct    Nov    Dec
# AvgHigh_F        32.00  36.00  46.00  59.00  70.00  81.00  84.00  82.00  75.00  63.00  48.00  36.00
# AvgLow_F         18.00  21.00  30.00  41.00  52.00  63.00  68.00  66.00  57.00  46.00  34.00  23.00
# AvgPrecip_inch    2.05   1.93   2.72   3.62   4.13   4.06   4.02   3.98   3.31   3.23   3.43   2.56
# DaysWithPrecip   10.00   8.00  11.00  11.00  11.00  10.00   9.00   9.00   8.00  10.00  11.00  11.00
# HoursOfSunshine 135.00 136.00 187.00 215.00 281.00 311.00 318.00 283.00 226.00 193.00 113.00 106.00
# 
# $Houston
#                   Jan    Feb    Mar    Apr    May    Jun    Jul    Aug    Sep    Oct    Nov    Dec
# AvgHigh_F        63.00  66.00  73.00  80.00  86.00  91.00  94.00  94.00  90.00  82.00  73.00  64.00
# AvgLow_F         43.00  47.00  53.00  59.00  68.00  74.00  75.00  75.00  70.00  61.00  52.00  45.00
# AvgPrecip_inch    3.35   3.19   3.39   3.31   5.08   5.91   3.78   3.74   4.09   5.67   4.33   3.74
# DaysWithPrecip    9.00   9.00   8.00   6.00   8.00  10.00   9.00   8.00   8.00   7.00   8.00   9.00
# HoursOfSunshine 142.00 155.00 192.00 210.00 248.00 282.00 294.00 269.00 237.00 229.00 168.00 148.00
# 
# $NewYork
#                 Jan    Feb    Mar    Apr    May   Jun    Jul    Aug    Sep    Oct    Nov    Dec
# AvgHigh_F        39.0  42.00  50.00  60.00  71.00  79.0  85.00  83.00  76.00  65.00  54.00  44.00
# AvgLow_F         26.0  29.00  35.00  44.00  55.00  64.0  70.00  69.00  61.00  50.00  41.00  32.00
# AvgPrecip_inch    3.9   2.95   4.06   3.94   4.45   3.5   4.53   4.13   3.98   3.39   3.82   3.58
# DaysWithPrecip   11.0  10.00  12.00  11.00  11.00  10.0  11.00  10.00   8.00   8.00   9.00  10.00
# HoursOfSunshine 154.0 171.00 213.00 237.00 268.00 289.0 302.00 271.00 235.00 213.00 169.00 155.00
# 
# $SanFrancisco
#                    Jan    Feb    Mar    Apr    May    Jun Jul    Aug   Sep   Oct    Nov    Dec
# AvgHigh_F        57.00  60.00  62.00  63.00  64.00  66.00  67  68.00  70.0  69.0  63.00  57.00
# AvgLow_F         46.00  47.00  49.00  49.00  51.00  53.00  54  55.00  55.0  54.0  50.00  46.00
# AvgPrecip_inch    4.49   4.45   3.27   1.46   0.71   0.16   0   0.08   0.2   1.1   3.15   4.57
# DaysWithPrecip   11.00  11.00  10.00   6.00   4.00   2.00   1   1.00   1.0   4.0   7.00  10.00
# HoursOfSunshine 165.00 182.00 251.00 281.00 314.00 330.00 300 272.00 267.0 243.0 189.00 156.00


Weather$Houston[2]
#43
#apply
#lapply       list is returned
#sapply       vector is returned
apply(Chicago,1,mean) #  for rows 1, 2 is for columns 
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 59.333333       43.250000        3.253333        9.916667      208.666667 
#  ANOTHER METOD
mean(Chicago["AvgHigh_F",])
apply(Chicago,2,max)
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
# 135 136 187 215 281 311 318 283 226 193 113 106


######## RECREATING APPLY WITH LOOPS
o<-NULL
for(i in nrow(Chicago)){
  o[i]<-mean(Chicago[i,])
}
o
# 59.333333  43.250000   3.253333   9.916667 208.666667


names(o)<-rownames(Chicago)
o
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 59.333333       43.250000        3.253333        9.916667      208.666667 

apply(Chicago,1,mean)   # same code in one line

?lapply         # output is result
# transpose
t(Chicago)
# AvgHigh_F AvgLow_F AvgPrecip_inch DaysWithPrecip HoursOfSunshine
# Jan        32       18           2.05             10             135
# Feb        36       21           1.93              8             136
# Mar        46       30           2.72             11             187
# Apr        59       41           3.62             11             215
# May        70       52           4.13             11             281
# Jun        81       63           4.06             10             311
# Jul        84       68           4.02              9             318
# Aug        82       66           3.98              9             283
# Sep        75       57           3.31              8             226
# Oct        63       46           3.23             10             193
# Nov        48       34           3.43             11             113
# Dec        36       23           2.56             11             106

lapply(Weather,t)  # is same as =list(t(weather$chicago),t(weather$newyork),.,.)
mynewlist<-lapply(Weather,t)

############# adding a new row
rbind(Chicago,NewRow=1:12)
#                    Jan    Feb    Mar    Apr    May    Jun    Jul    Aug    Sep    Oct    Nov    Dec
# AvgHigh_F        32.00  36.00  46.00  59.00  70.00  81.00  84.00  82.00  75.00  63.00  48.00  36.00
# AvgLow_F         18.00  21.00  30.00  41.00  52.00  63.00  68.00  66.00  57.00  46.00  34.00  23.00
# AvgPrecip_inch    2.05   1.93   2.72   3.62   4.13   4.06   4.02   3.98   3.31   3.23   3.43   2.56
# DaysWithPrecip   10.00   8.00  11.00  11.00  11.00  10.00   9.00   9.00   8.00  10.00  11.00  11.00
# HoursOfSunshine 135.00 136.00 187.00 215.00 281.00 311.00 318.00 283.00 226.00 193.00 113.00 106.00
# NewRow            1.00   2.00   3.00   4.00   5.00   6.00   7.00   8.00   9.00  10.00  11.00  12.00

lapply(Weather,rbind,NewRow1=1:12)
rowMeans(Chicago)# same
apply(Chicago,1,mean)# same

lapply(Weather,rowMeans)
#$Chicago
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 59.333333       43.250000        3.253333        9.916667      208.666667 
# 
# $Houston
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 79.666667       60.166667        4.131667        8.250000      214.500000 
# 
# $NewYork
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 62.33333        48.00000         3.85250        10.08333       223.08333 
# 
# $SanFrancisco
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 63.833333       50.750000        1.970000        5.666667      245.833333 


# # # # similar are colmeans rowmeans

#################     [] operator


Weather$Chicago[1,1]
#32
Weather[[1]][1,1]
#32
lapply(Weather,'[',1,1)
# $Chicago
# [1] 32
# 
# $Houston
# [1] 63
# 
# $NewYork
# [1] 39
# 
# $SanFrancisco
# [1] 57
lapply(Weather,'[',1,)
# $Chicago
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
# 32  36  46  59  70  81  84  82  75  63  48  36 
# 
# $Houston
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
# 63  66  73  80  86  91  94  94  90  82  73  64 
# 
# $NewYork
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
# 39  42  50  60  71  79  85  83  76  65  54  44 
# 
# $SanFrancisco
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
# 57  60  62  63  64  66  67  68  70  69  63  57 
lapply(Weather,'[',,1)
# $Chicago
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 32.00           18.00            2.05           10.00          135.00 
# 
# $Houston
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 63.00           43.00            3.35            9.00          142.00 
# 
# $NewYork
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 39.0            26.0             3.9            11.0           154.0 
# 
# $SanFrancisco
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 57.00           46.00            4.49           11.00          165.00 

############## ADDING YOUR FUNCTIONS
lapply(Weather,function(x) x[1,])
# $Chicago
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
# 32  36  46  59  70  81  84  82  75  63  48  36 
# 
# $Houston
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
# 63  66  73  80  86  91  94  94  90  82  73  64 
# 
# $NewYork
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
# 39  42  50  60  71  79  85  83  76  65  54  44 
# 
# $SanFrancisco
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
# 57  60  62  63  64  66  67  68  70  69  63  57 
lapply(Weather,function(x) x[,12])####### column 12 of all weather
# $Chicago
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 36.00           23.00            2.56           11.00          106.00 
# 
# $Houston
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 64.00           45.00            3.74            9.00          148.00 
# 
# $NewYork
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 44.00           32.00            3.58           10.00          155.00 
# 
# $SanFrancisco
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 57.00           46.00            4.57           10.00          156.00 

lapply(Weather,function(z) z[1,]-z[2,])
# $Chicago
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
# 14  15  16  18  18  18  16  16  18  17  14  13 
# 
# $Houston
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
# 20  19  20  21  18  17  19  19  20  21  21  19 
# 
# $NewYork
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
# 13  13  15  16  16  15  15  14  15  15  13  12 
# 
# $SanFrancisco
# Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec 
# 11  13  13  14  13  13  13  13  15  15  13  11 
lapply(Weather,function(z) round((z[1,]-z[2,])/z[2,],2))
# $Chicago
# Jan  Feb  Mar  Apr  May  Jun  Jul  Aug  Sep  Oct  Nov  Dec 
# 0.78 0.71 0.53 0.44 0.35 0.29 0.24 0.24 0.32 0.37 0.41 0.57 
# 
# $Houston
# Jan  Feb  Mar  Apr  May  Jun  Jul  Aug  Sep  Oct  Nov  Dec 
# 0.47 0.40 0.38 0.36 0.26 0.23 0.25 0.25 0.29 0.34 0.40 0.42 
# 
# $NewYork
# Jan  Feb  Mar  Apr  May  Jun  Jul  Aug  Sep  Oct  Nov  Dec 
# 0.50 0.45 0.43 0.36 0.29 0.23 0.21 0.20 0.25 0.30 0.32 0.38 
# 
# $SanFrancisco
# Jan  Feb  Mar  Apr  May  Jun  Jul  Aug  Sep  Oct  Nov  Dec 
# 0.24 0.28 0.27 0.29 0.25 0.25 0.24 0.24 0.27 0.28 0.26 0.24 

################################## sapply
?sapply
  
lapply(Weather,'[',1,7)
is.list(lapply(Weather,'[',1,7))
# true
# $Chicago
# [1] 84
# 
# $Houston
# [1] 94
# 
# $NewYork
# [1] 85
# 
# $SanFrancisco
# [1] 67

sapply(Weather,'[',1,7)
# Chicago      Houston      NewYork SanFrancisco 
# 84           94           85           67 
is.vector(sapply(Weather,'[',1,7))
#true
lapply(Weather,'[',1,10:12)
# $Chicago
# Oct Nov Dec 
# 63  48  36 
# 
# $Houston
# Oct Nov Dec 
# 82  73  64 
# 
# $NewYork
# Oct Nov Dec 
# 65  54  44 
# 
# $SanFrancisco
# Oct Nov Dec 
# 69  63  57
sapply(Weather,'[',1,10:12)
# Chicago Houston NewYork SanFrancisco
# Oct      63      82      65           69
# Nov      48      73      54           63
# Dec      36      64      44           57


lapply(Weather,rowMeans)
# $Chicago
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 59.333333       43.250000        3.253333        9.916667      208.666667 
# 
# $Houston
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 79.666667       60.166667        4.131667        8.250000      214.500000 
# 
# $NewYork
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 62.33333        48.00000         3.85250        10.08333       223.08333 
# 
# $SanFrancisco
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 63.833333       50.750000        1.970000        5.666667      245.833333 

sapply(Weather,rowMeans)
# Chicago    Houston   NewYork SanFrancisco
# AvgHigh_F        59.333333  79.666667  62.33333    63.833333
# AvgLow_F         43.250000  60.166667  48.00000    50.750000
# AvgPrecip_inch    3.253333   4.131667   3.85250     1.970000
# DaysWithPrecip    9.916667   8.250000  10.08333     5.666667
# HoursOfSunshine 208.666667 214.500000 223.08333   245.833333


sapply(Weather,function(z) round((z[1,]-z[2,])/z[2,],2))
# Chicago Houston NewYork SanFrancisco
# Jan    0.78    0.47    0.50         0.24
# Feb    0.71    0.40    0.45         0.28
# Mar    0.53    0.38    0.43         0.27
# Apr    0.44    0.36    0.36         0.29
# May    0.35    0.26    0.29         0.25
# Jun    0.29    0.23    0.23         0.25
# Jul    0.24    0.25    0.21         0.24
# Aug    0.24    0.25    0.20         0.24
# Sep    0.32    0.29    0.25         0.27
# Oct    0.37    0.34    0.30         0.28
# Nov    0.41    0.40    0.32         0.26
# Dec    0.57    0.42    0.38         0.24

sapply(Weather,rowMeans)
typeof(sapply(Weather,rowMeans))
#double
sapply(Weather,rowMeans,simplify = F)
typeof(sapply(Weather,rowMeans,simplify = F))
#list

########################  NESTED APPLY
######## apply across a whole list
lapply(Weather,apply,1,max) ############### preferred approach
# $Chicago
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 84.00           68.00            4.13           11.00          318.00 
# 
# $Houston
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 94.00           75.00            5.91           10.00          294.00 
# 
# $NewYork
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 85.00           70.00            4.53           12.00          302.00 
# 
# $SanFrancisco
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 70.00           55.00            4.57           11.00          330.00 

lapply(Weather,function(z) apply(z,1,max))

###################
sapply(Weather,apply,1,max)
# Chicago Houston NewYork SanFrancisco
# AvgHigh_F         84.00   94.00   85.00        70.00
# AvgLow_F          68.00   75.00   70.00        55.00
# AvgPrecip_inch     4.13    5.91    4.53         4.57
# DaysWithPrecip    11.00   10.00   12.00        11.00
# HoursOfSunshine  318.00  294.00  302.00       330.00
sapply(Weather,apply,1,min)


########################### which.max 
?which.max
#returns the index
which.max(Chicago[1,])
# Jul 
# 7
names(which.max(Chicago[1,]))
# "Jul"
apply(Chicago,1,function(x) names(which.max(x)))
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# "Jul"           "Jul"           "May"           "Mar"           "Jul" 

##### now we want to iterate the above over a whole list
lapply(Weather,function(y) apply(y,1,function(x) names(which.max(x))))
# $Chicago
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# "Jul"           "Jul"           "May"           "Mar"           "Jul" 
# 
# $Houston
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# "Jul"           "Jul"           "Jun"           "Jun"           "Jul" 
# 
# $NewYork
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# "Jul"           "Jul"           "Jul"           "Mar"           "Jul" 
# 
# $SanFrancisco
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# "Sep"           "Aug"           "Dec"           "Jan"           "Jun" 
lapply(Weather,function(x) names(which.max(x)))   ####### error
# $Chicago
# NULL
# 
# $Houston
# NULL
# 
# $NewYork
# NULL
# 
# $SanFrancisco
# NULL
sapply(Weather,function(y) apply(y,1,function(x) names(which.max(x))))
# Chicago Houston NewYork SanFrancisco
# AvgHigh_F       "Jul"   "Jul"   "Jul"   "Sep"       
# AvgLow_F        "Jul"   "Jul"   "Jul"   "Aug"       
# AvgPrecip_inch  "May"   "Jun"   "Jul"   "Dec"       
# DaysWithPrecip  "Mar"   "Jun"   "Mar"   "Jan"       
# HoursOfSunshine "Jul"   "Jul"   "Jul"   "Jun"       





