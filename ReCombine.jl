#14253024 ABDULLAH DAVULCU
function ReCombineParents(pop,RndList,RndIndex,MutChance,val,C,W,oldPop)
    x,y=size(RndList);
    counter=RndIndex;
    iteration=1;
    N,M=size(pop)
    if (N%2==1)
        iteration=N-1;
    else
        iteration=N;
    end
    children=zeros(Int64,iteration,M);

    i=1;


while i<iteration
    RndIndex=counter%(y);
    if (RndIndex==0)
        RndIndex=y;
    end
    a=convert(Int64,ceil((RndList[RndIndex]*M)-1))+1

    parent1=pop[i,:]';
    parent2=pop[(i+1),:]';

    child1,child2=Combination(parent1,parent2,a);
    children[i,:]=child1;
    children[i+1,:]=child2;
    #display("Parents = $parent1  $parent2 at point $a")
    #display("children = $child1  $child2 ")
    counter=counter+1;
    i=i+2;
end
RndIndex=RndIndex+1;
newChildren,RndIndex=Mutation(children,RndList,RndIndex,MutChance);


dim=N+iteration;

tempPop=zeros(Int8,dim,M)

tempPop=vcat(oldPop,newChildren);
N1,M1=size(tempPop);

tempPop=SortMatrix(tempPop,val,C,W);

newPop=tempPop[1:N,:];


    return newPop,RndIndex;
end

function Combination(parent1,parent2,X)

    N,M=size(parent1);

    child1=zeros(Int64, 1, M);
    child2=zeros(Int64, 1, M);

    #display(x);
    child1[1:X]=parent1[1:X];
    child1[X+1:end]=parent2[X+1:end];
    child2[1:X]=parent2[1:X];
    child2[X+1:end]=parent1[X+1:end];
    #display(child1);
    #display(child2);
    return child1,child2;
end

function Mutation(children,RndList,RndIndex,MutChance)
N,M=size(children);

x,y=size(RndList);
counter=RndIndex;

for i=1:N
    for j=1:M
        RndIndex=counter%(y);

        if (RndIndex==0)
            RndIndex=y;
        end
        if (RndList[RndIndex]<MutChance)
            if (children[i,j]==0)
               children[i,j]=1
            else
                children[i,j]=0
            end
        end

        counter=counter+1;
    end

end
return children,RndIndex+1;

end

function SortMatrix(_matrix,val,C,W)
      N,M=size(_matrix);
      temp=zeros(Int64, N,M+1 );

      for i=1:N

          fitnes=sum(_matrix[i,:]'.*val)
          weight=sum(_matrix[i,:]'.*W)
          if (weight > C)
              fitnes=0;
          end
          temp[i,:]=[_matrix[i,:]' fitnes]
      end

      _newMatrix=sortrows(temp,lt=(x,y)->isless(x[M+1],y[M+1]),rev=true)
     # display(_newMatrix);
     _matrix=_newMatrix[:,1 : M];

    return _matrix;
end
