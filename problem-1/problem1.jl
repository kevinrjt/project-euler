# https://projecteuler.net/problem=1

# Solution 1
function sum_multiples_of_3_5(limit)
    sum = 0
    for i in 1:(limit-1)÷3
        sum += 3 * i
    end
    for i in 1:(limit-1)÷5
        if i % 3 == 0 continue end
        sum += 5 * i
    end
    return sum
end

println(sum_multiples_of_3_5(1000))

# Solution 2
function sum_divisible_by(p)
    k = 999 ÷ p
    return p * k * (k + 1) ÷ 2
end

println(sum_divisible_by(3) + sum_divisible_by(5) - sum_divisible_by(15))
