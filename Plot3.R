adata <- read.table(file = "D:/Coursera3ExploratoryDataAnalysis/Coursera-3-Exploratory-Data-Analysis/household_power_consumption.txt", 
                    header = FALSE, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
                    , sep = ";",skip = 66637 ,nrows = 2879 , quote = "", na.strings = "?")
datatime <- paste(adata$Date,adata$Time)
adata <- cbind(adata,datatime)
# convirtiendo a tiempo la columna datatime
adata$datatime <- strptime(adata$datatime, format = "%d/%m/%Y %H:%M:%S", tz ="UTC")

## making the third plot 
plot(adata$datatime,adata$Sub_metering_1, type = "n"
     , ylab = "Energy sub metering", xlab = "")
lines(adata$datatime,adata$Sub_metering_1, type = "l", col = "black")
lines(adata$datatime,adata$Sub_metering_2, type = "l", col = "red")
lines(adata$datatime,adata$Sub_metering_3, type = "l", col = "blue")
legend("topright",legend = c("Sub metering 1","Sub metering 2","Sub metering 3")
       , lty = c("solid","solid","solid"), col = c("black","red","blue"))
## png device
png(filename = "Plot3.png")
plot(adata$datatime,adata$Sub_metering_1, type = "n"
     , ylab = "Energy sub metering", xlab = "")
lines(adata$datatime,adata$Sub_metering_1, type = "l", col = "black")
lines(adata$datatime,adata$Sub_metering_2, type = "l", col = "red")
lines(adata$datatime,adata$Sub_metering_3, type = "l", col = "blue")
legend("topright",legend = c("Sub metering 1","Sub metering 2","Sub metering 3")
       , lty = c("solid","solid","solid"), col = c("black","red","blue"))
dev.off()