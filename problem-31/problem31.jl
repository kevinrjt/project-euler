# https://projecteuler.net/problem=31

# Solution 1
function coin_sums(coins, n)
    m = length(coins)
    dp = zeros(Int64, m, n)
    dp[1,:] = ones(n)
    for i=2:m
        for j=1:n
            for k=0:coins[i]:j
                dp[i,j] += (if k == j 1 else dp[i-1, j-k] end)
            end
        end
    end
    return dp[m,n]
end

coins = [1, 2, 5, 10, 20, 50, 100, 200]
@time answer = coin_sums(coins, 200)

println(answer)

# Solution 2
function coin_sums(coins, n)
    m = length(coins)
    dp = ones(Int64, n)
    for i=2:m
        for j=coins[i]:n
            dp[j] += (if j == coins[i] 1 else dp[j-coins[i]] end)
        end
    end
    return dp[n]
end

coins = [1, 2, 5, 10, 20, 50, 100, 200]
@time answer = coin_sums(coins, 200)

println(answer)
