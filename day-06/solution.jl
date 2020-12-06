input = open(f->read(f, String), "input") |> f->split(f, "\n\n") |> f->map(l->split(l, "\n"), f)

# Part 1
uniques = input |> f->map(l->join(l) |> s->split(s, "") |> a->unique(a),  f)

println("Part 1:")
result = sum(map(l->length(l), uniques))
println(result)

# Part 2
global count = 0
for groups in input
    num_people = length(groups)

    local freq = Dict()
    for answer in groups
        for char in answer
            freq[char] = haskey(freq, char) ? freq[char] + 1 : 1
        end
    end

    for occur in freq
        if occur[2] == num_people
            global count += 1
        end
    end
end

println("Part 2:")
println(count)
