# https://projecteuler.net/problem=8

function read_input(file)
    input = []
    for line in eachline(file)
        append!(input, map(x -> x - '0', collect(line)))
    end
    return input
end

function largest_product(a, k)
    max_product = 0
    n = length(a)
    s = 0 # index of last zero
    while s + k <= n
        product = 1
        iszero = false
        for i in s+1:s+k
            if a[i] == 0
                s = i
                iszero = true
                break
            end
            product *= a[i]
        end
        if iszero continue end
        max_product = max(max_product, product)
        for i in s+k+1:n
            if a[i] == 0
                s = i
                iszero = true
                break
            end
            product = product * a[i] ÷ a[i-k]
            max_product = max(max_product, product)
        end
        if iszero continue end
        return max_product
    end
    return max_product
end

input = read_input("input.txt")

println(largest_product(input, 13))
