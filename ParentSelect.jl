#14253024 ABDULLAH DAVULCU

function GetParents(Pop,k,RndList,RndIndex,W,val,C)
N,M=size(Pop);
x,y=size(RndList);

counter=RndIndex;
newPop=zeros(Int8,N,M);

    for i=1:N
        tempPop=zeros(Int8,k,M);
        for j=1:k

            RndIndex=counter%(y);

            if (RndIndex==0)
                RndIndex=y;
            end
            a=convert(Int64,ceil((RndList[RndIndex]*N)-1))+1
            #display(a);
            tempPop[j,:]=Pop[a,:];

            counter=counter+1;
        end
        newPop[i,:]=TournementSelection(tempPop,k,W,val,C,M);
    end
#display(newPop);
    return newPop,RndIndex+1 ;
end

function TournementSelection(tempPop,k,W,val,C,M)

bestFitnes=0;
best=zeros(Int8,1,M);
best=tempPop[1,:]';
weight=sum(tempPop[1,:]'.*W);
if (weight>C)
    bestFitnes=0;
else
    bestFitnes=sum(tempPop[1,:]'.*val);
end

for i=2:k
    weight=sum(tempPop[i,:]'.*W);
    if (weight>C)
        f=0;
    else
        f=sum(tempPop[i,:]'.*val);
    end
    if (f>bestFitnes)
        bestFitnes=f;
        best=tempPop[i,:]';
    end

end
return best;
end
