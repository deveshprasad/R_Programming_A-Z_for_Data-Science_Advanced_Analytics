#VECTOR
V<-c(2,3,4,5,6) # is numeric and double
V1<-c(2L,3L,4L,5L,6L)# is numeric and integer
V2<-C(2,3L,"CH",7) # not interpretable if character or numeric
V3<-c("a","b","c",7)# 7 gets converted into character
V
V1
V2
V3
is.character()
is.double()
is.integer()
is.numeric()
typeof()
# true and false are logical types

?seq

#sequence sam e as colon except for the skipping part
seq(1,10,length.out=2)
#alongwith we will show the same amount of observtaions specified with along with category
#length.out to get the desired no. of outputs reqiured
# replicate
#rep(no/character,times)
rep(devesh,5)
# instead of times use each if you want each 1 to be repeated desired times one after other

x<-c("a","b")
y<-rep(x,10)
y

# srting vectors
V[1]
V[1:3]
V[1:10]
V[c(1,3,5)]
V[-2]# REMOVES THAT PARTICULAR VECTOR
V[c(-1,-3,-5)]
V[c(2,4)]


# vector operations
x<-rnorm(5)
for (i in x) {
   print(i)  
}


N<-10
a<-rnorm(N)
b<-rnorm(N)

# vector method
c<-a*b
c

# de vectorized approach
# create empty vector
d<-rep(NA,N)
for (i in 1:N) {
  d[i]<-a[i]*b[1]
}
d

# VECTOR METHOD IS MUCH EASIER
?c
?paste

#  INSTALLING PACKAGES THROUGH CODE
install.packages("name of package you want")
# if you search about any its element it will say not found...
# after installation you have to activate it using library
#         ex qplot a part of ggplot 2                                                     library(package name without quotes)
?diamonds
qplot(data=diamonds,carat,price,colour=clarity ,facets=.~clarity)


# HW FINANCIAL STATEMENT
#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
