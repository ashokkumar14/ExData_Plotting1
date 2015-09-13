household_data_file <- "./data/household_power_consumption.txt"

# Get Data
household_data <- read.table(household_data_file, header=TRUE, sep=";", 
                             stringsAsFactors=FALSE, dec=".")

# Subset data for Feb 1 & 2, 2007
reqd_data <- household_data[household_data$Date %in% c("1/2/2007","2/2/2007") ,]

Global_Active_Power <- as.numeric(reqd_data$Global_active_power)

# Get Timestamp
timestmp <- strptime(paste(reqd_data$Date, reqd_data$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S") 
# Set size
png("plot2.png", width=480, height=480)

# Plot
plot(timestmp, Global_Active_Power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()

