# FIRST WE HAVE OPENED THE BASKETBALL DATA THEN RUN AND SAVE IT IN THE ENVIRONMENT THEN PROCEEDING HERRE
# using matrix functions
A<-1:10
a<-matrix(A,4,5)
a
#       [,1] [,2] [,3] [,4] [,5]
# [1,]    1    5    9    3    7
# [2,]    2    6   10    4    8
# [3,]    3    7    1    5    9
# [4,]    4    8    2    6   10
a<-matrix(A,4,5,byrow = T)
a
# [,1] [,2] [,3] [,4] [,5]
# [1,]    1    2    3    4    5
# [2,]    6    7    8    9   10
# [3,]    1    2    3    4    5
# [4,]    6    7    8    9   10
# BUILDING MATRIX USING RBIND AND CBIND
x<-c("a","b","c","d")
y<-c("p","q","r","s")
z<-rbind(x,y)
z
# [,1] [,2] [,3] [,4]
# x "a"  "b"  "c"  "d" 
# y "p"  "q"  "r"  "s" 
Z<-cbind(x,y)
Z
# x   y  
# [1,] "a" "p"
# [2,] "b" "q"
# [3,] "c" "r"
# [4,] "d" "s"

# ADDING ROWS AND COLUMN NAMES

charlie<-1:5
names(charlie)  # null you can add names 
names(charlie)<-c("A","B","C","D","E")
names(charlie)
charlie
# A B C D E 
# 1 2 3 4 5 
typeof(charlie) #integer
# NAMING MATRIX DIMENSIONS
tempvec<-rep(c("a","b","c"),each=3)
tempvec
bravo<-matrix(tempvec,3,3)
bravo
# [,1] [,2] [,3]
# [1,] "a"  "b"  "c" 
# [2,] "a"  "b"  "c" 
# [3,] "a"  "b"  "c" 
# ADDING ROW AND COLUMN NAMES
rownames(bravo)# null you can add 
colnames(bravo)#  null you can add
rownames(bravo)<-c("hey","suck","it")
bravo
colnames(bravo)<-c("lets","be","cops")
bravo
# lets be  cops
# hey  "a"  "b" "c" 
# suck "a"  "b" "c" 
# it   "a"  "b" "c" 

#MATRIX OPERATIONS
Games
rownames(Games)
colnames(Games)
# COLNAMES AND ROWNAMES CAN BE ALSO USED TO GET DATA FROM MATRICES
# USING APHSTROPHE QUOTATIONS
Games["LeBronJames","2012"]
# MULTIPLICATION DIVISON AND OTHER OPERATIONS ALSO POSSIBLE
FieldGoals/Games
#  you can round off according to your requirement
round(FieldGoals/Games)
round(FieldGoals/Games,1)# for 1 deccimal place
round(MinutesPlayed/Games)


# MATPLOT
?matplot
# it plots column of matrix and fieldgoal matrix should have names and playtime for players so we need transpose using t functions
FieldGoals
# type a and d are not valid c has separated lines so better is type b
?t
t(FieldGoals)
matplot(t(FieldGoals),type="b",pch=1:10,col = 1:10)
legend("bottomleft",inset = 0.01,legend = Players,col=1:10,pch = 1:10)# inset from how far from bottom left corner
# here you can divide fieldgoals
# such as divide by field goals and field goals attempts

# subsetting the data into smaller matrices
Games
Games[1:3,6:10]
Games[c(1,10),]
Games[,c("2005","2009")]
###
Games[1,]
# here you are not getting kobe's name so it is not considered as matrix
is.vector(Games[1,])  #TRUE
is.matrix(Games[1,])  #FALSE
# similar vector
Games[1,5]

#  TO SOLVE THIS ERROR  USE , AND DROP=f BY DEFAULT IT IS TRUE
Games[1,,drop=F]
Games[1,5,drop=F]

# VISUALISING SUBSETS
Data<-MinutesPlayed[1:3,]
Data
matplot(t(Data),type="b",pch=1:10,col = 1:10)
legend("bottomleft",inset = 0.01,legend = Players[1:3],col=1:10,pch = 1:10)
# for one player put drop=F
Data<-MinutesPlayed[1,,drop=F]
Data
matplot(t(Data),type="b",pch=1:10,col = 1:10)
legend("bottomleft",inset = 0.01,legend = Players[1],col=1:10,pch = 1:10)
Data


# CREATING FIRST FUNCTION TO MAKE OUR WORK EASY SO THAT  TO MAKE PLOT WE DONT  HAVE TO COPY IT AGAIN AGAIN

#function(parameter ){
# paste your content here  }

myplot<-function(){
  Data<-MinutesPlayed[1:5,,drop=F]
  Data
  matplot(t(Data),type="b",pch=1:10,col = 1:10)
  legend("bottomleft",inset = 0.01,legend = Players[1:5],col=1:10,pch = 1:10)
  
}# this will save the data in environment
myplot() # this will create the visualisation

myplot<-function(rows){                         # adding parameter rows
  Data<-MinutesPlayed[rows,,drop=F]
  matplot(t(Data),type="b",pch=1:10,col = 1:10)
  legend("bottomleft",inset = 0.01,legend = Players[rows],col=1:10,pch = 1:10)
  
}# this will save the data in environment
myplot(1:5) # this will create the visualisation


#
myplot1<-function(data,rows=1:10){                         # adding parameter rows
  data<-Games[rows,,drop=F]
  matplot(t(data),type="b",pch=1:10,col = 1:10)
  legend("bottomleft",inset = 0.01,legend = Players[rows],col=1:10,pch = 1:10)
  
}
myplot1(Games,1:2)
#
#
myplot2<-function(data,rows=1:10){                         # adding parameter rows
  Data<-data[rows,,drop=F]
  matplot(t(Data),type="b",pch=1:10,col = c(1:4,6))
  legend("bottomleft",inset = 0.01,legend = Players[rows],col=c(1:4,6),pch = 1:10)
  
}
myplot2(Games)
myplot2(Salary)
myplot2(Salary/Games)
myplot2(Salary/FieldGoals)
# IN GAME METRICS
myplot2(MinutesPlayed)
myplot2(Points)

# IN GAME METRICS NORMALISED
myplot2(FieldGoals/Games)
myplot2(FieldGoals/FieldGoalAttempts)
myplot2(FieldGoalAttempts/Games)
myplot2(Points/Games)


# INTERESTING OBSERVVATIONS
myplot2(MinutesPlayed/Games)
myplot2(Games)

# VALUE OF TIME
myplot2(FieldGoals/MinutesPlayed)
# PLAYERS STYLE
myplot2(Points/FieldGoals)
myplot2(Salary/MinutesPlayed)
myplot2(Points/Games)
myplot2()