library(lubridate)
data <- read.table("household_power_consumption.txt", sep = ";",
                     na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
data <- data[dmy(data$Date) %in% ymd(c("2007-02-01","2007-02-02")),]
data$Datetime <- dmy_hms(paste(data$Date, data$Time))
png("plot3.png", width = 480, height = 480)
with(data, {plot(Datetime, Sub_metering_1, 
                type = 'n',
                ylab = 'Energy sub metering',
                xlab = '')
            lines(Datetime, Sub_metering_1)
            lines(Datetime, Sub_metering_2, col = 'red')
            lines(Datetime, Sub_metering_3, col = 'blue')
            legend("topright",names(data)[7:9], col = c('black','red','blue'),
                   lty = 1)
            })
dev.off()