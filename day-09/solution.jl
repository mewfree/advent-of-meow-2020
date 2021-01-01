input = open(f->read(f, String), "input") |> f->split(f, "\n") |> a->parse.(Int, a)

preamble_size = 25

for (index, value) in enumerate(input)
    if index > preamble_size
        preamble = input[index-preamble_size:index-1]
        pairs = [(a, b) for a in preamble, b in preamble if a != b]
        if value ∉ sum.(pairs)
            global result = value
            println("Part 1:")
            println(result)
            break
        end
    end
end

set_ranges = [i:j for i in 1:length(input), j in 1:length(input) if j > i]
for set_range in set_ranges
    set = input[set_range]
    if set |> sum == result
        println("Part 2:")
        println(minimum(set) + maximum(set))
        break
    end
end
