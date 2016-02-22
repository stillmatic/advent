library(digest)

MY_KEY = "yzbqklnj"

for(i in 1:1000000) {
	salted <- paste(MY_KEY, i, sep="")
	result = digest(salted, serialize=F)
	if(substr(result, start=1, stop=5) == "000000") {
#		print("answer is ")
		paste("answer is ", i, sep="")
		#print(i)
		break
	}
}

for(i in 240000:10000000) {
	salted <- paste(MY_KEY, i, sep="")
	result = digest(salted, serialize=F)
	if(substr(result, start=1, stop=6) == "000000") {
#		print("answer is ")
		paste("answer is ", i, sep="")
		#print(i)
		break
	}
}

