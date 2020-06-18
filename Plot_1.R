
library(dplyr)
#Read the data
my_data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
my_data <- mutate(my_data, Date = as.Date(as.character(my_data$Date),
                                          format="%d/%m/%Y"))
#Subset only the dates 2007-02-01 and 2007-02-02
my_data <- my_data[my_data$Date == "2007-02-01" | my_data$Date == "2007-02-02", ]
#Making the histogram
my_data <- my_data$Global_active_power <- as.numeric(asc.character(my_data$Global_active_power))
hist(my_data$Global_active_power, col="red", 
     xlab="Global Active Power(kilowatts)", main = "Global Active Power")
#Copying to a .png file
dev.copy(png, "./plot_1.png")
dev.off()
