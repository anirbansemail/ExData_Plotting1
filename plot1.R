#Plot#1
data_raw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Convert Date and Time
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

#Generate Plot-1
png("plot1.png", width = 480, height = 480, units = "px")
hist(data_ip$Global_active_power, breaks=15, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
