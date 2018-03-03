# Assumes install.packages("data.table") and library(data.table)
# and that power_data has been created by "extract_data_february.R"
#
feb_power<-read.csv("power_data.txt", header=TRUE, sep=" ")
#
# Date and Time in feb_power are factors.
# Convert Date and Time to characters,
# paste(Date, Time) to form date/time strings
# use strptime to convert to date/time in r
#
feb_power$Date<-as.character(feb_power$Date)
feb_power$Time<-as.character(feb_power$Time)
feb_power$DT<-paste(feb_power$Date, feb_power$Time)
feb_power$DT<-strptime(feb_power$DT, "%Y-%m-%d %H:%M:%S")
#
# Plot 3 - Line graph of 3 sub_metering, with legend
png(filename = "plot3.png",
    	width = 480, height = 480, units = "px")
plot(feb_power$DT, feb_power$Sub_metering_1,
	type="n",
	xlab="",
	ylab="Energy sub metering",  
     )
lines(feb_power$DT, feb_power$Sub_metering_1,
	col="black")
lines(feb_power$DT, feb_power$Sub_metering_2,
	col="red")
lines(feb_power$DT, feb_power$Sub_metering_3,
	col="blue")
legend("topright",
	legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	col=c("black", "red", "blue"),
	lty=1
	)
dev.off()