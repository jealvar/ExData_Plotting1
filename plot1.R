
#reading the data
hpc<-read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")

#subsetting the data only to 01/02/2007 & 02/02/2007
dates <- c("1/2/2007", "2/2/2007")
hpc_ss<-subset(hpc, Date %in% dates)

#plotting the data
hist(as.numeric(hpc_ss$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

#creating the png file
dev.copy(png, "plot1.png", height = 480, width = 480, bg = "transparent")

#closing the device
dev.off()