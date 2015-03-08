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



png(file="plot1.png", bg="white")
hist(q4$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

par(op)