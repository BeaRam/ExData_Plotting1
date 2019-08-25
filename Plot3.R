# Plot3.png
## Submetering Type bv Weekday


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


## Extract Date/Time Columns, use strptime to set format
wkday_h_power <- strptime(paste(subh_power$Date, subh_power$Time, sep=" "), 
                          "%d/%m/%Y %H:%M:%S") 
head(wkday_h_power)

class(subh_power$Sub_metering_1) # character
## Convert Sub_metering Columns to numeric
s_meter1 <- as.numeric(subh_power$Sub_metering_1)
s_meter2 <- as.numeric(subh_power$Sub_metering_2)
s_meter3 <- as.numeric(subh_power$Sub_metering_3)
class(c(s_meter1, s_meter2, s_meter3)) ## numeric


## Open Graphics Device & Set Dimensions
png(filename = "Plot3.png", width = 480, height = 480) 


## Create Plot
plot(wkday_h_power, s_meter1, type = "l",
     xlab = " ", ylab = "Energy sub metering")
lines(wkday_h_power, s_meter2, type = "l", col = "red")
lines(wkday_h_power, s_meter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))
dev.off() ## Close Graphics Device