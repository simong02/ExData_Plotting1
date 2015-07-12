Start by downloading file and unzipping to workingDirectory/data
#Read data into table called "all"
all<-read.table("./data/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE)

#Convert columns from class "character" to "numeric"
all$Global_active_power<-as.numeric(all$Global_active_power)
all$Global_reactive_power<-as.numeric(all$Global_reactive_power)

#Subset only needed dates
data<-subset(all, all$Date=="1/2/2007" | all$Date=="2/2/2007")

#Convert dates
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

#Create new variable with both date and time
data$t<-paste(data$Date, data$Time)

#Convert new variable "t" to POSIXlt (this could have been combined with previous step)
data$t<-strptime(data$t, format="%Y-%m-%d %H:%M:%S")

#Creating second plot
png(file = "Plot3.png", width = 480, height = 480)
plot(data$t, data$Global_active_power,xlab="", ylab="Global Active Power (kilowats)", type="l")
dev.off()

