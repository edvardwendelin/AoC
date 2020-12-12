numbers     = STDIN.readlines().map(&:to_i)
numbers.sort!
numbers.push(numbers.last+3)    # add device to end of array
numbers.unshift(0)              # add power otutlet to beginning of array
results = 1

i = 1
ones = 0
while i < numbers.length()  
    case numbers[i]-numbers[i-1] 
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

        ones = 0      
    end
    i+=1
end

puts results