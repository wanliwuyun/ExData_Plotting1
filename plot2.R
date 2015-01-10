plot2 <- function() {
    colName <- c("Date", "Time", "GAP", "GRP", "Voltage", "GI", "subM1", "subM2", "subM3")
    # Load the data
    data <- read.table("household_power_consumption.txt", sep = ";", na.string = "?", nrow = 2880, skip = 66637, col.names = colName)
    # Convert date and time
    data$dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    # Create png
    png(file = "plot2.png", width = 480, height = 480, units = "px")
    # Plot each graph
    plot(data$dateTime, data$GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    dev.off()
}