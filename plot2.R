plot2 <- function() {
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
  data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
  data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
  datetime <- paste(as.Date(data1$Date), data1$Time)
  data1$datetime <- as.POSIXct(datetime)
  with(data1, plot(Global_active_power~datetime, ylab = "Global Active Power (kilowatts)", type = "l"))
  dev.copy(png, file = "plot2.png", height=480, width=480)
  dev.off()
}