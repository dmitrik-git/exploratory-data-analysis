xyplot (Ozone~Wind, airquality)
xyplot(Ozone ~ Wind, data = airquality, pch=8, col="red", main="Big Apple Data")
xyplot(Ozone ~ Wind | as.factor(Month), data = airquality, layout = c(5,1))

p <- xyplot(Ozone~Wind,data=airquality)
print(p)

names(p) #list allproperties of an object
p[["formula"]] #value of a specific property

## Panels
p <- xyplot(y ~ x | f, panel = function(x, y, ...) {
    panel.xyplot(x, y, ...)  ## First call the default panel function for 'xyplot'
    panel.abline(h = median(y), lty = 2)  ## Add a horizontal line at the median
})
print(p)
invisible()

p2 <- xyplot(y ~ x | f, panel = function(x, y, ...) {
    panel.xyplot(x, y, ...)  ## First call default panel function
    panel.lmline(x, y, col = 2)  ## Overlay a simple linear regression line
})
print(p2)
invisible()

xyplot (price~carat | color*cut, data = diamonds, strip = FALSE, pch = 20, xlab = myxlab, ylab = myylab, main = mymain)