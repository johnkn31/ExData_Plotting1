##Read data

data<-read.table("C:/Users/johnk/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";")
##summary(data)
##head(data)


mysubset <- transform(subset(data, Date=="1/2/2007"| Date =="2/2/2007"),Date=format(as.Date(Date, format="%d/%m/%y"),"%Y-%m-%d"), Time=format(strptime(Time, format="%H:%M:%S"),"%H:%M:%S"))


mysubset2<-transform(mysubset, Global_active_power=as.numeric(as.character((Global_active_power))))
mysubset2$day<-wday(mysubset2$Date, label=TRUE)

mysubset2$newtime <- as.POSIXct(paste(mysubset2$Date, mysubset2$Time), format="%Y-%m-%d %H:%M:%S")
head(mysubset2)

plot(mysubset2$newtime, mysubset2$Global_active_power, type='l',xlab="",ylab="Global Active Power(kilowatts)")
axis(side=1,at=c(0,1441,2881),labels=c('Thu','Fri','Sat'))

dev.copy(png,'Plot2.png')

dev.off()

