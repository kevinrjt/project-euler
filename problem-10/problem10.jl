# https://projecteuler.net/problem=10

# Solution 1
function primes_below(n)
    primes = []
    is_prime = trues(n)
    limit = isqrt(n-1)
    for i in 2:n-1
        if is_prime[i]
            append!(primes, i)
            if i > limit continue end
            for j in i*i:i:n-1
                is_prime[j] = false
            end
        end
    end
    return primes
end

@time answer = sum(primes_below(2000000))

println(answer)

# Solution 2: saves half memory
function primes_below(n)
    primes = [2]
    m = (n - 2) ÷ 2
    is_prime = trues(m)
    limit = (isqrt(n-1) - 1) ÷ 2
    for k in 1:m
        if is_prime[k]
            append!(primes, 2k + 1)
            if k > limit continue end
            for j in 2k*(k+1):2k+1:m
                is_prime[j] = false
            end
        end
    end
    return primes
end

@time answer = sum(primes_below(2000000))

println(answer)
