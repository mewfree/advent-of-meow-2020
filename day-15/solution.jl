input = open(f->read(f, String), "input") |> chomp |> f->split(f, ",")

function play(n, input)
    if n ∉ input[1:end-1]
        push!(input, "0")
    elseif n ∈ input[1:end-1]
        index_last = findlast(x -> x == last(input), input)
        index_prev = findprev(x -> x == last(input), input, index_last - 1)
        push!(input, string(index_last - index_prev))
    end

    return input
end

while length(input) < 2020
    global input = play(last(input), input)
end

println(input[end])
