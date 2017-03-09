#Loading dataset
household<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#Subsetting dataset
household$new_Date<-as.Date(household$Date,"%d/%m/%Y")
t1<-as.Date("2007-02-01")
t2<-as.Date("2007-02-02")
new_household<-household[household$new_Date %in% t1:t2, ]
x<-paste(new_household$Date, new_household$Time)
new_household$Date_Time<-strptime(x,"%d/%m/%Y %H:%M:%S")

#Plot number 2
plot(new_household$Date_Time,as.numeric(new_household$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()