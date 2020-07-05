adata <- read.table(file = "D:/Coursera3ExploratoryDataAnalysis/Coursera-3-Exploratory-Data-Analysis/household_power_consumption.txt", 
                    header = FALSE, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
                    , sep = ";",skip = 66637 ,nrows = 2879 , quote = "", na.strings = "?")
## creating the first graph (histogram)
hist(adata$Global_active_power, col = "red", xlab = "Global active power(kilowatts)"
     , main = "Global active power"  )

## png device
dev.copy(png,file="Plot1.png")
dev.off()