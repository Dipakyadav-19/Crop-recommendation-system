cat("Select City Number:\n\n1 AHMEDNAGAR\n2 AKOLA\n3 AMRAVATI\n4 AURANGABAD\n5 BEED\n6 B`HANDARA\n7 BULDHANA\n8 CHANDRAPUR\n9 DHULE\n10 GADCHIROLI\n11 GONDIA\n12 HINGOLI\n13 JALGAON\n14 JALNA\n15 KOLHAPUR\n16 LATUR\n17 NAGPUR\n18 NANDED\n19 NANDURBAR\n20 NASHIK\n21 OSMANABAD\n22 PARBHANI\n23 PUNE\n24 RAIGAD\n25 RATNAGIRI\n26 SANGLI\n27 SATARA\n28 SINDHUDURG\n29 SOLAPUR\n30 THANE\n31 WARDHA\n32 WASHIM\n33 YAVATMAL\n34 MUMBAI\n\nChoose Corresponding Number to Your City from the Given List:\n")
options(warn = -1)
readinteger <- function()
{ 
  n <- readline(prompt="Enter City Number: ")
  n <- as.integer(n)
  if (is.na(n)){
    n <- readinteger()
  }
  return(n)
}
y <- readinteger()
cityname <- switch(y,"AHMEDNAGAR","AKOLA","AMRAVATI","AURANGABAD","BEED","BHANDARA","BULDHANA","CHANDRAPUR","DHULE","GADCHIROLI","GONDIA","HINGOLI","JALGAON","JALNA","KOLHAPUR","LATUR","NAGPUR","NANDED","NANDURBAR","NASHIK","OSMANABAD","PARBHANI","PUNE","RAIGAD","RATNAGIRI","SANGLI","SATARA","SINDHUDURG","SOLAPUR","THANE","WARDHA","WASHIM","YAVATMAL","MUMBAI")
cat("Selected city :")
print(cityname)

data1 <- read.csv("District_ph.csv")
data2 <- read.csv("Crop_ph.csv")

subval1 <- subset(data1, data1$City == cityname, select = c("City","pH_min","pH_max"))
cat("Data of city :")
print(subval1)


result1 <- subset(data2,data2$pH_Req <= subval1$pH_min & data2$pH_max_Range >= subval1$pH_max, select = c("Crop"))
 
par(mfrow=c(2, 3))

boxplot(data1$pH_max, main="Max_pH", sub=paste("Outlier rows: ", boxplot.stats(data1$pH_max)$out)) 
boxplot(data1$pH_min, main="Min_pH", sub=paste("Outlier rows: ", boxplot.stats(data1$pH_min)$out)) 

boxplot(data2$pH_Req, main="Req_pH", sub=paste("Outlier rows: ", boxplot.stats(data2$pH_Req)$out)) 
boxplot(data2$pH_max_Range, main="Max_pH_Range", sub=paste("Outlier rows: ", boxplot.stats(data2$pH_max_Range)$out)) 
boxplot(data2$pH_min_Range, main="Min_pH_Range", sub=paste("Outlier rows: ", boxplot.stats(data2$pH_min_Range)$out)) 

library(e1071)
par(mfrow=c(1, 2))  
plot(density(data1$pH_min), main="Density Plot: City_pH_min", ylab="Plot", sub=paste("Skewness:", round(e1071::skewness(data1$pH_min), 2)))  
polygon(density(data1$pH_min), col="red")
plot(density(data2$pH_Req), main="Density Plot: Crop_pH_Req", ylab="Plot", sub=paste("Skewness:", round(e1071::skewness(data2$pH_Req), 2)))  
polygon(density(data2$pH_Req), col="red")
cat("\nCrops:\n")
print(result1)


