using LinearAlgebra

function getScaledDelta()
    delta = rand(10) .* rand([-1, 1])
    delta = delta / norm(delta) * 0.1
    
    return delta
end

A = rand(20, 10)
b = rand(20)

x1 = A \ b
x2 = inv(A'A) * A' * b
x3 = pinv(A) * b

print("Distance b/w x1 and x2: ", norm(x1 - x2), "\n")
print("Distance b/w x2 and x3: ", norm(x2 - x3), "\n")
print("Distance b/w x3 and x1: ", norm(x3 - x1), "\n")

for i = 1:10
    δ = getScaledDelta()
    norm_ds = norm((A * (x1 + δ)) - b) ^ 2
    norm_rs = norm((A * x1) - b) ^ 2
    print("Iteration-", i, " - Difference of norm squares: ", norm_ds - norm_rs, "\n")
end
