
pc = 0
acc = 0

code = STDIN.readlines().map {|row| row = row.split(" ")}

hitlist = Array.new(code.length,0)

while (pc < code.length)
    inst    = code[pc][0]  
    arg     = code[pc][1].to_i

    if (hitlist[pc] == 1)
        puts acc
        return
    end

    hitlist[pc] = 1 # Ensure we never run this line again.
    case inst
    when "nop"
        pc+=1
    when "acc"
        acc+=arg
        pc+=1
    when "jmp"
        pc+=arg
    else
        puts inst
    end
end
pp code