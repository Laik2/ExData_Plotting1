plots <- function(){

  
  # It's assumed that the required file is already contained in the working directory 
  # Each plot is saved in a .PNG file
  # Read data file, but only the rows with date='2/2/2007' or date='1/2/2007
  # Convert the column named "Date" to type Date
  require(sqldf)
  
  testdata <- read.csv.sql("C:\\Users\\ok\\Documents\\R\\household_power_consumption.txt", sql = "select * from file where Date = '2/2/2007' OR Date='1/2/2007' ",sep=";")
  testdata$Date<-as.POSIXct(paste(testdata$Date, testdata$Time), format = "%d/%m/%Y %T")
  
  
  # Plot 1
  png("plot1.png", width = 480, height = 480)
  hist(testdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
  # Close connection
  dev.off()
  
  
  # Plot 2
  png("plot2.png", width = 480, height = 480)
  plot(testdata$Global_active_power~testdata$Date, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  # Close connection
  dev.off()
  
  # Plot 3
  png("plot3.png", width = 480, height = 480)
  plot(testdata$Date, testdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(testdata$Date, testdata$Sub_metering_2, type="l", col="red")
  lines(testdata$Date, testdata$Sub_metering_3, type="l", col="blue")
  # Add a legend to the plot
  legend("topright",col=c("black", "red", "blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
  
  # Close connection
  dev.off()
  
  
  # Plot 4
  png("plot4.png", width = 480, height = 480)
  
  # Change settings first to include all for plots into one
  par(mfrow=c(2,2))
  plot(testdata$Global_active_power~testdata$Date, type="l", xlab="", ylab="Global Active Power")
  plot(testdata$Voltage~testdata$Date, type="l", ylab="Voltage", xlab="datetime")
  plot(testdata$Date, testdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(testdata$Date, testdata$Sub_metering_2, type="l", col="red")
  lines(testdata$Date, testdata$Sub_metering_3, type="l", col="blue")
  legend("topright",col=c("black", "red", "blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1) 
  plot(testdata$Global_reactive_power~testdata$Date, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  # Close connection
  dev.off()
      
  
}