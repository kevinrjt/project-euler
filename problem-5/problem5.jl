# https://projecteuler.net/problem=5

function gcd(m, n)
    while n != 0
        m, n = n, m % n
    end
    return m
end

# Solution 1
function smallest_multiple(n)
    multiple = 1
    for x = 2:n
        multiple *= x ÷ gcd(multiple, x)
    end
    return multiple
end

println(smallest_multiple(20))

# Solution 2
function smallest_multiple(n)
    primes = [2 3 5 7 11 13 17 19]
    limit = floor(Int, sqrt(n))
    multiple = 1
    for p = primes
        if p > n break end
        a = if p <= limit floor(Int, log(n) / log(p)) else 1 end
        multiple *= p ^ a
    end
    return multiple
end

println(smallest_multiple(20))
