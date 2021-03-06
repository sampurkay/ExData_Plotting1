datafull <- fread("./data/household_power_consumption.txt",
                  sep=";",header=TRUE, na.strings = c("NA", "N/A", "null", "?"))
datafull$Date <- as.Date(datafull$Date, "%d/%m/%Y")
date1 <- as.Date("01/02/2007", "%d/%m/%Y")
date2 <- as.Date("02/02/2007", "%d/%m/%Y")
data <- with(datafull, datafull[(Date >= date1 & Date <= date2), ])
head(data)
nrow(data)
names(data)
##
outcome1 <- subset(data$Sub_metering_1, !is.na(data$Sub_metering_1) == TRUE)
outcome2 <- subset(data$Sub_metering_2, !is.na(data$Sub_metering_1) == TRUE)
outcome3 <- subset(data$Sub_metering_3, !is.na(data$Sub_metering_1) == TRUE)
par(pty="s")
png("plot3.png", width=480, height=480)
plot(outcome1, type="l", xlab="", ylab ="Energy sub metering", 
     xaxt= "n", yaxt= "n", cex.axis=0.75, cex.lab=0.75, col= colors)
points(outcome1, col="black", type="l", lwd=0.5)
points(outcome2, col="red", type="l", lwd=0.5)
points(outcome3, col="blue", type="l", lwd=0.5)
legend("topright", col= c("black", "red", "blue"), 
       legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=0.5,horiz=FALSE)
ticks <- c("Thu","Fri","Sat")
axis(1, at= seq(0, 2880,by=1440), labels= ticks, cex.axis=0.75)
axis(2, at=seq(0,50, by=10),labels=TRUE, cex.axis=0.75)
dev.off()
