input = open(f->read(f, String), "input") |> strip |> f->split(f, "\n")

function list_thru_mask(list, mask)
    for (index, _) in enumerate(list)
        if mask[index] == "0"
            list[index] = "0"
        elseif mask[index] == "1"
            list[index] = "1"
        end
    end
    list
end

memory = Dict()

for line in input
    if startswith(line, "mask")
        global mask = line |> l->split(l, " ")[3] |> m->split(m, "")
    else
        (address, value) = match(r"mem\[(.*)\] = (.*)", line).captures
        binary_value = value |> v->parse(Int, v) |> v->string(v; base = 2)
        splitb = binary_value |> v->split(v, "")
        catb = vcat(fill("0", length(mask) - length(splitb)), splitb)
        memory[address] = catb |> l->list_thru_mask(l, mask) |> l->join(l, "") |> l-> parse(Int, l, base = 2)
    end
end

sum = 0
for (_, value) in memory
    global sum += value
end

println(sum)
