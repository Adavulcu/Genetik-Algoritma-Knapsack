#14253024 ABDULLAH DAVULCU

function GetTestData(path)
    workspace();
   counter=1
   C=0;
   val=[];
   W=[];
   M=0;
   MutationChance=0;
   iteration=0;
   k=0;
   randomNumberList=[];
   open(path) do file
   for ln in eachline(file)

       if (counter==1)
           rnl=split(ln,",")
            s= length(rnl);
           randomNumberList=zeros(Float64,s);
           for i=1:s
             randomNumberList[i]=parse(Float64,rnl[i]) ;
           end
           randomNumberList=randomNumberList';
           println("Random List = $randomNumberList");
       elseif (counter==2)
           M=parse(Int64,ln);
           println("Popülasyon Boyutu = $M");
       elseif (counter==3)
           k=parse(Int64,ln);
           println("Turnuva Boyutu = $k");
       elseif (counter==4)
           MutationChance=parse(Float64,ln);
           println("Mutasyon Şansı = $MutationChance");
       elseif (counter==5)
           iteration=parse(Int64,ln);
           println("İterasyon Miktarı = $iteration");
       elseif (counter==6)
           C=parse(Int64,ln);
           println("Çanta Boyutu = $C");
       elseif (counter==7)
           rnl=split(ln,",")
            s= length(rnl);
           W=zeros(Int64,s);
           for i=1:s
               W[i]=parse(Float64,rnl[i]) ;
           end
           W=W';
           println("Elemanların Ağırlıkları = $W");
       else
           rnl=split(ln,",")
            s= length(rnl);
           val=zeros(Int64,s);
           for i=1:s
               val[i]=parse(Float64,rnl[i]) ;
           end
           val=val';
           println("Elemanların Değerleri = $val");

       end


       counter=counter+1;
       end
   end

    return C,val,W,M,MutationChance,iteration,k,randomNumberList;
end
