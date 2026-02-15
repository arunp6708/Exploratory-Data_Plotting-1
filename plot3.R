data3 <- read.table("./household_power_consumption.txt", header = T,sep = ";", na.strings = "?",   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data3$Date <- as.Date(data3$Date, format="%d/%m/%Y")

data3 <- subset(data3, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
time <- paste(as.Date(data3$Date), data3$Time)
data3$Datetime <- as.POSIXct(time)

with(data3, {plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="", xaxt = "n")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')})
day_breaks <- seq(from = as.POSIXct(trunc(min(data3$Datetime), "days")),
                  to   = as.POSIXct(trunc(max(data3$Datetime), "days") + 86400),
                  by = "day")
axis(1, at = day_breaks, labels = format(day_breaks, "%a"))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()