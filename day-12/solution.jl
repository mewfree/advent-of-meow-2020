input = open(f->read(f, String), "input") |> f->split(f, "\n")

x = 0
y = 0
# direction = 'E'
direction = 90

for instruction in input
    action = instruction[1]
    value = parse(Int, instruction[2:length(instruction)])

    if action == 'N'
        global y += value
    elseif action == 'S'
        global y -= value
    elseif action == 'E'
        global x += value
    elseif action == 'W'
        global x -= value
    elseif action == 'L'
        global direction -= value
        if direction < 0
            # keep directions positive
            global direction += 360
        end
    elseif action == 'R'
        global direction += value
    elseif action == 'F'
        if rem(direction, 360) == 0
            global y += value
        elseif rem(direction, 360) == 180
            global y -= value
        elseif rem(direction, 360) == 90
            global x += value
        elseif rem(direction, 360) == 270
            global x -= value
        else
            println("Unmatched forward")
        end
    else
        println("Unmatched action")
    end
end

println(abs(x) + abs(y))
