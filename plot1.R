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
sumyears <- tapply(nei$Emissions, nei$year, sum)
years <- names(sumyears)
df <- data.frame(sumyears)
df <- cbind (df, years)
names(df) <- c("emissions","year")

# Plotting
png(file = "plot1.png")
barplot(emissions ~ year , data = df, col = "blue", main = "Total PM2.5 emission from all sources")
dev.off()
