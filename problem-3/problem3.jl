# https://projecteuler.net/problem=3

# Solution 1
function largest_prime_factor(n)
    if n <= 2 return n end
    if n % 2 == 0 return largest_prime_factor(n ÷ 2) end
    for p = 3:2:isqrt(n)
        if n % p == 0 return largest_prime_factor(n ÷ p) end
    end
    return n
end

println(largest_prime_factor(600851475143))

# Solution 2
function largest_prime_factor(n)
    largest_p = if n % 2 == 0 2 else 1 end
    while n % 2 == 0
        n ÷= 2 
    end
    for p = 3:2:isqrt(n)
        if n % p == 0 largest_p = p end
        while n % p == 0
            n ÷= p
        end
    end
    return if n == 1 largest_p else n end
end

println(largest_prime_factor(600851475143))
