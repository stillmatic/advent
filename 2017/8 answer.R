setwd("c:/code/advent")
data = readLines("8 input.txt")

# correct answer: 1333

temp <- data[1]
temp2 <- data[2]

sum(nchar(data))

replace_specials <- function(dat) {
	a <- gsub("(\\\\x[0-9a-f]{2})", "Z", dat)
	b <- gsub("(\")", "", a)
	c <- gsub("(\\\\)", "S", b)
	nchar(c)
}
sum(replace_specials(data))
sum(nchar(data)) - sum(replace_specials(data))

cut_specials <- function(dat) {
	a <- gsub("(\\\\x[0-9a-f]{2})", "z", dat)
	b <- gsub("(\")", "", a)
	c <- gsub("(\\\\)", "S", b)
	c
}
cut_specials(temp)

tempa <- gsub("(\\\\x[0-9a-f]{2})", "", temp, useBytes=T)
tempb <- gsub("(\")", "", tempa)

# part 2: 2046
