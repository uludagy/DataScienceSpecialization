plot3 <- function(x){
      ss <- subset(x, strptime(Date, format = "%d/%m/%Y") >= (strptime("2007-02-01", format = "%Y-%m-%d"))
                   &  strptime(Date, format = "%d/%m/%Y") <= (strptime("2007-02-02", format = "%Y-%m-%d")))
      
      dateWithHour <- strptime(paste(ss$Date, ss$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
      submeter.1   <- as.numeric(levels(ss$Sub_metering_1)[ss$Sub_metering_1])
      submeter.2   <- as.numeric(levels(ss$Sub_metering_2)[ss$Sub_metering_2])
      submeter.3   <- ss$Sub_metering_3
      
      pdf("plot3.pdf")
      
      plot(dateWithHour, submeter.1, type = "l", xlab = "", ylab = "Energy Sub metering")
      lines(dateWithHour, submeter.2, type = "l", col = "red")
      lines(dateWithHour, submeter.3, type = "l", col = "blue")
      legend("topright", c("Submeter.1","Submeter.2","Submeter.3"), 
                         col = c("black","red","blue"), 
                         lty = 1, 
                         lwd = 1)
      
      dev.off()
}