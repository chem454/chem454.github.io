using Distributions, StatsPlots
p = histogram(quantile.(Normal(0, 1), range(1/1000, 1-1/1000, length = 1000)), normalize = :pdf, color = :navajowhite4, label = "Histogram of Samples")
plot!(Normal(0, 1), color = "#C1A875", fill=(0, 0.5,"#C1A875"), label = "Distribution of Population", grid = false)
xlabel!("Value"); ylabel!("Probability Density")
savefig(p, "measures-of-spread.png")
