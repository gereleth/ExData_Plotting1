library(lubridate)
data <- read.table("household_power_consumption.txt", sep = ";",
                     na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
data <- data[dmy(data$Date) %in% ymd(c("2007-02-01","2007-02-02")),]
data$Datetime <- dmy_hms(paste(data$Date, data$Time))
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(data, {plot(Datetime, Global_active_power, 
                 type = 'n',
                 ylab = 'Global Active Power',
                 xlab = '')
            lines(Datetime, Global_active_power)
            })
with(data, {plot(Datetime, Voltage, 
                 type = 'n',
                 ylab = 'Voltage',
                 xlab = 'datetime')
            lines(Datetime, Voltage)
            })
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
with(data, {plot(Datetime, Global_reactive_power, 
                 type = 'n',
                 ylab = 'Global_reactive_power',
                 xlab = 'datetime')
            lines(Datetime, Global_reactive_power)
            })
dev.off()