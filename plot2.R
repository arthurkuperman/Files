

#PLOT 2

## data set
data_set <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                     na.strings = "?", nrows = 2075259, check.names = F, 
                     stringsAsFactors = F, comment.char = "", quote = '\"')
data_set$Date <- as.Date(data_set$Date, format = "%d/%m/%Y")

## Subset
data <- subset(data_set, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_set)

## Dates conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")