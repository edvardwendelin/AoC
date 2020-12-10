groups = STDIN.read().split("\n\n") #.map {|row|row = row.gsub("\n","").chars.to_a.sort.join}
total = 0

for g in groups do
    num_people = g.count("\n")+1
    answers = 0

    g = g.gsub("\n","")
    chrs = g.chars.to_a
    
    frq = {}
    for c in chrs do
        frq[c] = 0 unless frq.include?(c)
        frq[c] +=1
    end

    frq.each do |k,v|
        answers +=1 if (v == num_people)
    end

    total+=answers
end

puts total
