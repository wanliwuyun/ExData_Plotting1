plot3 <- function() {
    colName <- c("Date", "Time", "GAP", "GRP", "Voltage", "GI", "subM1", "subM2", "subM3")
    # Load the data
    data <- read.table("household_power_consumption.txt", sep = ";", na.string = "?", nrow = 2880, skip = 66637, col.names = colName)
    # Convert date and time
    data$dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    # Create png
    png(file = "plot3.png", width = 480, height = 480, units = "px")
    # Plot each graph
    plot(data$dateTime, data$subM1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
    lines(data$dateTime, data$subM2, type = "l", col = "red")
    lines(data$dateTime, data$subM3, type = "l", col = "blue")
    legend("topright", lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
}