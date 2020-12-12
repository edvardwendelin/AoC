numbers     = STDIN.readlines().map(&:to_i)
numbers.sort!
numbers.push(numbers.last+3)    # add device
numbers.unshift(0)              # add power otutlet
results = 1

i = 1
ones = 0
while i < numbers.length()  # iterate over all elements in list
    case numbers[i]-numbers[i-1] # look at specific element in list at position c
    when 1            
        ones+=1
    when 3
        case ones
        when 4
            results *=7
        when 3
            results *=4
        when 2
            results *=2
        end 

        ones = 0       # reset ones counter
    end
    i+=1        #  Jump to next row in list of distances
end

puts results