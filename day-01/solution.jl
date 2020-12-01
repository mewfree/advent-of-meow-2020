input = open(f->read(f, String), "input") |> f->split(f, "\n") |> a->map(s->parse(Int, s), a)

for i ∈ input, j ∈ input
    if i+j == 2020
        println(i*j)
        break
    end
end
