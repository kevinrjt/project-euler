# https://projecteuler.net/problem=13

function read_input(file)
    input = []
    for line in eachline(file)
        row = map(x -> x - '0', collect(line))
        push!(input, reshape(row, 1, :))
    end
    return vcat(input...)
end

function large_sum(A)
    digits = []
    _, n = size(A)
    carry = 0
    for j in n:-1:1
        carry, d = divrem(sum(A[:, j]) + carry, 10)
        append!(digits, d)
    end
    digits_str = join(reverse(digits))
    return ifelse(carry == 0, digits_str, string(carry, digits_str))
end

input = read_input("input.txt")
@time answer = large_sum(input)[1:10]

println(answer)
