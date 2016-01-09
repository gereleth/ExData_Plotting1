library(lubridate)
# Load file
if (!file.exists("household_power_consumption.txt")) {
  if (!file.exists("exdata_data_household_power_consumption.zip")) {
    path = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(path, "exdata_data_household_power_consumption.zip", mode="wb")
  }
  unzip("exdata_data_household_power_consumption.zip")
}

# Read data
data <- read.table("household_power_consumption.txt", sep = ";",
                     na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
data$Date = dmy(data$Date)
data <- data[data$Date %in% ymd(c("2007-02-01","2007-02-02")),]

# Plot
png("plot1.png", width = 480, height = 480)
with(data, hist(Global_active_power, 
                col='red', 
                xlab = 'Global Active Power (kilowatts)',
                main = 'Global Active Power'))
dev.off ()