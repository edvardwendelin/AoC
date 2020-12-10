
rows = File.readlines('/Users/edvard/src/AoC/Day 1/input.txt').map(&:to_i)

for i in rows do
    for j in rows do 
        if i != j && i + j == 2020
            puts "#{i},#{j}: #{i*j}"   
            return
        end
    end
end    