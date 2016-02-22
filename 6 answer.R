setwd("c:/code/advent")
data = readLines("6 input.txt")

# 0 for off, 1 for on
the_grid <- matrix(0,ncol=1000,nrow=1000)

for(line in data){
	cut <- substr(line, start=7, stop=99)
	instr <- substr(cut, start=1, stop=1)
	if(instr == " ") {
		mode = "TOGGLE"
	} else if (instr == "f") {
		mode = "OFF"
	} else {
		mode = "ON"
	}
	split <- strsplit(cut, " ")[[1]]
	start <- split[2]
	end <- split[4]

	start_comma <- regexpr(",", start, fixed=T)[1]
	end_comma <- regexpr(",", end, fixed=T)[1]

	start_x <- as.numeric(substr(start,start=1, stop=start_comma-1))
	start_y <- as.numeric(substr(start,start=start_comma+1, stop=99))
	end_x <- as.numeric(substr(end,start=1, stop=end_comma-1))
	end_y <- as.numeric(substr(end,start=end_comma+1, stop=99))

	min_x <- min(start_x, end_x)
	min_y <- min(start_y, end_y)
	max_x <- max(start_x, end_x)
	max_y <- max(start_y, end_y)

	for(i in min_x:max_x) {
		for(j in min_y:max_y) {
			if(mode == "TOGGLE") {
				if(the_grid[i,j] == 0) {
					the_grid[i,j] = 1
				} else {
					the_grid[i,j] = 0
				}
			} else if(mode=="ON") {
				the_grid[i,j] = 1
			} else {
				the_grid[i,j] = 0
			}
		}
	}

}

sum(the_grid)

# part 2

the_grid <- matrix(0,ncol=1000,nrow=1000)

for(line in data){
	cut <- substr(line, start=7, stop=99)
	instr <- substr(cut, start=1, stop=1)
	if(instr == " ") {
		mode = "TOGGLE"
	} else if (instr == "f") {
		mode = "OFF"
	} else {
		mode = "ON"
	}
	split <- strsplit(cut, " ")[[1]]
	start <- split[2]
	end <- split[4]

	start_comma <- regexpr(",", start, fixed=T)[1]
	end_comma <- regexpr(",", end, fixed=T)[1]

	start_x <- as.numeric(substr(start,start=1, stop=start_comma-1))
	start_y <- as.numeric(substr(start,start=start_comma+1, stop=99))
	end_x <- as.numeric(substr(end,start=1, stop=end_comma-1))
	end_y <- as.numeric(substr(end,start=end_comma+1, stop=99))

	min_x <- min(start_x, end_x)
	min_y <- min(start_y, end_y)
	max_x <- max(start_x, end_x)
	max_y <- max(start_y, end_y)

	for(i in min_x:max_x) {
		for(j in min_y:max_y) {
			if(mode == "TOGGLE") {
				the_grid[i,j] = the_grid[i,j] + 2
			} else if(mode=="ON") {
				the_grid[i,j] = the_grid[i,j] + 1
			} else {
				the_grid[i,j] = max(the_grid[i,j] - 1, 0)
			}
		}
	}

}

sum(the_grid)
