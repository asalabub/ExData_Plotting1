
household <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                        nrows = 2075259)
head(household)
strptime(household$Date, "%d/%m/%y")
as.Date(household$Date, "%d/%m/%y")


household2$FullDate <- strptime(paste(household2$Date, household2$Time), 
                                "%d/%m/%Y %H:%M:%S") 
class(household2$FullDate)

as.Date(household2$FullDate, "%d/%m/%Y %H:%M:%S")


household2 <- subset(household, Date == "1/2/2007" | Date == "2/2/2007")



household2$Global_active_power <- as.numeric(household2$Global_active_power)

plot(household2$FullDate, household2$Global_active_power, type = "l", 
     xlab= "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")

dev.off()
