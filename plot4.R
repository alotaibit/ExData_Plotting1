q1<-read.table("hpc.txt",header=TRUE,sep=";",na.strings = "?")
q1$Date <- as.Date(q1$Date,"%Y-%m-%d")
qw <- as.Date("2007-02-01","%Y-%m-%d")
qs <- as.Date("2007-02-02","%Y-%m-%d")
q4<-subset(q1, Date >= qw & Date <= qs)
q5<- paste(q4$Date, q4$Time)
q5 <- strptime(q5, "%Y-%m-%d %H:%M:%S")
q4$Time <- q5
op <- par(no.readonly = TRUE)
par(pin=c(480,480))


png(file="plot4.png", bg="white")
par(mfrow = c(2, 2))
with(q4, { plot(Time, Global_active_power ,type="l",xlab="",ylab = "Global Active Power")})
           
           

with(q4, { plot(Time, Voltage ,type="l",xlab="datetime",ylab = "Voltage")})


with(q4, { plot(Time,  Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering")
           lines(Time, Sub_metering_2, col = "red")
           lines(Time, Sub_metering_3, col = "blue")
           legend("topright", pch = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))})



with(q4, { plot(Time, Global_reactive_power ,type="l",xlab="datetime",ylab = "Global_reactive_power")})


dev.off()
par(op)