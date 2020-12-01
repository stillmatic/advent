data <- readChar("1 input.txt", nchars = 7000)
split <- strsplit(data[[1]], "")
split2 <- as.factor(split)
levels(split2) <- c("1", "-1")

i = 1
pos=T

while(pos) { 
	if(sum(as.numeric(paste(split2[1:i]))) >= 0) {
		i = i + 1
	} else {
		cat(i)
		pos = F
	}
}
