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

# Coal related emissions
motor <- scc[grep("Motor Vehicles", scc$Short.Name),1]
nei.motor <- subset (nei, type =="ON-ROAD" & fips == "24510")


# Prepare the data
sumyears <- aggregate(Emissions ~ year, data = nei.motor, sum)


# Plotting
png(file = "plot5.png")
barplot(Emissions ~ year , data = sumyears, col = "yellow", main = "On-road emissions in Baltimore City")
dev.off()
