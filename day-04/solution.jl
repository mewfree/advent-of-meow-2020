input = open(f->read(f, String), "input") |> f->split(f, "\n\n") |> f->map(l->replace(l, "\n" => " "), f)

function parse_input(line)
    local passport = Dict()
    split(line, " ") |> pairs->map(pair->push!(passport, split(pair, ":")[1] => split(pair, ":")[2]), pairs)
    return passport
end

passports = map(line->parse_input(line), input)

required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

# Part 1
result = count(passport->required_fields ⊆ passport |> keys, passports)
println("Part 1:")
println(result)

# Part 2
function passport_valid(passport)
    byr = parse(Int, passport["byr"])
    iyr = parse(Int, passport["iyr"])
    eyr = parse(Int, passport["eyr"])
    hgt_match = match(r"([0-9]*)(cm|in)", passport["hgt"])
    hcl_match = match(r"(#){1}([a-f0-9]){6}", passport["hcl"])
    pid_match = match(r"[0-9]{9}", passport["pid"])

    if hgt_match === nothing
        return false
    else
        height, unit = match(r"([0-9]*)(cm|in)", passport["hgt"]).captures
        if unit == "cm"
            if parse(Int, height) ∉ 150:193
                return false
            end
        elseif unit == "in"
            if parse(Int, height) ∉ 59:76
                return false
            end
        else
            return false
        end
    end

    if hcl_match === nothing
        return false
    end

    if pid_match === nothing
        return false
    end

    if (byr ∈ 1920:2002
    && iyr ∈ 2010:2020
    && eyr ∈ 2020:2030
    && hcl_match.match == passport["hcl"]
    && passport["ecl"] ∈ ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
    && pid_match.match == passport["pid"])
        return true
    else
        return false
    end
end

result = filter(passport->required_fields ⊆ passport |> keys, passports) |> passports->count(passport->passport_valid(passport), passports)
println("Part 2:")
println(result)
