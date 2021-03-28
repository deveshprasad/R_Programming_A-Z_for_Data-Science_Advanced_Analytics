#ggplot2 package should be installed first and activated
mydata=read.csv(file.choose())
names(mydata)
attach(mydata)
?ggplot
ggplot(data=mydata[mydata$carat<2.5,],aes(x=carat,y=price,colour=clarity))+
  geom_point(alpha=0.1)+
  geom_smooth()
#ggplot2 package should be installed first and activated
# if no color  then all will be in black
#for transparency # to cut area mydata$xaxis<required no
