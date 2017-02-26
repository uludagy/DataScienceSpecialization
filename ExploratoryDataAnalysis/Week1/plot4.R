plot4 <- function(x){
      ss <- subset(x, strptime(Date, format = "%d/%m/%Y") >= (strptime("2007-02-01", format = "%Y-%m-%d"))
                   &  strptime(Date, format = "%d/%m/%Y") <= (strptime("2007-02-02", format = "%Y-%m-%d")))
      
      dateWithHour <- strptime(paste(ss$Date, ss$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
      gap <- as.numeric(levels(ss$Global_active_power)[ss$Global_active_power])
      grp <- as.numeric(levels(ss$Global_reactive_power)[ss$Global_reactive_power])
      voltage <- as.numeric(levels(ss$Voltage)[ss$Voltage])
      submeter.1   <- as.numeric(levels(ss$Sub_metering_1)[ss$Sub_metering_1])
      submeter.2   <- as.numeric(levels(ss$Sub_metering_2)[ss$Sub_metering_2])
      submeter.3   <- ss$Sub_metering_3
      
      
      #pdf("plot4.pdf")
      par(mfrow = c(2,2))
      
      #plot1
      plot(dateWithHour, gap, xlab = "", ylab = "Global Active Power", type = "l")
      
      #plot2
      plot(dateWithHour, voltage, xlab = "dateTime", ylab = "Voltage", type = "l")
      
      #plot3
      plot(dateWithHour, submeter.1, type = "l", xlab = "", ylab = "Energy Sub metering")
      lines(dateWithHour, submeter.2, type = "l", col = "red")
      lines(dateWithHour, submeter.3, type = "l", col = "blue")
      legend("topright", c("Submeter.1","Submeter.2","Submeter.3"), 
             col = c("black","red","blue"), 
             lty = c(1,1), 
             lwd = c(1,1),
             cex = 0.75,
             bty = "n")
      
      #plot4
      plot(dateWithHour, grp, xlab = "dateTime", ylab = "Global Reactive Power", type = "l")
      
      dev.copy(png, file="plot4.png", width=480, height=480)
      dev.off()
}


