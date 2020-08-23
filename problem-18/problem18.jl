# https://projecteuler.net/problem=18

function read_input(file)
    return [ map(s -> parse(Int, s), split(line)) for line in eachline(file) ]
end

function max_path_sum(A)
    for i=length(A)-1:-1:1
        for j=1:length(A[i])
            A[i][j] += max(A[i+1][j], A[i+1][j+1])
        end
    end
    return A[1][1]
end

input = read_input("input.txt")
@time answer = max_path_sum(input)

println(answer)
