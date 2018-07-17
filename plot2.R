plot2 <- function(){
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
    png('plot2.png', width = 480, height = 480)
    
    ## Plotting function
    data$Global_active_power <- as.numeric(data$Global_active_power)
    with(data, plot(DateAndTime, Global_active_power, type = 'n', xlab = '', ylab = 'Global Active Power (kilowatts)'))
    with(data, lines(DateAndTime, Global_active_power))
    
    ## Close the png device
    dev.off()
}