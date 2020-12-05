input = open(f->read(f, String), "input") |> f->split(f, "\n")

function calculate_seat_id(line)
    row = 0:127
    row_string = line[1:7]
    for i in split(row_string, "")
        if i == "F"
            row = first(row):first(row)+length(row)÷2-1
        else
            row = first(row)+length(row)÷2:last(row)
        end
    end

    column = 0:7
    column_string = line[8:end]
    for j in split(column_string, "")
        if j == "L"
            column = first(column):first(column)+length(column)÷2-1
        else
            column = first(column)+length(column)÷2:last(column)
        end
    end

    return first(row) * 8 + first(column)
end

seat_ids = map(l->calculate_seat_id(l), input)

println("Part 1:")
println(maximum(seat_ids))

println("Part 2:")
for seat_id in minimum(seat_ids):maximum(seat_ids)
    if seat_id ∉ seat_ids && seat_id+1 ∈ seat_ids && seat_id-1 ∈ seat_ids
        println(seat_id)
    end
end
