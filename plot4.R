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
coal <- scc[grep("Coal", scc$EI.Sector),1]
nei.coal <- subset (nei, SCC %in% coal)


# Prepare the data
sumyears <- aggregate(Emissions ~ year, data = nei.coal, sum)


# Plotting
png(file = "plot4.png")
barplot(Emissions ~ year , data = sumyears, col = "green", main = "Coal combustion-related emissions across the US")
dev.off()