rainfallavailabledata <- read.csv("MaharashtrastateRainfall.csv")
head(rainfallavailabledata)
subvalrainfall <- subset(rainfallavailabledata, rainfallavailabledata$District == cityname, select = c("State","District","Year","January","February","March","April","May","June","July","August","September","October","November","December","Annual_Total"))
convertednumbers <- as.numeric(as.vector(subvalrainfall$Annual_Total),na.rm=TRUE)
totalrainfall = mean(convertednumbers,na.rm=TRUE)
avgrainfall = totalrainfall/12
cat("\nAvarage rainfall :")
print(avgrainfall)
par(mfrow=c(1, 1))  
#na.omit(subvalrainfall$Annual_Total)
plot(density(as.numeric(subvalrainfall$Annual_Total),na.rm=TRUE), main="Density Plot: City_Annual_Rainfall", ylab="Plot", sub=paste("Skewness:", round(e1071::skewness(as.numeric(subvalrainfall$Annual_Total),na.rm=TRUE), 2)))  
polygon(density(as.numeric(subvalrainfall$Annual_Total),na.rm=TRUE), col="red")
croprainfalltempdata <- read.csv("CropRequiredTemperature.csv")
head(croprainfalltempdata)
result2 <- subset(croprainfalltempdata, (croprainfalltempdata$min_rainfall<=avgrainfall & croprainfalltempdata$max_rainfall>=avgrainfall), select = c("Crop"))
par(mfrow=c(1, 2))
plot(density(as.numeric(croprainfalltempdata$max_rainfall)), main="Density Plot: Crop_Max_Rainfall", ylab="Plot", sub=paste("Skewness:", round(e1071::skewness(as.numeric(croprainfalltempdata$max_rainfall)), 2)))  
polygon(density(as.numeric(croprainfalltempdata$max_rainfall)), col="red")
plot(density(as.numeric(croprainfalltempdata$min_rainfall)), main="Density Plot: Crop_Min_Rainfall", ylab="Plot", sub=paste("Skewness:", round(e1071::skewness(as.numeric(croprainfalltempdata$min_rainfall)), 2)))  
polygon(density(as.numeric(croprainfalltempdata$min_rainfall)), col="red")
cat("\nCrop:\n")
print(result2)


areaproductiondata <- read.csv("CropData.csv")
head(areaproductiondata)
subval <- subset(areaproductiondata, areaproductiondata$District_Name == cityname, select = c("State_Name","District_Name","Crop_Year","Season","Crop","Area","Production"))
cat("\nSub crops:\n")
print(subval)
par(mfrow=c(1, 1))  
plot((areaproductiondata$Area/1000)[areaproductiondata$District_Name==cityname],(areaproductiondata$Production/1000)[areaproductiondata$District_Name==cityname],main = "Area vs Production")
plot((areaproductiondata$Area)[areaproductiondata$District_Name==cityname],(areaproductiondata$Production)[areaproductiondata$District_Name==cityname],main = "Area vs Production")
abline(lm(subval$Production~subval$Area,data=faithful))
plot((areaproductiondata$Crop_Year)[areaproductiondata$District_Name==cityname],(areaproductiondata$Production)[areaproductiondata$District_Name==cityname],main = "year vs Production")

max((subval$Production)/(subval$Area),na.rm=TRUE) 
expectedcropname <- subval[which.max(subval$Production/subval$Area),]
cat("\nExpected crop :\n")
print(expectedcropname)
cat("\nExpected crop :\n")
print(expectedcropname$Crop)
avgcrop<- mean((subval$Production)/(subval$Area),na.rm=TRUE)
cat("\nAvarage of crop production :")
print(avgcrop)
result3 <- subset(subval, (subval$Production/subval$Area)>avgcrop, select = c("Crop"))
cat("\nCrop:\n")
print(unique(result3))
#x=max((climatecitydata$Production/climatecitydata$Area),na.rm=TRUE,subset=climatecitydata$District_Name=="YAVATMAL")
#print(x)
unusefulcrop <- subval[which.min(subval$Production/subval$Area),]
cat("\nUnuseful crops:\n")
print(unusefulcrop)
cat("\nUnuseful crops:\n")

print(unusefulcrop$Crop)
#install.packages("dplyr")
library(dplyr)
class(result2)
class(result1)
cat("Crop Predicted By Considering PH Value and Rainfall Factors:\t\n")
print(unique(intersect(as.vector(result2), as.vector(result1))))

cat("Crop Predicted By Considering Rainfall and Area-Production Factors:\t\n")
print(unique(intersect(as.vector(result2), as.vector(result3))))

cat("Crop Predicted By Considering PH Value and Area-Production Factors:\t\n")
print(unique(intersect(as.vector(result1), as.vector(result3))))

cat("Crop Predicted By Considering All Three Factors Factors:\t\n")
rs12<-unique(intersect(as.vector(result2), as.vector(result1)))
rs3<-as.vector(result3)
print(unique(intersect(rs12,rs3)))
df=data.frame(areaproductiondata$Crop_Year[areaproductiondata$District_Name==cityname],areaproductiondata$Production[areaproductiondata$District_Name==cityname])

a=ggplot(df,aes((areaproductiondata$Crop_Year)[areaproductiondata$District_Name==cityname],(areaproductiondata$Production)[areaproductiondata$District_Name==cityname]))+geom_bar()


print(a)
