input = open(f->read(f, String), "input") |> f->split(f, "\n") |> a->parse.(Int, a)

previous_jolt = 0

differences = []

for adapter in input |> sort
    diff = adapter - previous_jolt
    push!(differences, diff)
    global previous_jolt = adapter
end

push!(differences, 3)

result = count(i->i==1, differences) * count(i->i==3, differences)
println(result)
