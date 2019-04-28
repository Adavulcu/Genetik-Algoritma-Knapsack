#14253024 ABDULLAH DAVULCU

include("GetData.jl")
include("InitPopulation.jl")
include("CalculateFitnes.jl")
include("ParentSelect.jl")
include("ReCombine.jl");
include("Display.jl")
include("CreatePlots.jl")


test1Path="tests/test1.txt"
test2Path="tests/test2.txt"
test3Path="tests/test3.txt"
test4Path="tests/test4.txt"
test5Path="tests/test5.txt"

# C => Kapasite
# val =>değer vektörü
# W => ağırlık vektörü
# M =>Populasyon büyüklüğü
# MutationChance => mutasyon şansı
# İteration => max iterasyon (Nesil sayısı)
# k => turnuva seçimindeki seçilecek birey sayısı
# randomNumberList => rastgele sayı listesi
# m => vektör uzunluğu




function StartUp()
 tic();
testName="Test Sonucu"
display("Lütfen Dosya yolunu giriniz");
path=readline();
C,val,W,M,MutationChance,Iteration,k,randomNumberList=GetTestData(path);
n,m=size(val);
RndIndex=1;
pop,RndIndex=InitPop(M,randomNumberList,m,RndIndex);

worstFitnesList=zeros(Int64,Iteration,1);
bestFitnesList=zeros(Int64,Iteration,1);
averageFitnesList=zeros(Int64,Iteration,1);




#fitnesList=GetFitnes(pop,W,val,C,M);
for i=1:Iteration
    worstFitnesList[i,1]=GetWorstFitnes(pop,W,val,C);
    bestFitnesList[i,1]=GetBestFitnes(pop,W,val,C);
    averageFitnesList[i,1]=GetAverageFitnes(pop,W,val,C);
    newPop,RndIndex=GetParents(pop,k,randomNumberList,RndIndex,W,val,C)

    pop,RndIndex=ReCombineParents(newPop,randomNumberList,RndIndex,MutationChance,val,C,W,pop);

    #display("Genaration $i")
    #DisplayPop(pop,val,W,C);
end
display("Final  Population")
DisplayPop(pop,val,W,C);
time=toq();
display("Hesaplama Süresi = $time")

DrawPlot(worstFitnesList,averageFitnesList,bestFitnesList,testName)
return;
end


StartUp();
