household_data_file <- "./data/household_power_consumption.txt"

household_data <- read.table(household_data_file, header=TRUE, sep=";", 
                             stringsAsFactors=FALSE, dec=".")

reqd_data <- household_data[household_data$Date %in% c("1/2/2007","2/2/2007") ,]

Global_Active_Power <- as.numeric(reqd_data$Global_active_power)

png("plot1.png", width=480, height=480)

hist(Global_Active_Power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()