plot1 <- function(){
    ## Read the data
    full_set <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)
    
    ## Convert the Date column into POSIXlt
    full_set$Date <- strptime(full_set$Date, '%d/%m/%Y')
    
    ## Subset the full_set into the required data
    data <- subset(full_set, Date == '2007-02-01' | Date == '2007-02-02')
    
    ## Open a png device
    png('plot1.png', width = 480, height = 480)
    
    ## Plotting function
    data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
    with(data, hist(Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red'))
    
    ## Close the png device
    dev.off()
}