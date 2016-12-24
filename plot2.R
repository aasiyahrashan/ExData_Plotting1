d <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
#Getting only the relavent dates
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
d <- d[(d$Date >= "2007-02-01" & d$Date <= "2007-02-02"),]
#Combining date and time fields
d$d_t <- with(d, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
#Making the varaible the correct format
d$Global_active_power <- as.numeric(as.character(d$Global_active_power))

#Drawing the graph
png("plot2.png",height=480,width=480)
with(d, plot(d_t, Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()