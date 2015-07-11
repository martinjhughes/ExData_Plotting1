
## Exploratory data Analysis Programming Assignment 1

## This is a script that reads in electric power consumption data and generates the fourth
## exploratory plot for a 2 day period in Feb 2007

elecdata<-read.csv2("household_power_consumption.txt", header=TRUE, na.strings = "?",
                    stringsAsFactors=FALSE) # read in data AS CHARACTERS (stringsAsFactors)

elecdata<-subset(elecdata,Date == "1/2/2007" | Date == "2/2/2007") # select 2 days of interest

for (i in 3:9) { # loop thru' columns 3 to 9
  elecdata[,i] <- as.numeric(as.character(elecdata[,i])) # convert data to numeric    
} 
dateTime<-strptime(paste(elecdata$Date, elecdata$Time, sep = " "),"%d/%m/%Y %H:%M:%S") # combine date + time
elecdata<-cbind(elecdata,dateTime) # add a new column to the dataset, containing date-time data

temp=par(mfrow=c(2,2)) # temporarily adjust the window

plot(elecdata$dateTime,elecdata$Global_active_power,type="l",xlab = "", ylab = "Global Active Power (kilowatts)")# plot line graph

plot(elecdata$dateTime,elecdata$Voltage,type="l",xlab = "datetime", ylab = "Voltage")# plot line graph

with(elecdata, {
  plot(dateTime, Sub_metering_1, type="l",xlab = "", ylab = "Energy sub metering")
  points(dateTime, Sub_metering_2, type="l",col="red")
  points(dateTime, Sub_metering_3, type="l",col="blue")
})
legend(x='topright', legend=c('sub metering 1','sub metering 2', 'sub metering 3'),
       lty="solid", col=c("black","red","blue"),bty="n",cex=0.8)

plot(elecdata$dateTime,elecdata$Global_reactive_power,type="l",xlab = "datetime", ylab = "Global reactive Power (kilowatts)")# plot line graph

dev.copy(png,file = "plot4.png",width=480,height=480) ## Copy plot to a PNG file
dev.off() # turn PNG device off
par(temp) # reset the window to original