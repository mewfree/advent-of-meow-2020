input = open(f->read(f, String), "input") |> f->split(f, "\n") |> f->(map(l->(split(l)[1], parse(Int, split(l)[2])), f))

acc_value = 0

executed_instructions = []

function execute_instruction_at(index)
    instruction = input[index]

    if index ∈ executed_instructions
        return acc_value
    end

    push!(executed_instructions, index)

    if instruction[1] == "acc"
        global acc_value += instruction[2]
        execute_instruction_at(index + 1)
    elseif instruction[1] == "jmp"
        execute_instruction_at(index + instruction[2])
    else
        execute_instruction_at(index + 1)
    end
end

println("Part 1:")
println(execute_instruction_at(1))
