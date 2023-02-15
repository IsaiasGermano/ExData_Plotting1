hhpc <- read.table('household_power_consumption.txt', header = TRUE, sep = ';',
                   stringsAsFactors = FALSE)

hhpc$DateTime <- strptime(paste(hhpc$Date, hhpc$Time), format="%d/%m/%Y %H:%M:%S")

if(!require(lubridate)){
    install.packages("lubridate")
    library(lubridate)
}

hhpc$Date <- dmy(hhpc$Date)

df <- hhpc[hhpc$Date >= "2007-02-01" & hhpc$Date <= "2007-02-02",]

df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

plot(df$DateTime, df$Sub_metering_1, type = "l", col =1,
     ylab = "Energy sub metering", xlab = '')
     
lines(df$DateTime, df$Sub_metering_2, type = "l", col = 2)
lines(df$DateTime, df$Sub_metering_3, type = "l", col = 3)
legend("topright", lty = c(1,1,1), cex = 0.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

dev.copy(png, file = "plot3.png")

dev.off()
