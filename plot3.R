## Project for Exploratory Data Analysis

##  This file genenates plot3 for project 1
  
  
##  Step 1 - Load the data that has been filtered
## Note:  The filtering of data to Feb 1 and 2, 2007 in in plot1.R
    
  powerfeb <- read.csv ("febpower2.csv")  ## read Feb 1,2, 2007 data
  
## change text date & time and add new column to plot from
  
  newdatetime <- strptime(paste(powerfeb$Date,powerfeb$Time), format= "%d/%m/%Y %H:%M:%S")

  ## add this column to the data
  newpowerfeb <- cbind(powerfeb,newdatetime)
  
  ##  Plot the data and save the file

  png(filename = "plot3.png")
  with(newpowerfeb, plot(newdatetime, Sub_metering_1,type = "s", ylab= "Energy sub metering", xlab = " "))
  with (subset(newpowerfeb, points(newdatetime, Sub_metering_2, type = "s", col= "red")))
  with (subset(newpowerfeb, points(newdatetime, Sub_metering_3, type = "s", col= "blue")))
  legend("topright", lty=c(1,1,1), cex=.9,  pt.cex = 1,col = c("black", "red", "blue"), legend = c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))
      
  
  dev.off()   ## close the PNG device.
  
  
