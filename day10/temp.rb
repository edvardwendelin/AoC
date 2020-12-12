numbers     = STDIN.readlines().map(&:to_i)
numbers.sort!
numbers.push(numbers.last+3)
numbers.unshift(0)
distances = [0]
filtered = []
i = 1
anchor = 0
last_filter = 0

while i < numbers.length-1
    distances[i] = numbers[i]-numbers[i-1]
    puts "#{numbers[i]} - #{distances[i]}"
    i+=1
end

c = 0
ones = 0
freq = {}       # create empty hash

while c < distances.length()  # iterate over all elements in list
    case distances[c] # look at specific element in list at position c
    when 1            
        ones+=1
    when 3
        puts ones
        freq[ones] = 0 unless freq[ones] # initial entry in hashmap
        freq[ones]+=1  # increment frequenecy counter
        ones = 0       # reset ones counter
    end
    c+=1        #  Jump to next row in list of distances
end

freq[ones]+=1 # put in last stored sequence of ones

pp freq

results = 1
freq.each do |f,v|
   case f
   when 4
    results *=(7**v)
   when 3
    results *=(4**v)
   when 2
    results *=(2**v)
   end 
end

puts results

#pp numbers
#pp filtered.sort.uniq

return
numbers= 0



device_yolt =numbers.last
len = numbers.length

i = 0
stack = []
stack << numbers.first
counter = 0
iter = 0




while !stack.empty?
    if iter % 1000000 == 0
        puts "Iter: #{iter} Counter: #{counter} Stack: #{stack.length}"
    end
    iter+=1
    x = stack.pop
    if !numbers.find_index(x)
        i = 0
    else
        i = numbers.find_index(x)+1 
    end
    while (i < len) 
        if (numbers[i] > x )
            stack << numbers[i]
        end
            
        if numbers[i] == device_yolt
            counter+=1 
            break
        end
        i+=1
    end
end

puts counter
