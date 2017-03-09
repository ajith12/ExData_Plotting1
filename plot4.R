#Loading dataset
household<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#Subsetting dataset
household$new_Date<-as.Date(household$Date,"%d/%m/%Y")
t1<-as.Date("2007-02-01")
t2<-as.Date("2007-02-02")
new_household<-household[household$new_Date %in% t1:t2, ]
x<-paste(new_household$Date, new_household$Time)
new_household$Date_Time<-strptime(x,"%d/%m/%Y %H:%M:%S")

#Plot number 4
par(mfrow = c(2,2))
plot(new_household$Date_Time,as.numeric(new_household$Global_active_power), type = "l", ylab = "Global Active Power", xlab = "")
plot(new_household$Date_Time,as.numeric(new_household$Voltage), type = "l", ylab="Voltage", xlab = "datetime")
plot(new_household$Date_Time,as.numeric(new_household$Sub_metering_1), type = "n", ylab = "Energy sub metering", xlab = "")
points(new_household$Date_Time,as.numeric(new_household$Sub_metering_1),type = "l", col="black")
points(new_household$Date_Time,as.numeric(new_household$Sub_metering_2),type = "l",col="red")
points(new_household$Date_Time,as.numeric(new_household$Sub_metering_3),type = "l", col="blue")
legend("topright",lty = c(1,1,1),col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", cex = 0.5)
plot(new_household$Date_Time,as.numeric(new_household$Global_reactive_power), type = "l", ylab="Global_reactive_power", xlab = "datetime")
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()