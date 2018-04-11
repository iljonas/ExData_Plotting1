# downloads and unzips the file, reads to R, and subsets the data for the first 2 dates in February
# creates datetime variable based on the Date and Time columns from the data set
# sets up a 2 x 2 table view window with par(); did not see need to adjust any margins
# generates a line plot (type "l") based on global active power (converted to numeric values) with appropriate labels
# generates a line plot (type "l") based on voltage (converted to numeric values) with appropriate labels
# generates a line plot (type "l") based on sub metering column 1 (converted to numeric values) with appropriate labels
# adds lines for columns 2 and 3 with their own colors and provides a legend, removing the legend border (bty)
# generates a line plot (type "l") based on global reactive power (converted to numeric values) with appropriate labels
# outputs to png file

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
setwd("C:\\Users\\Isaac\\Documents\\Coursera Files")
download.file(url, destfile = "electric_consumption.zip")
unzip("electric_consumption.zip")
epc <- read.csv("household_power_consumption.txt", sep = ';')
feb_epc <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")

dt <- strptime(paste(feb_epc$Date, feb_epc$Time), format = '%d/%m/%Y %H:%M:%S')
par(mfrow = c(2, 2))
plot(dt, as.numeric(as.character(feb_epc$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power")
plot(dt, as.numeric(as.character(feb_epc$Voltage)), type = "l", xlab = "datetime", ylab = "Voltage")
plot(dt, as.numeric(as.character(feb_epc$Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering")
lines(dt, as.numeric(as.character(feb_epc$Sub_metering_2)), col = "red")
lines(dt, as.numeric(as.character(feb_epc$Sub_metering_3)), col = "blue")
legend("topright", legend = names(feb_epc)[7:9], col = c("black", "red", "blue"), lty = 1, bty = "n")
plot(dt, as.numeric(as.character(feb_epc$Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.copy(png, file = "plot4.png")
dev.off()