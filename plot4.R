household_data_file <- "./data/household_power_consumption.txt"

household_data <- read.table(household_data_file, header=TRUE, sep=";", 
                             stringsAsFactors=FALSE, dec=".")

reqd_data <- household_data[household_data$Date %in% c("1/2/2007","2/2/2007") ,]

timestmp <- strptime(paste(reqd_data$Date, reqd_data$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 

Global_Active_Power <- as.numeric(reqd_data$Global_active_power)

Global_Reactive_Power <- as.numeric(reqd_data$Global_reactive_power)

Voltage <- as.numeric(reqd_data$Voltage)

Sub_Metering_1 <- as.numeric(reqd_data$Sub_metering_1)
Sub_Metering_2 <- as.numeric(reqd_data$Sub_metering_2)
Sub_Metering_3 <- as.numeric(reqd_data$Sub_metering_3)


png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(timestmp, Global_Active_Power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(timestmp, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(timestmp, Sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(timestmp, Sub_Metering_2, type="l", col="red")
lines(timestmp, Sub_Metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(timestmp, Global_Reactive_Power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()