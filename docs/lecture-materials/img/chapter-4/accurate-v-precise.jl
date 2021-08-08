
using StatsPlots, Distributions
plot([100], seriestype=:vline, color = 3, 
    linestyle = :dot, linewidth = 2, 
    label = "True Value = 100 mg/L", 
    framestyle = :box, legend = :topleft,
    size = (650, 400), dpi = 500
)
xlims!(70, 120); ylims!(0, 0.5);
xlabel!("[Pb] (mg/L)"); ylabel!("Fraction of Measurements")
savefig("lectures/plots/accurate-v-precise_1.png")
plot!(Normal(100,1), fill=(0, .25), color = 3, framestyle = :box, label = "Accurate & precise")
savefig("lectures/plots/accurate-v-precise_2.png")
plot!(Normal(100,5), fill=(0, .25), color = 1, label = "Accurate, not precise")
savefig("lectures/plots/accurate-v-precise_3.png")
plot!(Normal(85,4), fill=(0, .25), color = 2, framestyle = :box, label = "Not accurate, not precise")
savefig("lectures/plots/accurate-v-precise_4.png")
plot!(Normal(85,1.2), fill=(0, .25), color = 4, framestyle = :box, label = "Precise, not accurate")
savefig("lectures/plots/accurate-v-precise_5.png")