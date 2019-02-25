plot4 <- function() {
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
  data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
  data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
  datetime <- paste(as.Date(data1$Date), data1$Time)
  data1$datetime <- as.POSIXct(datetime)
  par(mfrow = c(2, 2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(data1, {
         plot(Global_active_power~datetime, type="l", 
                         ylab="Global Active Power (kilowatts)")
         plot(Voltage~datetime, type="l", 
                         ylab="Voltage (volt)")
         plot(Sub_metering_1~datetime, type="l", 
                         ylab="Global Active Power (kilowatts)")
         lines(Sub_metering_2~datetime,col='Red')
         lines(Sub_metering_3~datetime,col='Blue')
         legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
                             legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
         plot(Global_reactive_power~datetime, type="l", 
                         ylab="Global Rective Power (kilowatts)")
     })
  dev.copy(png, file = "plot4.png", height=480, width=480)
  dev.off()
}