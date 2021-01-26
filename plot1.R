# Download the file

if (!file.exists("data")) {
    dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, destfile = "./data/data.zip", method = "curl")

install.packages("zip")
library(zip)
unzip("./data/data.zip", exdir = "./data/")

# Load the data
nei <- readRDS("./data/summarySCC_PM25.rds")
scc <- readRDS("./data/Source_Classification_Code.rds")

# Prepare the data
sumyears <- aggregate(Emissions ~ year, data = nei, sum)

# Plotting
png(file = "plot1.png")
barplot(Emissions ~ year , data = sumyears, col = "blue", main = "Total PM2.5 emission from all sources")
dev.off()
