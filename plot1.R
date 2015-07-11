
## Exploratory data Analysis Programming Assignment 1

## This is a script that reads in electric power consumption data and generates the first
## exploratory plot for a 2 day period in Feb 2007

elecdata<-read.csv2("household_power_consumption.txt", header=TRUE, na.strings = "?",
                    stringsAsFactors=FALSE) # read in data AS CHARACTERS (stringsAsFactors)

elecdata<-subset(elecdata,Date == "1/2/2007" | Date == "2/2/2007") # select 2 days of interest

for (i in 3:9) { # loop thru' columns 3 to 9
  elecdata[,i] <- as.numeric(as.character(elecdata[,i])) # convert data to numeric    
} 

temp=par(mar = c(5, 5, 4, 1)) # temporarily adjust the plot margins
hist(elecdata$Global_active_power,main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",col="red") # plot histogram

dev.copy(png,file = "plot1.png",width=480,height=480) ## Copy plot to a PNG file
dev.off() # turn PNG device off
par(temp) # reset the window to original