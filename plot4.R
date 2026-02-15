data4 <- read.table("./household_power_consumption.txt", header = T,sep = ";", na.strings = "?",   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data4$Date <- as.Date(data4$Date, format="%d/%m/%Y")

data4 <- subset(data4, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
time <- paste(as.Date(data4$Date), data4$Time)
data4$Datetime <- as.POSIXct(time)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
day_breaks <- seq(from = as.POSIXct(trunc(min(data4$Datetime), "days")),
                  to   = as.POSIXct(trunc(max(data4$Datetime), "days") + 86400),
                  by = "day")
with(data4, {
  plot(Global_active_power~Datetime, type="l", xlab="",
       ylab="Global Active Power", 
       xaxt="n")
  axis(1, at=day_breaks,
       labels=format(day_breaks,"%a"))
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime", xaxt="n")
  axis(1, at=day_breaks,
       labels=format(day_breaks,"%a"))
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="", xaxt="n")
  axis(1, at=day_breaks,
       labels=format(day_breaks,"%a"))
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  axis(1, at=day_breaks,
       labels=format(day_breaks,"%a"))
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime", xaxt="n")
})
axis(1, at=day_breaks,
     labels=format(day_breaks,"%a"))
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()