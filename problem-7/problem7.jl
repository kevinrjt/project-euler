# https://projecteuler.net/problem=7

function is_prime(primes, candidate)
    limit = floor(Int, sqrt(candidate))
    for p in primes
        if p > limit return true end
        if candidate % p == 0 return false end
    end
    return true
end

function nth_prime(n)
    if n == 1 return 2 end
    primes = []
    candidate = 3
    count = 1
    while true
        if is_prime(primes, candidate)
            count += 1
            if count == n return candidate end
            append!(primes, candidate)
        end
        candidate += 2
    end
    return 0
end

println(nth_prime(10001))
