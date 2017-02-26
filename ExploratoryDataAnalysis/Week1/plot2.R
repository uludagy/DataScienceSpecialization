plot2 <- function(x){
      ss <- subset(x, strptime(Date, format = "%d/%m/%Y") >= (strptime("2007-02-01", format = "%Y-%m-%d"))
                   &  strptime(Date, format = "%d/%m/%Y") <= (strptime("2007-02-02", format = "%Y-%m-%d")))
      
      gap <- as.numeric(levels(ss$Global_active_power)[ss$Global_active_power])
      dateWithHour <- strptime(paste(ss$Date, ss$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
      
      ##pdf("plot2.pdf")
      
      plot(dateWithHour,gap, type = "l", xlab = " "
                                       , ylab =  "Global Active Power(kw)")
      
      dev.copy(png, file="plot2.png", width=480, height=480)
      dev.off()
     
}