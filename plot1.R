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

##load data into data.frame format
data<-read.table("household_power_consumption.txt",sep=";",heade=T)
##extract the desired data
subdata<-subset(data, Date == "1/2/2007" | Date == "2/2/2007")
Global_active_power<-as.numeric(as.character(subdata$Global_active_power))

#set png page setup
png("plot1.png", width=480, height=480)

hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#shutdown current device
dev.off()
