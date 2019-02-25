plot1 <- function() {
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
  data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
  data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
  hist(data1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.copy(png, file = "plot1.png", height=480, width=480)
  dev.off()
}