Sys.setlocale("LC_TIME", "English")
power <- read.csv("household_power_consumption.txt", sep = ";",nrows = 1)
pw <- read.csv("household_power_consumption.txt",sep = ";",header = TRUE, 
               skip = 66636, nrows = 2880)

colnames(pw) <- colnames(power)
rm(power)

pw$comb <- as.POSIXct(paste(pw$Date, pw$Time), format="%d/%m/%Y %H:%M")

png(file = "plot4.png")
par(mfrow = c(2,2), mar = c(4.5,4.5,1,1)) #4

plot(pw$comb,pw$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(pw$comb,pw$Global_active_power) 

plot(pw$comb,pw$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(pw$comb,pw$Voltage) 

plot(pw$comb,pw$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(pw$comb,pw$Sub_metering_1) 
lines(pw$comb,pw$Sub_metering_2,col = "red") 
lines(pw$comb,pw$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(pw$comb,pw$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(pw$comb,pw$Global_reactive_power)  #4

dev.off()