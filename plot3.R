setwd("D://Online course/Coursera/4. Exploratory data analysis/Project 1/")

require(data.table)

Data = fread("household_power_consumption.txt", header=T, sep=";", colClasses = "factor") 
Data[, Date := as.Date(Date, "%d/%m/%Y")] 
Data = Data[(Date=="2007-02-01") | (Date=="2007-02-02"), ] 
Date = strptime(paste(Data$Date, Data$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(Date, as.numeric(Data$Sub_metering_1), xlab="", ylab = "Energy sub metering", type="l")
lines(Date, as.numeric(Data$Sub_metering_2), col="red")
lines(Date, as.numeric(Data$Sub_metering_3), col="blue")
legend("topright", lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col  = c("black", "red", "blue"))
dev.off()
