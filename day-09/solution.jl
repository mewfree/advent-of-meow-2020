input = open(f->read(f, String), "input") |> f->split(f, "\n") |> a->parse.(Int, a)

preamble_size = 25

for (index, value) in enumerate(input)
    if index > preamble_size
        preamble = input[index-preamble_size:index-1]
        pairs = [(a, b) for a in preamble, b in preamble if a != b]
        if value ∉ sum.(pairs)
            println(value)
            break
        end
    end
end
