using DSP
using Plots

function stem_plot(points, title, show_xaxis=true)
    signal_plot = plot(points, st=:stem, legend=false, title=title, xlabel="Time", left_margin=5Plots.mm)
    scatter!(points, marker=:none, linecolor=:black)

    if (show_xaxis)
        hline!([0], color=:black, lw=0.5, label="X-axis")
    end

    return signal_plot
end

length_u = 50
u = rand([-1, 1], length_u)

c = [1, 0.7, -0.3]
h = [0.9, -0.5, 0.5, -0.4, 0.3, -0.3, 0.2, -0.1]

y = conv(c, u)
z = conv(h, y)

x = 1:length(c)+length(h)+length_u-2

plot_1 = stem_plot(u, "Signal(U)")
plot_2 = stem_plot(y, "Received Signal(Y)")
plot_3 = stem_plot(z, "Equalized Signal(Z)")

plot(plot_1, plot_2, plot_3, layout=(3, 1), size=(600, 800))
savefig("plots/signal_plot.png")
