setwd("D://Online course/Coursera/4. Exploratory data analysis/Project 1/ExData_Plotting1/")

require(data.table)

Data = fread("household_power_consumption.txt", header=T, sep=";", colClasses = "factor") 
Data[, Date := as.Date(Date, "%d/%m/%Y")] 
Data = Data[(Date=="2007-02-01") | (Date=="2007-02-02"), ] 

png("plot1.png", width = 480, height = 480)
hist(as.numeric(Data$Global_active_power), main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
