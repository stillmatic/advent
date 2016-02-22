library(dplyr)
library(combinat)

setwd("c:/code/advent")
data = readLines("9 input.txt", stringsAsFactors=F)

conv_table <- c()
for(i in 1:length(data)) {
	split <- strsplit(data[i], " ")
	from <- (split[[1]][1])
	to <- (split[[1]][3])
	dist <- split[[1]][5]
	conv_table <- rbind(conv_table, c(from, to, dist), c(to, from, dist))
}
colnames(conv_table) <- c("from", "to", "dist")
conv_table[, "dist"] <- as.numeric(paste(conv_table[, "dist"]))

conv_table <- data.frame(conv_table)
conv_table$dist <- as.numeric(paste(conv_table$dist))
conv_table$from <- as.character(conv_table$from)
conv_table$to <- as.character(conv_table$to)

places = as.character(unique(conv_table[,""]))
combos <- permn(places)

shortest = 9999999
longest = 0

for(item in combos) {
	me = 0
	for(i in 2:length(item)) {
		the_row <- which(conv_table[, "from"] == item[i-1] & conv_table[, "to"] == item[i])
		the_dist <- as.numeric(conv_table[the_row,"dist"])
		me = me + the_dist
	}

#	if(me < shortest) {
#		cat(item, " ", me, "\n")
#	}
	shortest = min(shortest, me)
	longest = max(longest, me)
}

shortest
longest