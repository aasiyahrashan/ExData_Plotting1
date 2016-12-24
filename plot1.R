d <- read.table("household_power_consumption.txt",header=TRUE, sep=";")

#Getting only the relavent dates
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
d <- d[(d$Date >= "2007-02-01" & d$Date <= "2007-02-02"),]

#Drawing graph
png("plot1.png",height=480,width=480)
d$Global_active_power <- as.numeric(as.character(d$Global_active_power))
with(d,hist(Global_active_power,col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power"))
dev.off()
