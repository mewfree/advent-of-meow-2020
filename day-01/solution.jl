input = open(f->read(f, String), "input") |> f->split(f, "\n") |> a->map(s->parse(Int, s), a)

# Part 1
for i ∈ input, j ∈ input
    if i+j == 2020
        println("Part 1:")
        println(i*j)
        break
    end
end

# Part 2
for i ∈ input, j ∈ input, k ∈ input
    if i+j+k == 2020
        println("Part 2:")
        println(i*j*k)
        break
    end
end
