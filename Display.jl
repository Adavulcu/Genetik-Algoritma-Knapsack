#14253024 ABDULLAH DAVULCU
function DisplayPop(pop,val,W,C)
N,M=size(pop);
fitnes=0;
    for i=1:N
        f=sum(pop[i,:]'.*W);
            if (f>C)
                fitnes=0
            else
                fitnes=sum(pop[i,:]'.*val);
            end
        inv=pop[i,:]';
        display("('$inv' ,$fitnes)")
    end

end
