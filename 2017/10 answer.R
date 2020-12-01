input <- "1113122113"
for(i in 1:50) {
	runle <- rle(strsplit(input,"")[[1]])
	input <- paste(runle$lengths, runle$values, sep="", collapse="")	
	cat(i, ": ", nchar(input), "\n")
}
