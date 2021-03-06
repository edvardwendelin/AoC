def is_seat(a)
    return false if a == "."
    return true 
end

def is_occupied(a)
    if a == "#"
        return 1
    elsif a == "L"
        return 0
    end
    return 0
end

def occupied_adjecent_seats(seats, x, y)
    return -1 unless is_seat(seats[x][y])

    counter =  is_occupied(seats[x-1][y-1])+is_occupied(seats[x-1][y])+is_occupied(seats[x-1][y+1])
    counter += is_occupied(seats[x][y-1])+is_occupied(seats[x][y+1])
    counter += is_occupied(seats[x+1][y-1])+is_occupied(seats[x+1][y])+is_occupied(seats[x+1][y+1])
    return counter
    
end

def count_occupied_seats(seats)
    i = 0
    num_occupied = 0
    while i < seats.length 
        j = 0 
        while j < seats[i].length
            num_occupied+=is_occupied(seats[i][j])
            j+=1
        end
        i+=1
    end

    return num_occupied
end

seats     = STDIN.readlines().map {|r| r = r.chomp.chars}

width = seats[0].length
height = seats.length

seats.each do |row|
    row.unshift(".")
    row.push(".")
end

# Create some space around us
seats.unshift(Array.new(width+2,"."))
seats.push(Array.new(width+2,"."))

seats_buffer = seats.clone.map(&:clone)


changes = 1
last_iter_seats = 0
while changes > 0

    seats_buffer = seats.clone.map(&:clone)

    i = 1
    while i <= height
        j = 1
        while j <= width
            
            if is_seat(seats[i][j])
                num_occupied = occupied_adjecent_seats(seats,i,j)
                if is_occupied(seats[i][j]) == 0 && num_occupied == 0
                    seats_buffer[i][j] = "#"
                elsif is_occupied(seats[i][j]) == 1 && num_occupied >= 4
                    seats_buffer[i][j] = "L"                
                end
            end
            j+=1
        end
        i+=1
    end

    seats.replace(seats_buffer)

    cnt_seats = count_occupied_seats(seats)
    if (last_iter_seats == cnt_seats)
        changes = 0
    end

    last_iter_seats = cnt_seats

    puts "Seats #{cnt_seats}"
end