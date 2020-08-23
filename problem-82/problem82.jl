# https://projecteuler.net/problem=82

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
    S = similar(M)
    S[:,1] = copy(M[:,1])
    for j = 2:n
        S[:,j] = M[:,j] + S[:,j-1]
        for i=2:m
            S[i,j] = min(S[i,j], M[i,j] + S[i-1,j])
        end
        for i=m-1:-1:1
            S[i,j] = min(S[i,j], M[i,j] + S[i+1,j])
        end
    end
    return minimum(S[:,n])
end

input = read_input("p082_matrix.txt")
@time answer = min_path_sum(input)

println(answer)
