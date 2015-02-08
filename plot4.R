#Plot#4
data_raw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#Convert Date and Time
data_proc <- data_raw
data_proc[, 1] <- as.Date(data_proc[, 1], "%d/%m/%Y")
data_proc[ ,2] <- as.character(data_proc[ ,2])
library(lubridate)
data_proc[ ,2] <- hms(data_proc[ ,2])

#Subset relevant data
data_ip <- data_proc[(data_proc$Date == "2007-02-01" | data_proc$Date == "2007-02-02"), ]

#Convert to numeric class
for (i1 in 3:9) {
  data_ip[ ,i1] <- as.character(data_ip[ ,i1])
  data_ip[ ,i1] <- as.numeric(data_ip[ ,i1])
}

#Add Index and Column names vector
Index <- c(1:nrow(data_ip))
data_plot <- cbind(data_ip, Index)
data_nm <- names(data_plot)

#Generate Plot#4
png("plot4.png", width = 480, height = 480, units = "px")
par(mfcol= c(2,2))

#Plot on R1C1
plot(data_plot$Index, data_plot$Global_active_power, type = "l", axes = FALSE, ann = FALSE) 
axis(1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at = seq(0, 6, 2), labels = seq(0, 6,2))
mtext("Global Active Power", side = 2, line = 3, cex = 0.75)
box()

#Plot on R2C1
plot(data_plot$Index, data_plot[ ,7], type = "l", col="black", ylim=c(1,40), axes = FALSE, ann = FALSE)
lines(data_plot$Index, data_plot[ ,8], col="red")
par(new=FALSE)
lines(data_plot$Index, data_plot[ ,9], col="blue")
par(new=FALSE)
axis(1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at = seq(0, 30, 10), labels = seq(0, 30, 10))
mtext("Energy sub metering", side = 2, line = 3, cex =0.73)
box()
legend("topright", legend = c(data_nm[7], data_nm[8],data_nm[9]), col=c("black", "red", "blue"), lty=c(1,1,1), bty="n", cex = 0.95)

#Plot on R1C2
plot(data_plot$Index, data_plot$Voltage, type = "l", axes = FALSE, ann = FALSE) 
axis(1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
#axis(2, at = seq(234, 246, 2), labels = seq(234, 246, 4))
axis(2, at = seq(234, 246, 2), labels = c(234, "", 238, "", 242, "", 246))
mtext("Voltage", side = 2, line = 3, cex = 0.75)
mtext("datetime", side = 1, line = 3, cex = 0.75)
box()

#Plot on R2C2
plot(data_plot$Index, data_plot$Global_reactive_power, type = "l", axes = FALSE, ann = FALSE)
axis(1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at = seq(0, 0.5, 0.1), labels = seq(0, 0.5, 0.1))
mtext(data_nm[4], side = 2, line = 3, cex = 0.75)
mtext("datetime", side = 1, line = 3, cex = 0.75)
box()

dev.off()