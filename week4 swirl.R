# Original column names merged into one string separated by a post-symbol. Split into separate strings.
cnames <- strsplit(cnames, '|', fixed = TRUE)
names(pm0) <- make.names(cnames[[1]][wcol])

x0 <- pm0$Sample.Value
mean(is.na(x0)) # percentage of missing values

names(pm1) <- make.names(cnames[[1]][wcol])
x1 <- pm1$Sample.Value

boxplot(log10(x0),log10(x1))

# counting negative values
negative <- x1<0
sum(negative, na.rm=TRUE)
mean(negative, na.rm=TRUE) # percentage of negative values

dates <- pm1$Date
dates <- as.Date(as.character(dates), "%Y%m%d") # converting dates
hist(dates[negative], "month")

both <- intersect(site0, site1)
cnt0 <- subset(pm0, State.Code == 36 & county.site %in% both) #measurements in New York and overlapping sites
cnt1 <- subset(pm1, State.Code == 36 & county.site %in% both)

sapply(split(cnt0, cnt0$county.site), nrow)
pm0sub<-subset(cnt0, County.Code==63 & Site.ID == 2008)
pm1sub<-subset(cnt1, County.Code==63 & Site.ID == 2008)

dates0 <- as.Date(as.character(pm0sub$Date), "%Y%m%d")
dates1 <- as.Date(as.character(pm1sub$Date), "%Y%m%d")

par(mfrow = c(1,2), mar=c(4,4,2,1))
plot(dates0, x0sub, pch=20)
abline (h=median(x0sub, na.rm=TRUE), lwd=2)

plot(dates1, x1sub, pch=20)
abline (h=median(x1sub, na.rm=TRUE), lwd=2)

rng<-range(x0sub, x1sub, na.rm=TRUE) # aligning the y axis for both plots

mn0 <- with(pm0, tapply(Sample.Value, State.Code, mean, na.rm=TRUE))
mn1 <- with(pm1, tapply(Sample.Value, State.Code, mean, na.rm=TRUE))

d0 <- data.frame(state=names(mn0), mean=mn0)
d1 <- data.frame(state=names(mn1), mean=mn1)
mrg <- merge(d0, d1, by="state")

with(mrg, plot(rep(1,52), mrg[,2], xlim=c(.5,2.5)))
with(mrg, points(rep(2,52), mrg[,3]))

segments (rep(1,52), mrg[,2], rep(2,52), mrg[,3])


