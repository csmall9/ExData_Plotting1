## Project for Exploratory Data Analysis

##  This file genenates plot2 for project 1
  
  
##  Step 1 - Load the data
  
  power <- read.csv2 ("household_power_consumption.txt")
  head(power)
  
  powerfeb <- read.csv ("febpower2.csv")
  
  ## Note:  The filtering of data to Feb 1 and 2, 2007 in in plot1.R
  
  ## need to change text date & time 
  
  newdatetime <- strptime(paste(powerfeb$Date,powerfeb$Time), format= "%d/%m/%Y %H:%M:%S")

  ## add this column to the data
  newpowerfeb <- cbind(powerfeb,newdatetime)
  
  ##  Plot the data and save the file
  
  png(filename = "plot2.png")
  
  with(newpowerfeb, plot(newdatetime, Global_active_power,type = "l",ylab="Global Active Power (kilowatts)",xlab= " " ))
  
  
  dev.off()   ## close the PNG device.
  
  
