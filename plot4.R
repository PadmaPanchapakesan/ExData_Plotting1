#Set working directory
setwd("D:\\Training\\Coursera\\Exploratory Data Analysis (Graphs)")

#Read Data
powerdata <- read.table("household_power_consumption.txt",sep=";")
names(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Subset of data from  dates 2007-02-01 and 2007-02-02
powerdatasubset <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

# Converting dates
powerdatasubset$Date <- as.Date(powerdatasubset$Date, format="%d/%m/%Y")
powerdatasubset$Time <- strptime(powerdatasubset$Time, format="%H:%M:%S")
powerdatasubset[1:1440,"Time"] <- format(powerdatasubset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powerdatasubset[1441:2880,"Time"] <- format(powerdatasubset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

par(mfrow = c(2,2))

with(powerdatasubset, {
#Plot Global Active power vs Time
plot(powerdatasubset$Time,powerdatasubset$Global_active_power,type="l",xlab="",ylab="Global Active Power") 
plot(powerdatasubset$Time,powerdatasubset$Voltage,type="l",xlab="datetime",ylab="Voltage") 
plot(powerdatasubset$Time,powerdatasubset$Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering") 
with(powerdatasubset, lines(powerdatasubset$Time,powerdatasubset$Sub_metering_1,col="black")) 
with(powerdatasubset, lines(powerdatasubset$Time,powerdatasubset$Sub_metering_2,col="red")) 
with(powerdatasubset, lines(powerdatasubset$Time,powerdatasubset$Sub_metering_3,col="blue")) 
legend("topright",lty=1, col=c("black","red","blue"),legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.2)
plot(powerdatasubset$Time,powerdatasubset$Global_reactive_power,type="l",xlab="",ylab="Global_reactive_power") 


})
# Plot the graph

#Copy to png and close the device
dev.copy(png, file="plot4.png")
dev.off()