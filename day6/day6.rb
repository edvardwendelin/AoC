groups = STDIN.read().split("\n\n").map {|row|row = row.gsub("\n","").chars.to_a.uniq.join.length}

puts groups.reduce(0, :+)