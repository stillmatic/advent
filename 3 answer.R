data <- readChar("3 input.txt", nchars = 8193 )
split <- strsplit(data[[1]], "")

position <- c(0,0) # (x, y)
visited_houses  <- c()

for(line in split[[1]]) {
	if(line == "^") {
		position[2] = position[2] + 1
	} else if(line == ">") {
		position[1] = position[1] + 1
	} else if(line == "<") {
		position[1] = position[1] - 1
	} else if(line == "v") {
		position[2] = position[2] - 1
	}
	new_pos = rbind(position[1], position[2])
	visited_houses <- c(visited_houses, list(new_pos))
}

length(unique(visited_houses))

odds<-seq(from=1, to=length(split[[1]]), by=2)
even<-seq(from=2, to=length(split[[1]]), by=2)

position_santa <- c(0,0) # (x, y)
position_robo <- c(0,0) # (x, y)
visited_houses  <- c()
i = 0

for(i in 1:8192) {
	line <- split[[1]][i]
	if((i %% 2) == 0) {
		temp <- position_robo
	} else {
		temp <- position_santa
	}

	if(line == "^") {
		temp[2] = temp[2] + 1
	} else if(line == ">") {
		temp[1] = temp[1] + 1
	} else if(line == "<") {
		temp[1] = temp[1] - 1
	} else if(line == "v") {
		temp[2] = temp[2] - 1
	}
	new_pos = rbind(temp[1], temp[2])
	if((i %% 2) == 0) {
		position_robo <- temp
	} else {
		position_santa <- temp
	}
	visited_houses <- c(visited_houses, list(new_pos))
}
length(unique(visited_houses))
