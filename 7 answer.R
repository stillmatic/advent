setwd("c:/code/advent")
data = readLines("7 input.txt")
sample = readLines("7 sample.txt")

operators <- c("AND", "LSHIFT", "OR", "NOT", "RSHIFT")

for(line in data) {
	split = strsplit(line, " ")
	
}