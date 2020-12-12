numbers     = STDIN.readlines().map(&:to_i)
numbers.sort!
numbers.push(numbers.last+3)    # add device to end of array
numbers.unshift(0)              # add power otutlet to beginning of array
freq = {}

i = 1
ones = 0
max_ones = 0

while i < numbers.length()  
    case numbers[i]-numbers[i-1] 
    when 1            
        ones+=1
    else
        freq[ones]  = 0 unless freq[ones]
        freq[ones]  +=1
        max_ones    = ones if ones > max_ones
        ones = 0      
    end
    i+=1
end

puts "Longest sequence of consequtive numbers: #{max_ones}"

paths = {}
i = 2
while i <= max_ones
    if freq.has_key?(i)
        puts "Looking up number of paths for #{i}"
        graph = Array.new(i) {|j|j+1}
        goal = graph.last
        counter = 0
        stack = []
        stack << graph[0]

        while !stack.empty?
            x = stack.pop

            graph.each do |n|
                if n > x && n - x < 3
                    stack.push(n)
                end
                if n == goal
                    counter+=1
                end
            end
             
        end
        paths[i] = counter
        puts "Unique paths: #{counter}"
    end
    i+=1
end

# Calculate total paths
i = 2 
results = 1
while i <= max_ones
    if paths[i]
        results *= paths[i]**freq[i]
    end
    i+=1
end

puts results