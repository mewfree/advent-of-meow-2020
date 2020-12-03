grid = open(f->read(f, String), "input") |> f->replace(f, ('.', '#') => s->s == '.' ? 0 : 1) |> f->split(f, "\n") |> f->map(l->split(l, ""), f) |> f->map(l->map(e->parse(Int, e), l), f)

x_length = length(grid[1])
y_length = length(grid)

# Part 1
pos = (1, 1)
step = Dict("x" => 3, "y" => 1)
trees = 0

while pos[2] < y_length
    global pos = (pos[1] + step["x"], pos[2] + step["y"])

    if grid[pos[2]][mod1(pos[1], x_length)] == 1
        global trees += 1
    end
end

println("Part 1:")
println(trees)

# Part 2
trees_list = Int[]
for step ∈ [Dict("x" => 1, "y" => 1), Dict("x" => 3, "y" => 1), Dict("x" => 5, "y" => 1), Dict("x" => 7, "y" => 1), Dict("x" => 1, "y" => 2)]
    local pos = (1, 1)
    local trees = 0

    while pos[2] < y_length
        pos = (pos[1] + step["x"], pos[2] + step["y"])

        if grid[pos[2]][mod1(pos[1], x_length)] == 1
            trees += 1
        end
    end

    push!(trees_list, trees)
end

println("Part 2:")
println(prod(trees_list))
