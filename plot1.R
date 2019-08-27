#Set working directory
setwd("D:\\Training\\Coursera\\Exploratory Data Analysis (Graphs)")

#Read Data
powerdata <- read.table("household_power_consumption.txt",sep=";")
names(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Subset of data from  dates 2007-02-01 and 2007-02-02
powerdatasubset <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

#Plot Histogram of Global Active Power
hist(as.numeric(as.character(powerdatasubset$Global_active_power)),col="red",xlab="Global Active Power(kilowatts)", main="Global Active Power")

#Copy the graph to plot.png and close the png device
dev.copy(png, file="plot1.png")
dev.off()