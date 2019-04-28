#14253024 ABDULLAH DAVULCU
using PyPlot
function DrawPlot(worstFitnesList,averageFitnesList,bestFitnesList,testName)
    title(testName)
    plot(worstFitnesList,label="min", color="blue", linewidth=2.0,markersize=6, marker=">",linestyle = "--")
    plot(averageFitnesList,label="avg", color="red", linewidth=2.0,markersize=6, marker="x",linestyle = "--")
    plot(bestFitnesList,label="max", color="brown", linewidth=2.0,markersize=6, marker="o",linestyle = "--")

    xlabel("iterasyon");
    ylabel("fitness");
    legend(loc = "lower right", fontsize=15);
end
