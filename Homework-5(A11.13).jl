using Plots
using Polynomials

A = [1 0 0 0; 0 1 0 0; 1 1 1 1; 0 1 2 3]
b = [0, 1, 0, 1]

c = A \ b

p(x) = c[1] + c[2] * x + c[3] * x^2 + c[4] * x^3

x_range = -0.1:0.01:1.1

plot(x_range, p.(x_range), label="p(x)", xlabel="x", ylabel="p(x)", title="Plot of p(x)", left_margin=3Plots.mm)
hline!([0], color=:black, lw=0.5, label="X-axis")
savefig("polynomial_plot.png")
