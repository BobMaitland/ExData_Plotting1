# Assumes install.packages("data.table") and library(data.table)
power_data<-fread("household_power_consumption.txt", sep=";")
power_data$Date<-as.Date(power_data$Date, "%d/%m/%Y")
final_power_data<-power_data[ which (Date=="2007-02-01" | Date=="2007-02-02")]
write.table(final_power_data, "power_data.txt")
