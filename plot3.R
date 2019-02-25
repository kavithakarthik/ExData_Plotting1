plot3 <- function() {
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
  data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
  data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
  datetime <- paste(as.Date(data1$Date), data1$Time)
  data1$datetime <- as.POSIXct(datetime)
  with(data1, plot(Sub_metering_1~datetime, ylab = "Global Active Power (kilowatts)", type = "l"))
  lines(data1$Sub_metering_2~data1$datetime, col = "red")
  lines(data1$Sub_metering_3~data1$datetime, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
  dev.copy(png, file = "plot3.png", height=480, width=480)
  dev.off()
}