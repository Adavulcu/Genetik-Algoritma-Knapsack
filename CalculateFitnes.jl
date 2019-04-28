#14253024 ABDULLAH DAVULCU

function GetFitnes(pop,W,val,C,M)

fitneses=zeros(Int64,M,1);

for i=1:M
    f=sum(pop[i,:]'.*W);
    if (f>C)
    fitneses[i,1]=0;
    else
    fitneses[i,1]=sum(pop[i,:]'.*val);
    end

end

    return fitneses ;

end

function GetBestFitnes(pop,W,val,C)
    N,M=size(pop);

    bestFtines=0;
    if (sum(pop[1,:]'.*W)>C)
    bestFitnes=0;
    else
    bestFitnes=sum(pop[1,:]'.*val);
    end
    for i=2:N
        f=0;
        if (sum(pop[i,:]'.*W)>C)
        f=0;
        else
        f=sum(pop[i,:]'.*val);
        end
        if (f>bestFitnes)
            bestFitnes=f;
        end
    end
    return bestFitnes;
end

function GetWorstFitnes(pop,W,val,C)
    N,M=size(pop);

    worstFitnes=0;
    if (sum(pop[1,:]'.*W)>C)
    worstFitnes=0;
    else
    worstFitnes=sum(pop[1,:]'.*val);
    end
    for i=2:N
        f=0;
        if (sum(pop[i,:]'.*W)>C)
        f=0;
        else
        f=sum(pop[i,:]'.*val);
        end
        if (f<=worstFitnes)
            worstFitnes=f;
        end
    end
    return worstFitnes;
end

function GetAverageFitnes(pop,W,val,C)

    N,M=size(pop);

    Fitnes=0;

    for i=1:N

        if (sum(pop[i,:]'.*W)>C)
        Fitnes=Fitnes+0;
        else
            f=sum(pop[i,:]'.*val);
            Fitnes=Fitnes+f;
        end

    end
    average=convert(Int64,round(Fitnes/N))
    return average;
end
