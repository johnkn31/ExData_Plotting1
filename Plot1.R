##Read data


data<-read.table("C:/Users/johnk/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";")
summary(data)
head(data)


mysubset <- transform(subset(data, Date=="1/2/2007"| Date =="2/2/2007"),Date=format(as.Date(Date, format="%d/%m/%y"),"%Y-%m-%d"), Time=format(strptime(Time, format="%H:%M:%S"),"%H:%M:%S"))
mysubset

#tail(mysubset)

##Transform data into numeric types
mysubset2<-transform(mysubset, Global_active_power=as.numeric(as.character((Global_active_power))))

hist(mysubset2$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")



dev.copy(png,'plot1.png')

dev.off()