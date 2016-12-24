d <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
#Getting only the relavent for it
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
d <- d[(d$Date >= "2007-02-01" & d$Date <= "2007-02-02"),]
#Combining date and time fields
d$d_t <- with(d, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
#Making the variables the correct format
d$Global_active_power <- as.numeric(as.character(d$Global_active_power))
d$Voltage <- as.numeric(as.character(d$Voltage))
d$Global_reactive_power <- as.numeric(as.character(d$Global_reactive_power))

#Drawing graphs

png("plot4.png",height=480,width=480)
par(mfrow=c(2,2), mar=c(4,4,3,1))
#First graph
with(d, plot(d_t, Global_active_power,type="l",ylab="Global Active Power",xlab=""))
#Second graph
with(d, plot(d_t, Voltage,type="l",ylab="Voltage",xlab="datetime"))
#Third graph
with(d,plot(d_t,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering"))
with(d,lines(d_t,Sub_metering_2,col="red"))
with(d,lines(d_t,Sub_metering_3,col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd =1,
       col = c('black', 'red', 'blue'))
#Fourth graph
with(d, plot(d_t, Global_reactive_power,type="l",xlab="datetime"))
dev.off()