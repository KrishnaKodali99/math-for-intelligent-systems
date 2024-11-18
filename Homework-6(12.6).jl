using DSP
using Plots
using LinearAlgebra

function getToeplitz(c)
    rs = 2 * length(c) - 1
    cs = length(c)

    T = zeros(rs, cs)
    for i = 1:rs
        for j = 1:cs
            if (i - j + 1) in 1:cs
                T[i, j] = c[i-j+1]
            end
        end
    end

    return T
end

function stem_plot(points, title, show_xaxis=true)
    signal_plot = plot(points, st=:stem, legend=false, title=title, xlabel="Index", left_margin=5Plots.mm)
    scatter!(points, marker=:none, linecolor=:black)

    if (show_xaxis)
        hline!([0], color=:black, lw=0.5, label="X-axis")
    end

    return signal_plot
end

c = [1; 0.7; -0.3; -0.1; 0.05]
Tc = getToeplitz(c)

e1 = zeros(2 * length(c) - 1)
e1[1] = 1

h = pinv(Tc) * e1

plot1_1 = stem_plot(c, "Channel (c)")
plot1_2 = stem_plot(h, "Equalizer (h)")
plot1_3 = stem_plot(conv(h, c), "Channel Impulse Response (h * c)")
plot(plot1_1, plot1_2, plot1_3, layout=(3, 1), size=(600, 800))
savefig("ch-plot.png")
