using Distributions, StatsPlots

p = plot(Normal(0,1), color = "#C1A875", fill=(0, .25,"#C1A875"))
# vline!([18], color = "#C1A875", linewidth = 5)

plot!(Normal(0,3), color = "#592C88", fill=(0, .25,"#592C88"), grid = false, legend = false, showaxis = false, ticks = false)
# vline!([0], color = "#592C88", linewidth = 5)

savefig(p, "measures-of-spread.png")
