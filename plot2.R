library(lubridate)
data <- read.table("household_power_consumption.txt", sep = ";",
                     na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
data <- data[dmy(data$Date) %in% ymd(c("2007-02-01","2007-02-02")),]
data$Datetime <- dmy_hms(paste(data$Date, data$Time))
png("plot2.png", width = 480, height = 480)
with(data, {plot(Datetime, Global_active_power, 
                type = 'n',
                ylab = 'Global Active Power (kilowatts)',
                xlab = '')
            lines(Datetime, Global_active_power)
            })
dev.off()