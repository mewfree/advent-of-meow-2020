input = open(f->read(f, String), "input") |> f->split(f, "\n")

function parse_input(pw)
    pw_split = pw |> split
    range_split = split(pw_split[1], "-") |> lst->(map(s->parse(Int, s), lst))

    return Dict(
         "range" => range(range_split[1], range_split[2], step=1),
         "letter" => pw_split[2] |> first,
         "text" => pw_split[3]
    )
end

passwords = map(pw->parse_input(pw), input)

function is_valid(pw)
    letter_count = count(i->(i==pw["letter"]), pw["text"])
    if letter_count in pw["range"]
        return true
    else
        return false
    end
end

# how many are valid?
result = count(pw->(pw |> is_valid), passwords)
println(result)
