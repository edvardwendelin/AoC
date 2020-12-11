def runcode (code)

    pc      = 0
    acc     = 0
    hitlist = Array.new(code.length,0)

    while (pc < code.length)
        inst    = code[pc][0]  
        arg     = code[pc][1].to_i
    
        if (hitlist[pc] == 1)
            return false
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

    puts "Program terminated successfully: #{acc}"
    return true
end


code = STDIN.readlines().map {|row| row = row.split(" ")}

i = 0
while i < code.length 
    copycode = code.clone.map(&:clone)

    case code[i][0]
    when "nop"
        copycode[i][0] = "jmp"
    when "jmp"
        copycode[i][0] = "nop"
    end

    if runcode(copycode)
        puts "Broken line #{i}" 
        break
    end
    i+=1
end
