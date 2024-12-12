using DSP
using Plots

length_u = 50
u = rand([-1, 1], length_u)

c = [1, 0.7, -0.3]
h = [0.9, -0.5, 0.5, -0.4, 0.3, -0.3, 0.2, -0.1]

y = conv(c, u)
z = conv(h, y)

x = 1:length(c)+length(h)+length_u-2

scatter(x, z, marker=:none, linecolor=:black, ylim=(-1.5, 1.5))
for (xi, zi) in zip(x, z)
    plot!([xi, xi], [0, zi], color=:black, lw=1, label="", alpha=0.5)
end

# Draw horizontal line for x-axis
hline!([0], color=:black, lw=2, label="X-axis") 
savefig("signal_plot.png")
