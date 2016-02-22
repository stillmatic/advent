data <- readLines("5 input.txt")

#part 1

vec <- grepl("(.*[aeiou]){3}", data) & !grepl("(ab|cd|pq|xy)", data) & grepl("([a-z])\\1",data)
sum(vec)

vec2 <- grepl('([a-z][a-z]).*\\1', data, perl=T) & grepl('([a-z]).\\1', data, perl=T)
sum(vec2)