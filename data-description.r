#Example 1: Annual Precipitation in US Cities
str(precip)
precip[1:4]

#Example 2: Lengths of Major North American Rivers
str(rivers)

#Example 3: Yearly Numbers of Important Discoveries
str(discoveries)

#Displaying quantitative data
stripchart(precip, xlab="rainfall")
stripchart(rivers, method="jitter", xlab="length")
stripchart(discoveries, method="stack", xlab="number")
