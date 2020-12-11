preamble    = ARGV[0].to_i
i           = preamble
numbers     = STDIN.readlines().map(&:to_i)
broken_num  = 0

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

    if match == 0
        broken_num = numbers[i] 
        break
    end

    i+=1
end

search_len = i

while search_len > 1
    j   = 0
    sum = 0
    while j + search_len < i
        window = numbers.slice(j,search_len)
        if window.reduce(:+) == broken_num
            puts "Found it! #{window}"
            window.sort!
            puts "#{window.first + window.last}"
            return
        end
        j+=1
    end
    search_len-=1
end

