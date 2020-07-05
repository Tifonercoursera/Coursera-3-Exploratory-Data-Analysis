adata <- read.table(file = "D:/Coursera3ExploratoryDataAnalysis/Coursera-3-Exploratory-Data-Analysis/household_power_consumption.txt", 
                    header = FALSE, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
                    , sep = ";",skip = 66637 ,nrows = 2879 , quote = "", na.strings = "?")
datatime <- paste(adata$Date,adata$Time)
adata <- cbind(adata,datatime)
# convirtiendo a tiempo la columna datatime
adata$datatime <- strptime(adata$datatime, format = "%d/%m/%Y %H:%M:%S", tz ="UTC")

## creating the second graph (histogram)
with(adata, plot(datatime,Global_active_power, type = "n",xlab = "", ylab  ="Global Active Power"))
lines(adata$datatime,adata$Global_active_power, type = "l",col = "black")
## png device
dev.copy(png,file="Plot2.png")
dev.off()