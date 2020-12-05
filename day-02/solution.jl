input = open(f->read(f, String), "input") |> f->split(f, "\n")

function parse_input(pw)
    pw_split = pw |> split
    range_split = split(pw_split[1], "-") |> lst->(map(s->parse(Int, s), lst))

    return Dict(
         "range" => range_split[1]:range_split[2],
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

# how many are valid? part 1
result = count(pw->(pw |> is_valid), passwords)
println("Part 1:")
println(result)

function is_valid2(pw)
    pos_1 = pw["range"] |> first
    pos_2 = pw["range"] |> last

    if (pw["text"][pos_1] == pw["letter"]) ⊻ (pw["text"][pos_2] == pw["letter"])
        return true
    else
        return false
    end
end

# how many are valid? part 2
result = count(pw->(pw |> is_valid2), passwords)
println("Part 2:")
println(result)
