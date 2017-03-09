#Loading dataset
household<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#Subsetting dataset
household$new_Date<-as.Date(household$Date,"%d/%m/%Y")
t1<-as.Date("2007-02-01")
t2<-as.Date("2007-02-02")
new_household<-household[household$new_Date %in% t1:t2, ]
x<-paste(new_household$Date, new_household$Time)
new_household$Date_Time<-strptime(x,"%d/%m/%Y %H:%M:%S")

#Plot number 3
plot(new_household$Date_Time,as.numeric(new_household$Sub_metering_1), type = "n", ylab = "Energy sub metering", xlab = "")
points(new_household$Date_Time,as.numeric(new_household$Sub_metering_1),type = "l", col="black")
points(new_household$Date_Time,as.numeric(new_household$Sub_metering_2),type = "l",col="red")
points(new_household$Date_Time,as.numeric(new_household$Sub_metering_3),type = "l", col="blue")
legend("topright",lty = c(1,1,1), lwd = c(2,2,2), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()