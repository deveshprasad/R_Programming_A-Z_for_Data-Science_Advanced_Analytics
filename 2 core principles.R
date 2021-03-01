#VARIABLES

# 1. INTEGER L IS REQUIRED OTHERWISE BY DEFAULT IT WILL BE DOUBLE
x<-2L
class(x)
typeof(x)

# DOUBLE
y<-2
class(y)
typeof(y)

#complex
z<-3+2i
class(z) 
typeof(z)

#character
a<-"h"
typeof(a)
class(a)

#logical
a1<-T
class(a1)

c<-x+y
c

A<-"hello"
B<-"sucker"
C<-paste(A,B)
C
#TRUE|FALSE GIVES TRUE FOR ONE OF IT TRUE OPP WITH &
d<-x!=y
d
isTRUE(d)

#WHILE
i<-1
while (i<12) {
  print(i)
  i=i+1
}
# [1] 1
# [1] 2
# [1] 3
# [1] 4
# [1] 5
# [1] 6
# [1] 7
# [1] 8
# [1] 9
# [1] 10
# [1] 11


#FOR
for (i in 1:5) {
  print("www")
}
# [1] "www"
# [1] "www"
# [1] "www"
# [1] "www"
# [1] "www"

# if else
x<-rnorm(1)
if(x>1){
  answer<-"greator"
}else if (x<1){
  answer<-"lesser"
}else {
  answer<-"suck it"
}
x

# LAW OF LARGE NO HW
n<-10000
counter<-1
for (i in rnorm(n)) {
  if(i<1 & i>-1){
    counter<-counter+1
  }  
  
}
counter
answer<-counter/n
answer
#### for 10000 the value is 0.68 something 
############################## R PRACTICAL ########################
############## 1
X<-10:19
X

Y<-seq(25,44,2)
Y

##################   2
edu1<-c("School","Graduation","Post Graduation","MPHIL","PHD")
##################  3
z1<-seq(1,20,0.25)
z1  
############  4
R1<-rep(5,10)
R1
R2<-rep(TRUE,8)
R2
R3<-rep(seq(2,5,0.5),5)
R3
R4<-rep(c(seq(1,5,2),seq(2,6,2),c("head","head","head")),5)
R4
################  5
res1<-X+Y
res2<-X-Y
res3<-X*Y
res4<-X/Y
res1
res2
res3
res4

#################   6
res2[6]
res1[c(-1,-5)]
res4[c(-9)]
res3[1:4]
for(i in res1){
  while (i<40) {
    print(i)
    
  }
  
}

?seq

