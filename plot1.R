## Project for Exploratory Data Analysis

##  This file genenates plot1 for project 1
  
  
##  Step 1 - Load the data
  
  power <- read.csv2 ("household_power_consumption.txt")
  head(power)
  
  powerfeb <- read.csv ("febpower2.csv")  #this is the Feb 1, 2 data
  
   
##  Step 2 - Filter the data (additional code below)
  
  ##  Subset data we need to plot
  febdata1  <- grep("1/2/2007", power$Date, fixed=TRUE)
  febdata2  <- grep("2/2/2007", power$Date, fixed=TRUE)
  febdata12 <- c(febdata1,febdata2)

##  Step 3 - Plot the data  
hist(powerfeb$Global_active_power, col= "red", main= "Global Active Power",xlab = "Global Active Power(kilowatts)")
dev.copy(png, file = "plot1.png")  ## Copy my plot ot a PNG file
dev.off()   ## close the PNG device.
 
##  Create new dataframe for Feb 1 and Feb 2
nrows <-length(febdata12)
rows <- 0  
  for(i in 1:nrows){
    rows <- rows +1
    newrow <- power[febdata12[i],]
    if (rows == 1){
      ##print(names(alldataframe[extractCols[i]]))
      febdataframe <- newrow
    }
    else{
      febdataframe <- rbind(febdataframe, newrow)
    } 
  }
## Filter file for Feb 1 and Feb 2 data 
nrows <-nrow(power)
rows <- 0  
  for(i in 1:nrows){
    rows <- rows +1
    if (power$Date == "1/2/2007"| power$Date == "2/2/2007")
    {
       rows <- rows + 1    
       newrow <- power[[i],]
    
       if (rows == 1){
           febdataframe2 <- newrow
        }
         else       
           febdataframe2 <- rbind(febdataframe, newrow)
          
        
    }
  }

#########################


head(febdataframe,2)
length(febdataframe)
nrow(febdataframe)


# Write the extracted data file -- So we can check

write.table(febdataframe, file = "febdataExtract.txt", append = FALSE, quote = FALSE, sep = ";",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")


 
 