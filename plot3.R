household_data_file <- "./data/household_power_consumption.txt"

household_data <- read.table(household_data_file, header=TRUE, sep=";", 
                             stringsAsFactors=FALSE, dec=".")

reqd_data <- household_data[household_data$Date %in% c("1/2/2007","2/2/2007") ,]

timestmp <- strptime(paste(reqd_data$Date, reqd_data$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 

Sub_Metering_1 <- as.numeric(reqd_data$Sub_metering_1)
Sub_Metering_2 <- as.numeric(reqd_data$Sub_metering_2)
Sub_Metering_3 <- as.numeric(reqd_data$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(timestmp, Sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(timestmp, Sub_Metering_2, type="l", col="red")
lines(timestmp, Sub_Metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()