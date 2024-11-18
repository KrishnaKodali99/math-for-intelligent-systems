using LinearAlgebra

function getEquationNorm(x)
    return norm((A * x) - b)
end

A = rand(20, 20)
b = rand(20)

Q, R = qr(A)

print(A == Q * R, "\n")

x1 = A \ b
x2 = inv(A) * b
x3 = R \ (Q' * b)

print(getEquationNorm(x1), "\n")
print(getEquationNorm(x2), "\n")
print(getEquationNorm(x3), "\n")
