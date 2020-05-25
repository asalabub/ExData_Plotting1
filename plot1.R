
household <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                        nrows = 2075259)
head(household)
strptime(household$Date, "%d/%m/%y")
as.Date(household$Date, "%d/%m/%y")


household2 <- subset(household, Date == "1/2/2007" | Date == "2/2/2007")


household2$Global_active_power <- as.numeric(household2$Global_active_power)

hist(household2$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")

dev.off()
