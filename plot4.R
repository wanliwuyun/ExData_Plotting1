plot4 <- function() {
    colName <- c("Date", "Time", "GAP", "GRP", "Voltage", "GI", "subM1", "subM2", "subM3")
    # Load the data
    data <- read.table("household_power_consumption.txt", sep = ";", na.string = "?", nrow = 2880, skip = 66637, col.names = colName)
    # Convert date and time
    data$dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    # Create png
    png(file = "plot4.png", width = 480, height = 480, units = "px")
    par(mfrow = c(2,2))
    # Plot each graph
    with(data, {
        plot(dateTime, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
        
        plot(dateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        
        plot(dateTime, subM1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
        lines(dateTime, subM2, type = "l", col = "red")
        lines(dateTime, subM3, type = "l", col = "blue")
        legend("topright", lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
        plot(dateTime, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    })
    dev.off()
}