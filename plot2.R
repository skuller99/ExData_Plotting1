Sys.setlocale("LC_TIME", "English")
power <- read.csv("household_power_consumption.txt", sep = ";",nrows = 1)
pw <- read.csv("household_power_consumption.txt",sep = ";",header = TRUE, 
               skip = 66636, nrows = 2880)

colnames(pw) <- colnames(power)
rm(power)

pw$comb <- as.POSIXct(paste(pw$Date, pw$Time), format="%d/%m/%Y %H:%M")

png(file = "plot2.PNG")
plot(pw$comb,pw$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(pw$comb,pw$Global_active_power)
dev.off()