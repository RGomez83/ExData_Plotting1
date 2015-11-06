
dataFile <- "./household_power_consumption.txt"

data <- read.table(dataFile,sep=";",header = TRUE,na.strings = "?")

data_subset <- data[data$Date == "1/2/2007"  | data$Date == "2/2/2007", ]

png(filename = "plot1.png", width=480, height=480)

hist(data_subset$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()

