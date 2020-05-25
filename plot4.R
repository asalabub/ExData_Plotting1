

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


par(mfrow = c(2,2))

## first plot

plot(household2$FullDate, household2$Global_active_power, type = "l", 
     xlab= "", ylab = "Global Active Power")

## second plot

plot(household2$FullDate, household2$Voltage, type = "l", 
     xlab= "datetime", ylab = "Voltage")


## third plot

with(household2, plot(household2$FullDate, household2$Sub_metering_1, 
                      type = "n", xlab = "", ylab= "Energy sub metering"))

with(household2, points(FullDate, Sub_metering_1, type = "l"))
with(household2, points(FullDate, Sub_metering_2, type = "l", col = "red"))
with(household2, points(FullDate, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.5)

## fourth plot

with(household2, plot(FullDate, Global_reactive_power, type = "l", 
     xlab= "datetime"))




dev.copy(png, file = "plot4.png")

dev.off()
