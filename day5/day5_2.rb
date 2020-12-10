
input = STDIN.readlines().map {|row| row = row.gsub("B","1").gsub("F","0").gsub("L","0").gsub("R","1").to_i(2)}

input = input.sort
i = 0
while i < input.length-1
    if input[i+1]-input[i] == 2
        puts input[i]+1
    end
    i+=1
end