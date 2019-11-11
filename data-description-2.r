plot(LakeHuron)
plot(LakeHuron, type = "p")
plot(LakeHuron, type = "h")


# The Old Faithful geyser data
d <- density(faithful$eruptions, bw = "sj")
d
plot(d)
hist(precip, freq = FALSE)
lines(density(precip))

Tbl <- table(state.division)
Tbl

prop.table(Tbl)


barplot(table(state.region), cex.names = 1.20)
barplot(prop.table(table(state.region)), cex.names = 1.20)

library(qcc)
pareto.chart(table(state.division), ylab="Frequency")
