plot1 <- function() {
    colName <- c("Date", "Time", "GAP", "GRP", "Voltage", "GI", "subM1", "subM2", "subM3")
    # Load the data
    data <- read.table("household_power_consumption.txt", sep = ";", na.string = "?", nrow = 2880, skip = 66637, col.names = colName)
    # Convert date and time
    data[,1] <- as.Date(data[,1], "%d/%m/%Y")
    lapply(data$Time, strptime, "%H:%M:%S")
    # Create png
    png(file = "plot1.png", width = 480, height = 480, units = "px")
    # Plot each graph
    hist(data$GAP, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
    dev.off()
}