# qplot

qplot (displ, hwy, data = mpg, color = drv)
qplot (displ, hwy, data = mpg, color = drv, geom = c("point", "smooth")) # adding trendlines
qplot (drv, hwy, data = mpg, geom = "boxplot", color = manufacturer) # candles split by drv factor
qplot (hwy, data = mpg, fill = drv) # histogram

qplot (displ, hwy, data = mpg, facets = . ~ drv) # scatterplot with panels for each drv value
qplot (hwy, data = mpg, facets = drv ~ ., binwidth = 2) # histograms with panels for each drv value

# ggplot

g <- ggplot (mpg, aes (displ, hwy))
g+geom_point() # show the scatterplot
g+geom_point()+geom_smooth() # adding a trendline
g+geom_point()+geom_smooth(method = "lm") # linear regression added
g+geom_point()+geom_smooth(method = "lm")+facet_grid (. ~ drv) # adding panels
g+geom_point()+geom_smooth(method = "lm")+facet_grid (. ~ drv)+ggtitle("Swirl Rules!") # adding a title

g+geom_point(color = "pink", size = 4, alpha = 0.5) # customizing 
g+geom_point(size = 4, alpha = 0.5, aes (color = drv)) # different colors for factors

#Adding labels
g+geom_point (aes (color = drv)) + labs (title = "Swirl Rules!") + labs (x = "Displacement", y = "Hwy Mileage")

# Customizing 
g + geom_point (aes (color = drv), size = 2, alpha = 0.5) + geom_smooth (size = 4, linetype = 3, method = "lm", se = FALSE)

# Using another theme
g + geom_point (aes (color = drv)) + theme_bw (base_family = "Times")

# Setting coordinates limits
g + geom_line () + coord_cartesian (ylim = c(-3,3))

