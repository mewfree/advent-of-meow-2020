input = open(f->read(f, String), "input") |> f->split(f, "\n")

global directory = Dict()
for line in input
    contain_split = split(line, " bags contain ")
    colour, rest = contain_split[1], contain_split[2]
    contain = split(rest, ", ") |> s->map(a->join([split(a)[2], split(a)[3]], " "), s)
    directory[colour] = contain
end

global colour_names = []
for colour in directory
    if "shiny gold" ∈ colour[2]
        push!(colour_names, colour[1])
    end
end

global count = 0
while count < colour_names |> unique |> length
    global count = colour_names |> unique |> length
    for colour in directory
        for contain_bag_colour in colour[2]
            if contain_bag_colour ∈ colour_names
                push!(colour_names, colour[1])
            end
        end
    end
end

println(count)
