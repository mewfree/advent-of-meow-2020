input = open(f->read(f, String), "input") |> chomp |> f->split(f, "\n\n")

ranges =
    input[1] |>
    lf->split(lf, "\n") |>
    lf->map(f->match(r": (\d+)-(\d+) or (\d+)-(\d+)", f).captures |>
    m->parse.(Int, m) |>
    m->[m[1]:m[2], m[3]:m[4]], lf) |>
    Iterators.flatten |>
    collect

my_ticket =
    input[2] |>
    yt->split(yt, "\n")[2] |>
    t->split(t, ",") |>
    n->parse.(Int, n)

nearby_tickets =
    input[3] |>
    nt->split(nt, "\n") |>
    nt->deleteat!(nt, 1) |>
    nt->map(t->split(t, ",") |>
    n->parse.(Int, n), nt)

function validate_field(field, ranges)
    if 0 ∉ map(range->field ∉ range ? field : 0, ranges)
        field
    else
        0
    end
end

errors = 0
for ticket in nearby_tickets
    for ticket_field in ticket
        global errors += validate_field(ticket_field, ranges)
    end
end

println(errors)
