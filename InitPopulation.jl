#14253024 ABDULLAH DAVULCU
function InitPop(M,rndList,m,RndIndex)
    pop=zeros(Int64 , M,m);
    x,y=size(rndList);
    counter=1;

    individual=zeros(Int8,1,m);

    for i=1:M
        for j=1:m
            RndIndex=counter%(y);
            if (RndIndex==0)
                RndIndex=y;
            end
            if (rndList[RndIndex]<0.5)
                individual[1,j]=0
            else
                individual[1,j]=1
            end
            counter=counter+1;

        end
        pop[i,:]=individual;
    end
    return pop,RndIndex+1;
end
