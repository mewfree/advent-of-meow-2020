passports = open(f->read(f, String), "input") |> f->split(f, "\n\n") |> f->map(l->replace(l, "\n" => " "), f) |> f->map(l->split(l, " "), f) |> f->map(l->map(e->split(e, ":")[1], l), f)

required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

result = count(passport->required_fields ⊆ passport, passports)
println(result)
