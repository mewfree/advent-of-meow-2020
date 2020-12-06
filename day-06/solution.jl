input = open(f->read(f, String), "input") |> f->split(f, "\n\n") |> f->map(l->split(l, "\n"), f)

uniques = input |> f->map(l->join(l) |> s->split(s, "") |> a->unique(a),  f)

result = sum(map(l->length(l), uniques))
println(result)
