# downloads and unzips the file, reads to R, and subsets the data for the first 2 dates in February
# creates datetime variable based on the Date and Time columns from the data set
# generates a line plot (type "l") based on global active power (converted to numeric values) with appropriate labels
# outputs to png file

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
setwd("C:\\Users\\Isaac\\Documents\\Coursera Files")
download.file(url, destfile = "electric_consumption.zip")
unzip("electric_consumption.zip")
epc <- read.csv("household_power_consumption.txt", sep = ';')
feb_epc <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")

dt <- strptime(paste(feb_epc$Date, feb_epc$Time), format = '%d/%m/%Y %H:%M:%S')
plot(dt, as.numeric(as.character(feb_epc$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power (kilowats)")
dev.copy(png, file = "plot2.png")
def.off()