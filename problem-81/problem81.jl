# https://projecteuler.net/problem=81

function read_input(file)
    input = []
    for line in eachline(file)
        row = map(s -> parse(Int, s), split(line, ','))
        push!(input, reshape(row, 1, :))
    end
    return vcat(input...)
end

function min_path_sum(M)
    m, n = size(M)
    s = zeros(Int, n)
    s[1] = M[1,1]
    for j = 2:n
        s[j] = M[1,j] + s[j-1]
    end
    for i=2:m
        s[1] += M[i,1]
        for j = 2:n
            s[j] = M[i,j] + min(s[j-1], s[j])
        end
    end
    return s[n]
end

input = read_input("p081_matrix.txt")
@time answer = min_path_sum(input)

println(answer)
