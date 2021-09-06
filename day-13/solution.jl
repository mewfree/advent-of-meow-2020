input = open(f->read(f, String), "input") |> f->split(f, "\n")

# first line is earliest timestamp you can leave at
timestamp = input[1] |> i->parse(Int64, i)

# second line is list of buses in service, x can be ignored
bus_ids = input[2] |> i->split(i, ",") |> i->filter(x -> x != "x", i) |> i->parse.(Int64, i)

# what's the earliest bus?
function calculate_schedule(bus_id, timestamp)
    times = [bus_id]
    while last(times) <= timestamp
        append!(times, last(times) + bus_id)
    end
    return times
end

schedules = calculate_schedule.(bus_ids, timestamp)

earliest = [(first(x), last(x)) for x = schedules] |> a->sort(a, by = x -> x[2]) |> first

# how many extra minutes do you have to wait?
minutes = earliest[2] - timestamp

# final calculation
println("Part 1:")
println(minutes * earliest[1])
