clear;clc;
data=xlsread('C:\Users\刘义泽\Desktop\data.xlsx');
[a,b]=size(data);
base=388580182.8;
for i=1:1:a
    m=0;
    for j=2:1:b-1
        if data(i,j)>0&&data(i,j)<30
            m=m+3;
        end
        BT=m/12;
        PER=58.93*BT/data(i,b);
        RDI=(0.629+0.237*PER-0.0031*PER^2)^2;
        NPP=RDI^2*(((data(i,b)*(1+RDI+RDI^2))/((1+RDI)*(1+RDI^2))))*exp(-sqrt(9.87+6.25*RDI));
    end
        data(i,b+1)=NPP;
        S=79906.27;
        C=NPP*S*100;
        if data(i,1)==2013
            data(i,b+2)=base;
        else
        base=base+C;
        data(i,b+2)=base;
        end
end
 
   
   
   