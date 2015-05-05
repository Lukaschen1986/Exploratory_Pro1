# getting and cleaning data
df<-read.table(file="household_power_consumption.txt",header = T,sep=";",na.strings="?")
head(df)
str(df)

df2<-subset(df,Date=="1/2/2007")
df3<-subset(df,Date=="2/2/2007")
df4<-rbind(df2,df3)

df4$datetime<-paste(df4$Date,df4$Time,sep=" ")
df4$datetime<-strptime(df4$datetime,format = "%d/%m/%Y %H:%M:%S")
df4$Date<-as.Date(df4$Date,format = "%d/%m/%Y")
df4$Week<-format(df4$Date,format="%A")

head(df4)
str(df4)
summary(df4)

# plot3
png(filename = "plot3.png",width = 480, height = 480)
with(df4,plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",col="black"))
with(df4,points(datetime,Sub_metering_2,type="l",col="red"))
with(df4,points(datetime,Sub_metering_3,type="l",col="blue"))
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
