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
my_data$Global_active_power <- as.numeric(as.character(my_data$Global_active_power))
#Making the plot
plot(my_table$Date, my_table$Global_active_power, type="l", 
     ylab="Global Active Power(kilowatts)", xlab="")

#Copying to .png file
dev.copy(png, "./plot_2.png")
dev.off()