using DSP
using Plots

include("channel_equalization_data.jl")

function stem_plot(points, title, show_xaxis=true)
    signal_plot = plot(points, st=:stem, legend=false, title=title, xlabel="Index", left_margin=5Plots.mm)
    scatter!(points, marker=:none, linecolor=:black)

    if (show_xaxis)
        hline!([0], color=:black, lw=0.5, label="X-axis")
    end

    return signal_plot
end

#Plot c, h, c * h
conv_ch = conv(c, h)

plot1_1 = stem_plot(c, "Channel (c)")
plot1_2 = stem_plot(h, "Equalizer (h)")
plot1_3 = stem_plot(conv_ch, "Channel Impulse Response (h * c)")

plot(plot1_1, plot1_2, plot1_3, layout=(3, 1), size=(600, 800))
savefig("plots/ch-plot.png")

#Plot s, y, y_tilde
y = conv(c, s)
y_tilde = conv(h, y)

plot2_1 = stem_plot(s[1:100], "Message (s)", false)
plot2_2 = stem_plot(y[1:100], "Output Signal (c * s)")
plot2_3 = stem_plot(y_tilde[1:100], "Equalized Output Signal(h * y)")

plot(plot2_1, plot2_2, plot2_3, layout=(3, 1), size=(600, 800))
savefig("plots/syy_t-plot.png")

#Plot scap, scap_eq
scap = 1 * (y .> 0.5)
scap_eq = 1 * (y_tilde .> 0.5)

plot3_1 = stem_plot(scap[1:100], "Message (s^)", false)
plot3_2 = stem_plot(scap_eq[1:100], "Equalized Message (s^_eq)", false)

plot(plot3_1, plot3_2, layout=(2, 1), size=(600, 800))
savefig("plots/scap-plot.png")

#Computer BER w.r.t scap, scap_eq
count_scap = 0
for index in 1:1000
    global count_scap
    if s[index] != scap[index]
        count_scap += 1
    end
end
BER_scap = count_scap / (length(scap))

count_scap_eq = 0
for index in 1:1000
    global count_scap_eq
    if scap_eq[index] != scap_eq[index]
        count_scap_eq += 1
    end
end
BER_scap_eq = count_scap_eq / (length(scap_eq))

print("BER for s^: ", BER_scap, "\n")
print("BER for s^_eq: ", BER_scap_eq, "\n")
