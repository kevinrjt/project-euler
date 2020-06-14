# https://projecteuler.net/problem=1

function sum_multiples_of_3_5(n)
    sum = 0
    for i = 1:(n-1)÷3
        sum += 3 * i
    end
    for i = 1:(n-1)÷5
        if i % 3 == 0 continue end
        sum += 5 * i
    end
    return sum
end

println(sum_multiples_of_3_5(1000))
