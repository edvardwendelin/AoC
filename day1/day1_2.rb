
rows = File.readlines('/Users/edvard/src/AoC/Day 1/input.txt').map(&:to_i)

for i in rows do
    for j in rows do 
        for k in rows do
            if i != j && i != k && k != j && i + j + k == 2020
                puts "#{i},#{j},#{k}: #{i*j*k}"   
                return
            end
        end
    end
end    