
#reading the data
hpc<-read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")

#subsetting the data only to 01/02/2007 & 02/02/2007
dates <- c("1/2/2007", "2/2/2007")
hpc_ss<-subset(hpc, Date %in% dates)

#plotting the data

x <- strptime(paste(hpc_ss$Date, hpc_ss$Time), format="%d/%m/%Y %H:%M:%S")

gap <- as.numeric(hpc_ss$Global_active_power)
v <- as.numeric(hpc_ss$Voltage)
grp <- as.numeric(hpc_ss$Global_reactive_power)

sm1 <- as.numeric(as.character(hpc_ss$Sub_metering_1))
sm2 <- as.numeric(as.character(hpc_ss$Sub_metering_2))
sm3 <- as.numeric(as.character(hpc_ss$Sub_metering_3))

#dividing the screen in 4 sectors
par(mfcol = c(2, 2))

## Plots 

#plot 1
plot(x, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot 2
plot(x, sm1, type="l", xlab="", ylab="Energy sub metering")
lines(x, sm2, col="red")
lines(x, sm3, col="blue")

legend("topright", lty=1, bty = "n", cex=0.5, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 3
plot(x, v, type = "l", ylab = "Voltage", xlab = "datetime")

#plot 4
plot(x, grp, type="l", xlab = "datetime", ylab="Global_reactive_power")

#creating the png file
dev.copy(png, "plot3.png", height = 480, width = 480, bg = "transparent")

#closing the device
dev.off()