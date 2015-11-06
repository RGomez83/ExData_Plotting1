dataFile <- "./household_power_consumption.txt"

data <- read.table(dataFile,sep=";",header = TRUE,na.strings = "?")

data_subset <- data[data$Date == "1/2/2007"  | data$Date == "2/2/2007", ]

datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png(filename = "plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(datetime,data_subset$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")

plot(datetime,data_subset$Voltage ,type = "l",ylab = "Voltage")

plot(datetime,data_subset$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(datetime,data_subset$Sub_metering_2,col="red")
lines(datetime,data_subset$Sub_metering_3,col="blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty = "n")

plot(datetime,data_subset$Global_reactive_power ,type = "l",ylab = "Global_reactive_power")

dev.off()