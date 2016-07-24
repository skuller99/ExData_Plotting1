Sys.setlocale("LC_TIME", "English")
power <- read.csv("household_power_consumption.txt", sep = ";",nrows = 1)
pw <- read.csv("household_power_consumption.txt",sep = ";",header = TRUE, 
               skip = 66636, nrows = 2880)

colnames(pw) <- colnames(power)
rm(power)

pw$comb <- as.POSIXct(paste(pw$Date, pw$Time), format="%d/%m/%Y %H:%M")

png(file = "plot3.png")
plot(pw$comb,pw$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(pw$comb,pw$Sub_metering_1) 
lines(pw$comb,pw$Sub_metering_2,col = "red") 
lines(pw$comb,pw$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) #3
dev.off()