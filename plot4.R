plot4 <- function(){
    ## Read the data
    full_set <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, colClasses = 'character')
    
    ## Subset the full_set into the required data
    data <- subset(full_set, Date == '1/2/2007' | Date == '2/2/2007')
    
    ## Merge Date and Time columns into one column named DateAndTime of class POSIXlt
    data$DateAndTime <- paste(data$Date, data$Time)
    data$DateAndTime <- strptime(data$DateAndTime, '%d/%m/%Y %H:%M:%S')
    data$Date <- NULL
    data$Time <- NULL
    data <- data[, c(8,1,2,3,4,5,6,7)]
    
    ## Open a png device
    png('plot4.png', width = 480, height = 480)
    
    ## Plotting function
    data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
    data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
    data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
    data$Voltage <- as.numeric(data$Voltage)
    data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
    
    par(mfcol = c(2,2))
    
    with(data, plot(DateAndTime, Global_active_power, type = 'n', xlab = '', ylab = 'Global Active Power (kilowatts)'))
    with(data, lines(DateAndTime, Global_active_power))
    
    with(data, plot(DateAndTime, Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy sub metering'))
    with(data, lines(DateAndTime, Sub_metering_1, col = 'black'))
    with(data, lines(DateAndTime, Sub_metering_2, col = 'red'))
    with(data, lines(DateAndTime, Sub_metering_3, col = 'blue'))
    legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = 1, bty = 'n')
    
    with(data, plot(DateAndTime, Voltage, type = 'n', xlab = 'datetime', ylab = 'Voltage'))
    with(data, lines(DateAndTime, Voltage, col = 'black'))
    
    with(data, plot(DateAndTime, Global_reactive_power, type = 'n', xlab = 'datetime', ylab = 'Global_reactive_power'))
    with(data, lines(DateAndTime, Global_reactive_power, col = 'black'))
    
    ## Close the png device
    dev.off()
}