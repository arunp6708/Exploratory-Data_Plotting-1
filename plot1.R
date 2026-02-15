#Plot 1

data1 <- read.table("./household_power_consumption.txt", header = T,sep = ";", na.strings = "?")

data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
data1 <- subset(data1, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data1$datetime <- strptime(paste(data1$Date, data1$Time), "%Y-%m-%d %H:%M:%S")

hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()








