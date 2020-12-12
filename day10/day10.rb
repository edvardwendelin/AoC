numbers     = STDIN.readlines().map(&:to_i)
numbers.sort!

inp_yolt    =0
device_yolt =numbers.last+3

freq = {}

i = 0
last_yolt = inp_yolt
while i < numbers.length
    yolt_diff = numbers[i]-last_yolt
    freq[yolt_diff] = 0 if !freq[yolt_diff]
    freq[yolt_diff]+=1
    last_yolt = numbers[i]
    i+=1
end

# Add device
freq[3]+=1

puts freq[1]*freq[3]