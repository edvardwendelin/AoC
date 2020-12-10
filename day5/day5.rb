
input = STDIN.readlines().map {|row| row = row.gsub("B","1").gsub("F","0").gsub("L","0").gsub("R","1").to_i(2)}

input = input.sort.reverse!

puts input[0]