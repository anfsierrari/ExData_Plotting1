library(dplyr)
#Read the data
my_data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
my_data <- mutate(my_data, Date = as.Date(as.character(my_data$Date),
                                          format="%d/%m/%Y"))
#Subset only the dates 2007-02-01 and 2007-02-02
my_data <- my_data[my_data$Date == "2007-02-01" | my_data$Date == "2007-02-02", ]
# Joinig the date and time columns to obtain a time sequence
my_data$Date <- paste(my_data$Date, my_data$Time)
my_data$Date <- as.POSIXlt(my_data$Date)
#Making the plot with the three  lines
plot(my_data$Date, as.numeric(as.character(my_data$Sub_metering_1)), xlab="",
     ylab="Energy sub mettering", type="l")
lines(my_data$Date, as.numeric(as.character(my_data$Sub_metering_2)), col="red")
lines(my_data$Date, as.numeric(as.character(my_data$Sub_metering_3)), col="blue")
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_mettering_1", "Sub_mettering_2", "Sub_mettering_3"), lty=c(1,1,1))
#Copying the plot to a .png file
dev.copy(png, "./plot_3.png")
dev.off()
