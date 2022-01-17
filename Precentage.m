function [ finalper,perv ] = Precentage( locs,per )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
[r,c]=size(locs);
 sum=0;
 index=1;
 perv=[];
 finalper=[];
 for k=1:c
   if per(1,k)>1000
     sum=sum+ per(1,k);
     finalper(index)=locs(1,k);
     perv(index)=per(1,k);
     index=index+1;
    end
 end

 
[w,h]=size(perv);
for i=1:h
 perv(i)=(perv(i)/sum)*100;   
end 

end

