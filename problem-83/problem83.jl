# https://projecteuler.net/problem=83

# import Pkg
# Pkg.add("DataStructures")

using DataStructures

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
    dist = Dict()
    pq = PriorityQueue()
    pq[(1,1)] = M[1,1]
    function add(i, j, d)
        if (i,j) in keys(dist) return end
        pq[(i,j)] = if (i,j) in keys(pq) min(pq[(i,j)], d + M[i,j]) else d + M[i,j] end
    end
    while !isempty(pq)
        (i, j), d = peek(pq)
        dequeue!(pq)
        dist[(i,j)] = d
        if i == m && j == n return d end
        if i > 1 add(i-1, j, d) end
        if i < m add(i+1, j, d) end
        if j > 1 add(i, j-1, d) end
        if j < n add(i, j+1, d) end
    end
    return dist[(m,n)]
end

input = read_input("p083_matrix.txt")
@time answer = min_path_sum(input)

println(answer)
