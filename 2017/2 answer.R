# read data
data = readLines("2 input.txt")

makeTuple = function(line) {
	strsplit(line, "x")
}

tuples <- do.call(rbind,makeTuple(data))

# part 1

calcArea <- function(line) {
	l = as.numeric(line[1])
	w = as.numeric(line[2])
	h = as.numeric(line[3])

	triple <- c(l*w,w*h,h*l)

	2 * sum(triple) + min(triple)
}

val = 0
for(i in 1:1000) {
	temp = tuples[i,]
	val = val + calcArea(temp)	
}
val

# part 2

calcRibbon <- function(line) {
	l = as.numeric(line[1])
	w = as.numeric(line[2])
	h = as.numeric(line[3])

	triple <- c(l+w,w+h,h+l)

	2 * min(triple) + (l * w * h)
}

val = 0
for(i in 1:1000) {
	temp = tuples[i,]
	val = val + calcRibbon(temp)	
}
val
