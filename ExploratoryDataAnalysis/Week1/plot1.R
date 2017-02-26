plot1 <- function(x){
      ss <- subset(x, strptime(Date, format = "%d/%m/%Y") >= (strptime("2007-02-01", format = "%Y-%m-%d"))
                   &  strptime(Date, format = "%d/%m/%Y") <= (strptime("2007-02-02", format = "%Y-%m-%d")))

      gap <- as.numeric(levels(ss$Global_active_power)[ss$Global_active_power])
      
      pdf("plot1.pdf")
      
      hist(gap, main = "Global Active Power", 
                ylab = "Frequency", 
                xlab = "Global Active Power (kw)", 
                 col = "Red")
      dev.off()
}