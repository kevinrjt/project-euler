# https://projecteuler.net/problem=9

# Solution 1

# a^2 + b^2 = c^2 && a + b + c = s => b = s - s^2 / 2(s - a), c = s^2 / 2(s - a) - a
# a, b, c > 0 => 0 < a < s/2

function find_a(s)
    for a in 1:(s-1)÷2
        if s^2 % 2(s - a) == 0
            return a
        end
    end
    return 0
end

function pythagorean_triplet(s)
    a = find_a(s)
    b = s - s^2 ÷ 2(s - a)
    c = s - a - b
    return a, b, c
end

a, b, c = pythagorean_triplet(UInt128(10^3))
println(a, " ", b, " ", c, " ", a * b * c)

# Solution 2
function pythagorean_triplet(s)
    s2 = s ÷ 2
    mlimit = ceil(Int, √s2) - 1
    for m in 2:mlimit
        if s2 % m == 0
            sm = s2 ÷ m
            while sm % 2 == 0
                sm ÷= 2
            end
            k = if m % 2 == 0 m + 1 else m + 2 end
            while k < 2m && k <= sm
                if sm % k == 0 && gcd(k, m) == 1
                    d = s2 ÷ (k * m)
                    n = k - m
                    a = (m^2 - n^2) * d
                    b = 2m * n * d
                    c = (m^2 + n^2) * d
                    return a, b, c
                end
                k += 2
            end
        end
    end
    return nothing
end

a, b, c = pythagorean_triplet(UInt128(10^3))
println(a, " ", b, " ", c, " ", a * b * c)
