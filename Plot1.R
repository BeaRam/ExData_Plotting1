# Plot1.png
## Global Acitve Power by Frequency

h_power <- read.table(file = "household_power_consumption.txt", header=TRUE, 
                      sep=";", stringsAsFactors=FALSE, dec=".")
dim(h_power)
# [1] 2075259       1
head(h_power)
names(h_power)
# Date
# Time
# Global_active_power
# Global_reactive_power
# Voltage
# Global_intensity
# Sub_metering_1
# Sub_metering_2
# Sub_metering_3

subh_power <- h_power[h_power$Date %in% c("1/2/2007","2/2/2007"), ] ## subset data by dates


## Date column details
head(subh_power$Date)
class(subh_power$Date)
class(subh_power$Time)
summary(subh_power$Date)

## Open Graphics Device & Set Dimensions
png(filename = "Plot1.png", width = 480, height = 480)


## Create Plot
hist(as.numeric(subh_power$Global_active_power), col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off() ## Close Graphics Device