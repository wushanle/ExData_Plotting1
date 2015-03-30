setwd("D://Online course/Coursera/4. Exploratory data analysis/Project 1/")

require(data.table)

Data = fread("household_power_consumption.txt", header=T, sep=";", colClasses = "factor") 
Data[, Date := as.Date(Date, "%d/%m/%Y")] 
Data = Data[(Date=="2007-02-01") | (Date=="2007-02-02"), ] 
Date = strptime(paste(Data$Date, Data$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(Date, as.numeric(Data$Global_active_power), xlab="", ylab = "Global Active Power (kilowatts)", type="l")
dev.off()
