# downloads and unzips the file, reads to R, and subsets the data for the first 2 dates in February
# generates a histogram based on global active power (converted to numeric values) with appropriate labels
# outputs to png file

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
setwd("C:\\Users\\Isaac\\Documents\\Coursera Files")
download.file(url, destfile = "electric_consumption.zip")
unzip("electric_consumption.zip")
epc <- read.csv("household_power_consumption.txt", sep = ';')
feb_epc <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")

hist(as.numeric(as.character(feb_epc$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
def.off()