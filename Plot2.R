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
# Plot 2 - Line graph of Global Active Power against time
png(filename = "plot2.png",
    	width = 480, height = 480, units = "px")
plot(feb_power$DT, feb_power$Global_active_power,
	type="n",
	xlab="",
	ylab=""
     )
lines(feb_power$DT, feb_power$Global_active_power,
	)
dev.off()