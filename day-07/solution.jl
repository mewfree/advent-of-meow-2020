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

println("Part 1:")
println(count)

global directory_with_numbers = Dict()
for line in input
    contain_split = split(line, " bags contain ")
    colour, rest = contain_split[1], strip(contain_split[2], '.')
    contain = split(rest, ", ") |> s->map(a->(split(a)[1] == "no" ? 0 : parse(Int, split(a)[1]), join([split(a)[2], split(a)[3]], " ")), s)
    directory_with_numbers[colour] = contain
end

function how_many_bags(bag_colour)
    if bag_colour == "other bags"
        return 0
    end
    list_of_bags = directory_with_numbers[bag_colour]
    count = 1
    for bag_pair in list_of_bags
        n, colour = bag_pair
        count += n*how_many_bags(colour)
    end
    return count
end

println("Part 2:")
# We include the bag itself in the count of how_many_bags(), therefore we have to substract 1 as we shouldn't count the shiny gold bag itself
println(how_many_bags("shiny gold")-1)
