d <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
#Getting only the relavent for it
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
d <- d[(d$Date >= "2007-02-01" & d$Date <= "2007-02-02"),]
#Combining date and time fields
d$d_t <- with(d, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
#Making the variables the correct format
d$Sub_metering_1 <- as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2 <- as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3 <- as.numeric(as.character(d$Sub_metering_3))


#Drawing graph
png("plot3.png",height=480,width=480)
with(d,plot(d_t,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering"))
with(d,lines(d_t,Sub_metering_2,col="red"))
with(d,lines(d_t,Sub_metering_3,col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd =1,
       col = c('black', 'red', 'blue'))
dev.off()


