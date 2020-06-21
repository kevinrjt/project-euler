# https://projecteuler.net/problem=4

function reverse(n)
    r = 0
    while n > 0
        r = 10r + n % 10
        n ÷= 10
    end
    return r
end

function is_palindrome(n)
    return n == reverse(n)
end

# Solution 1
function largest_palindrome()
    max_palindrome = 0
    for x = 999:-1:100
        for y = 999:-1:x
            n = x * y
            if n <= max_palindrome break end
            if is_palindrome(n)
                max_palindrome = n
            end
        end
    end
    return max_palindrome
end

println(largest_palindrome())

# Solution 2
function largest_palindrome()
    # max_palindrome is 6 digits since 111111 == 143×777, and then can be divided by 11.
    max_palindrome = 0
    for x = 999:-1:100
        y1, dy = if x % 11 == 0 (999, 1) else (990, 11) end
        for y = y1:-dy:x
            n = x * y
            if n <= max_palindrome break end
            if is_palindrome(n)
                max_palindrome = n
            end
        end
    end
    return max_palindrome
end

println(largest_palindrome())
