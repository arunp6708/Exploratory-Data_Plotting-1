data2 <- read.table("./household_power_consumption.txt", header = T,sep = ";", na.strings = "?",   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")

data2 <- subset(data2, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

time <- paste(as.Date(data2$Date), data2$Time)
data2$Datetime <- as.POSIXct(time)

plot(data2$Global_active_power~data2$Datetime, type="l",  xlab="", ylab="Global Active Power (kilowatts)", xaxt = "n")
day_breaks <- seq(as.POSIXct("2007-02-01"),
                  as.POSIXct("2007-02-03"),
                  by = "day")
axis(1, at = day_breaks, labels = format(day_breaks, "%a"))
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
