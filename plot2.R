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


# Plot the graph
plot(powerdatasubset$Time,as.numeric(as.character(powerdatasubset$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

#Copy to png and close the device
dev.copy(png, file="plot2.png")
dev.off()