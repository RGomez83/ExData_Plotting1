
dataFile <- "./household_power_consumption.txt"

data <- read.table(dataFile,sep=";",header = TRUE,na.strings = "?")

data_subset <- data[data$Date == "1/2/2007"  | data$Date == "2/2/2007", ]

datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png(filename = "plot2.png", width=480, height=480)

plot(datetime,data_subset$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

dev.off()