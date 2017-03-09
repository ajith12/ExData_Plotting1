#Loading dataset
household<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#Subsetting dataset
household$Date<-as.Date(household$Date,"%d/%m/%Y")
t1<-as.Date("2007-02-01")
t2<-as.Date("2007-02-02")
new_household<-household[household$Date %in% t1:t2, ]

#Plot number 1
hist(as.numeric(new_household$Global_active_power), col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()