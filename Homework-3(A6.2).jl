function read_input()
    print("Enter positive integer n: ")
    input_number = readline()
    n = tryparse(Int, input_number)
    if n === nothing
        println("Invalid input for n. Please enter a valid integer.")
        return
    end

    print("Enter positive integer m: ")
    input_number = readline()
    m = tryparse(Int, input_number)
    if m === nothing
        println("Invalid input for m. Please enter a valid integer.")
        return
    end

    print("Enter $m-vector t: ")
    input_vector = readline()
    t = [parse(Float64, element) for element in split(input_vector)]
    if length(t) !== m
        println("Invalid input for t. Please enter only $m inputs.")
        return
    end

    return n, m, t
end

function getVandermondeMatrix(n::Int, m::Int, t::Vector{Float64})
    matrix = zeros(m, n)

    for i in 1:m
        for j in 1:n
            matrix[i, j] = t[i]^(j-1)
        end
    end

    return matrix
end

n, m, t = read_input()
vandermonde_matrix = getVandermondeMatrix(n, m, t)
println("VandermondeMatrix: ", vandermonde_matrix)
