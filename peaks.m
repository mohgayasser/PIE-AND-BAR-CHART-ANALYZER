function [ pks,locs ] = peaks( countsR ,grayLevelsR)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

[r,c]=size (countsR);
pks=[];
locs=[];
counter=1;
threshold=1000;

for i=2:r
   if grayLevelsR(i,1)<250&&countsR(i,1)>threshold
       pks(counter)=countsR(i,1);
       locs(counter)=grayLevelsR(i,1);
       counter=counter+1;
   end
end

end

