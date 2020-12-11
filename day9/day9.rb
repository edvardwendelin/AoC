preamble    = ARGV[0].to_i
i           = preamble
numbers     = STDIN.readlines().map(&:to_i)

while (i < numbers.length)
    j = i-preamble
    match = 0
    while (j < i)
        k =i-preamble
        while k < i
            if j != k && numbers[k]+numbers[j] == numbers[i]
                match = 1
                break
            end
            k+=1
        end

        break if match == 1
        j+=1
    end

    puts "Broken number #{numbers[i]}" if match == 0

    i+=1
end