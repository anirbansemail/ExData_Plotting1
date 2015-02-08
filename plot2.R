#Plot#2
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

# Add Index
Index <- c(1:nrow(data_ip))
data_plot <- cbind(data_ip, Index)

#Generate Plot#2
png("plot2.png", width = 480, height = 480, units = "px")
plot(data_plot$Index, data_plot$Global_active_power, type = "l", axes = FALSE, ann = FALSE) 
axis(1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at = seq(0, 6, 2), labels = seq(0, 6,2))
mtext("Global Active Power (kilowatts)", side = 2, line = 3)
box()
dev.off()