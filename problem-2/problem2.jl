# https://projecteuler.net/problem=2

# Solution 1
function sum_even_fibonacci_nums(limit)
    sum = 0
    xi_1, xi = 1, 1
    while xi <= limit
        if xi % 2 == 0 sum += xi end
        xi_1, xi = xi, xi_1 + xi
    end
    return sum
end

println(sum_even_fibonacci_nums(4000000))

# Solution 2
function sum_even_fibonacci_nums(limit)
    sum = 0
    xi_1, xi = 0, 2
    while xi <= limit
        sum += xi
        xi_1, xi = xi, xi_1 + 4 * xi
    end
    return sum
end

println(sum_even_fibonacci_nums(4000000))
