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

# Motor vehicle related emissions
motor <- scc[grep("Motor Vehicles", scc$Short.Name),1]
nei.motor <- subset (nei, type =="ON-ROAD" & (fips == "24510" | fips == "06037"))


# Prepare the data
sumyears <- aggregate(Emissions ~ year+fips, data = nei.motor, sum)


# Plotting
library(ggplot2)
png(file = "plot6.png")
g <- ggplot (sumyears, aes (year, Emissions, color = fips))
g+geom_point()+geom_smooth(method = "lm")+facet_grid (. ~ fips)+ggtitle("Motor vehicle related emissions in Baltimore and LA")
dev.off()
