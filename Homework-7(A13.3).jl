using LinearAlgebra

include("files/time_series_data.jl");

function mean_square_error(x_true, x_pred)
    return norm(x_true - x_pred, 2)^2 / length(x_true)
end

results = []
for M in 2:12
    A_train = toeplitz(x_train, M)[M:end-M, :]
    b_train = x_train[M+1:end]

    A_test = toeplitz(x_test, M)[M:end-M, :]
    b_test = x_test[M+1:end]

    β_train = (pinv(A_train' * A_train) * (A_train') * b_train)

    x_pred_train = A_train * β_train
    J_train = mean_square_error(x_pred_train, b_train)

    x_pred_test = A_test * β_train
    J_test = mean_square_error(b_test, x_pred_test)

    push!(results, (M, J_train, J_test))
end

for result in results
    println("M - $(result[1]) | J_train - $(result[2]) |  J_test - $(result[3])")
end

x_pred_train_1 = x_train[1:end-1]
x_pred_test_1 = x_test[1:end-1]
J_train_1 = mean_square_error(x_train[2:end], x_pred_train_1)
J_test_1 = mean_square_error(x_test[2:end], x_pred_test_1)

x_pred_train_2 = x_train[2:end-1] + (x_train[2:end-1] - x_train[1:end-2])
x_pred_test_2 = x_test[2:end-1] + (x_test[2:end-1] - x_test[1:end-2])
J_train_2 = mean_square_error(x_train[3:end], x_pred_train_2)
J_test_2 = mean_square_error(x_test[3:end], x_pred_test_2)

println("Simple Predictor 1: J_train = $J_train_1, J_test = $J_test_1")
println("Simple Predictor 2: J_train = $J_train_2, J_test = $J_test_2")
println("\nBetter choice of M = 6")
