grid = open(f->read(f, String), "input") |> f->replace(f, ('.', '#') => s->s == '.' ? 0 : 1) |> f->split(f, "\n") |> f->map(l->split(l, ""), f) |> f->map(l->map(e->parse(Int, e), l), f)

pos = (1, 1)
x = 3
y = 1
trees = 0

x_length = length(grid[1])
y_length = length(grid)

while pos[2] < y_length
    global pos = (pos[1] + x, pos[2] + y)

    if grid[pos[2]][mod1(pos[1], x_length)] == 1
        global trees += 1
    end
end

println(trees)
