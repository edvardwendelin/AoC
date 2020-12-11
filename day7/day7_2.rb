bags = {}
rules = STDIN.read().gsub(",","").gsub(".","").gsub("contain","").split("\n").map {|row| row = row.split(/bag(?:s)?/)}

# Create basic data structure
for r in rules do
    i = 1
    r.map(&:strip)
    r[0] = r[0].strip
    bags[r[0]] = {}
    bags[r[0]]['quantities'] = []
    bags[r[0]]['colors'] = []

    while i < r.length
        color = r[i].tr("0-9","").strip
        bags[r[0]]['quantities'] << r[i].to_i unless r[i].to_i == 0
        bags[r[0]]['colors'] << color unless color.match("no other")
        i+=1
    end
end

stack = ["shiny gold"]
contains_gold = []
bags_total = 0

while !stack.empty?
    v = stack.pop
    bags.each do |key,contains|
        if key == v
            i = 0

            while i < contains['colors'].length
                j = 0
                while j < contains['quantities'][i]
                    j+=1
                    stack.push(contains['colors'][i])
                end
                i+=1
            end

            bags_total+= contains['quantities'].reduce(0, :+)
        end
    end 
end

puts bags_total