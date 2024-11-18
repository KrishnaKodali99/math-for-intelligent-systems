using LinearAlgebra
using Statistics

include("files/iris_flower_data.jl")
include("files/iris_multiclass_helpers.jl")

X_train = X'[1:100, :]
y_train = y[1:100]
X_test = X'[101:150, :]
y_test = y[101:150]

classifiers_data = []
error_train = Float64[]
error_test = Float64[]

for k in 1:3
    y_train_binary = 2 .* (y_train .== k) .- 1
    y_test_binary = 2 .* (y_test .== k) .- 1
    
    theta = X_train \ y_train_binary
    push!(classifiers_data, theta)
    
    y_train_pred = sign.(X_train * theta)
    y_test_pred = sign.(X_test * theta)
    
    push!(error_train, mean(y_train_pred .!= y_train_binary))
    push!(error_test, mean(y_test_pred .!= y_test_binary))
end

println("Training error rates: ", error_train)
println("Testing error rates: ", error_test)

A_train = hcat(X_train * classifiers_data[1], X_train * classifiers_data[2], X_train * classifiers_data[3])
y_train_pred = argmax_by_row(A_train)

A_test = hcat(X_test * classifiers_data[1], X_test * classifiers_data[2], X_test * classifiers_data[3])
y_test_pred = argmax_by_row(A_test)

C_train = confusion_matrix(y_train_pred, y_train)
C_test = confusion_matrix(y_test_pred, y_test)

println("Confusion matrix for training data:")
display(C_train)
println("Confusion matrix for test data:")
display(C_test)
