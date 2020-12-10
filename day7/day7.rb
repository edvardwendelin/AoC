bags = {}
rules = STDIN.read().gsub(",","").gsub(".","").gsub("contain","").split("\n").map {|row| row = row.split(/bag(?:s)?/)}

# Create basic data structure
for r in rules do
    i = 1
    r.map(&:strip)
    r[0] = r[0].strip
    bags[r[0]] = []

    while i < r.length
        tuple = {}
        #tuple["nr"] = r[i].to_i
        tuple["color"] = r[i].tr("0-9","").strip
        bags[r[0]] << tuple["color"] unless tuple["color"].match("no other")
        i+=1
    end
end

stack = ["shiny gold"]
contains_gold = []

while !stack.empty?
    v = stack.pop
    bags.each do |key,contains|
        if contains.include?(v)
            stack.push(key)
            contains_gold << key  
        end
    end 
end

puts contains_gold.uniq.length