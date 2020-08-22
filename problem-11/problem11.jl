# https://projecteuler.net/problem=11

function read_input(file)
    input = []
    for line in eachline(file)
        row = map(s -> parse(Int, s), split(line))
        push!(input, reshape(row, 1, :))
    end
    return vcat(input...)
end

function largest_product(A, k)
    max_product = 0
    m, n = size(A)
    for i in 1:m
        for j in 1:n
            if j + k - 1 <= n
                max_product = max(max_product, prod(A[i,j:j+k-1]))
                if i + k - 1 <= m
                    max_product = max(max_product, prod([ A[i+s,j+s] for s=0:k-1 ]))
                end
            end
            if i + k - 1 <= m
                max_product = max(max_product, prod(A[i:i+k-1,j]))
                if j - k + 1 >= 1
                    max_product = max(max_product, prod([ A[i+s,j-s] for s=0:k-1 ]))
                end
            end
        end
    end
    return max_product
end

input = read_input("input.txt")

println(largest_product(input, 4))
