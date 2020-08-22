# https://projecteuler.net/problem=15

# Solution 1
function lattice_paths(m, n)
    a = ones(Int64, n+1)
    for i=2:m+1
        for j=2:n+1
            a[j] += a[j-1]
        end
    end
    return a[n+1]
end

@time answer = lattice_paths(20, 20)

println(answer)

# Solution 2
function lattice_paths(m, n)
    return binomial(m + n, m)
end

@time answer = lattice_paths(20, 20)

println(answer)

# Solution 3
function lattice_paths(m, n)
    result = Int128(1)
    for i=1:m
        result = result * (n + i) ÷ i
    end
    return result
end

@time answer = lattice_paths(20, 20)

println(answer)
