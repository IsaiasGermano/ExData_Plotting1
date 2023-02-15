hhpc <- read.table('household_power_consumption.txt', header = TRUE, sep = ';',
                   stringsAsFactors = FALSE)

if(!require(lubridate)){
    install.packages("lubridate")
    library(lubridate)
}

hhpc$Date <- dmy(hhpc$Date)

df <- hhpc[hhpc$Date >= "2007-02-01" & hhpc$Date <= "2007-02-02",]

df$Global_active_power <- as.numeric(df$Global_active_power)

filteredGlobalActivePower <- na.omit(df$Global_active_power)

hist(df$Global_active_power, col = 'red', main = 'Global active power', xlab = 'Global Active Power (killowats)')

dev.copy(png, file = "plot1.png")       

dev.off()