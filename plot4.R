## Project for Exploratory Data Analysis

##  This file genenates plot4 for project 1
  
  
##  Step 1 - Load the data that has been filtered
## Note:  The filtering of data to Feb 1 and 2, 2007 in in plot1.R
    
  powerfeb <- read.csv ("febpower2.csv")  ## read Feb 1,2, 2007 data
  
## change text date & time and add new column to plot from
  
  newdatetime <- strptime(paste(powerfeb$Date,powerfeb$Time), format= "%d/%m/%Y %H:%M:%S")

  ## add this column to the data
  newpowerfeb <- cbind(powerfeb,newdatetime)
  
  ##  Plot the data and save the file

  
  png(filename = "plot4png.png")
  attach(newpowerfeb)
  par(mfrow = c(2,2))
    
  
  ## plot 1
  plot(newdatetime, Global_active_power,type = "l",ylab="Global Active Power",xlab= " " )
  
  ## plot 2
  plot(newdatetime, Voltage,type = "l",ylab="Voltage",xlab= "datetime")
  
  ## plot 3
  plot(newdatetime, Sub_metering_1,type = "s", ylab= "Energy sub metering", xlab = " ")
    with (subset(newpowerfeb, points(newdatetime, Sub_metering_2, type = "s", col= "red")))
    with (subset(newpowerfeb, points(newdatetime, Sub_metering_3, type = "s", col= "blue")))
    legend("topright", bty = "n",lty=c(1,1,1), cex=.7,  pt.cex = 1,col = c("black", "red", "blue"), legend = c("Sub_metering_1    ","Sub_metering_2   ","Sub_metering_3    "))
  ## plot 4 - filler for now 
  plot(newdatetime, Global_reactive_power,type = "l",ylab="Global_reactive_power",xlab= "datetime")
  
  ## 
  ##dev.copy(png, file = "plot4.png")  ## Copy  plot 4 to a PNG file
  dev.off()   ## close the PNG device.
  
  
