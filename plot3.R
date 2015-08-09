

##verify file existence. Download if it doesnt exist
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile<-"exdata-data-household_power_consumption.zip"
if (!file.exists("household_power_consumption.txt")) {
        if(!file.exists(zipfile)) {
                ## Download the data file
                download.file(fileURL, destfile=zipfile)
        }
        ## Unzip the data file
        unzip(zipfile)
}

##load data
data<-read.table("household_power_consumption.txt",sep=";",heade=T)
##extract the desired data
subdata<-subset(data, Date == "1/2/2007" | Date == "2/2/2007")
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(subdata$Global_active_power)
Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)

#set png page setup
png("plot3.png", width=480, height=480)

#plot the desired graph
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering")
points(datetime, Sub_metering_2, type="l", col="red")
points(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#shutdown current graphic device
dev.off()
