
#reading the data
hpc<-read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")

#subsetting the data only to 01/02/2007 & 02/02/2007
dates <- c("1/2/2007", "2/2/2007")
hpc_ss<-subset(hpc, Date %in% dates)

#plotting the data

x <- strptime(paste(hpc_ss$Date, hpc_ss$Time), format="%d/%m/%Y %H:%M:%S")
y <- as.numeric(hpc_ss$Global_active_power)

plot(x,y, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#creating the png file
dev.copy(png, "plot2.png", height = 480, width = 480, bg = "transparent")

#closing the device
dev.off()