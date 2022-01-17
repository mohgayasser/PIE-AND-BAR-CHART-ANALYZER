function [ per ] = ColorpixelsNum( locs,centers ,radii,gray_image)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here


[r,c]=size(locs);
XFinal_Point=centers(2)+radii+10;
YFinal_Point=centers(1)+radii+10;
XStart_Point=centers(2)-radii-10;
YStart_Point=centers(1)-radii-10;
per=zeros(size(locs));

 for j=XStart_Point:XFinal_Point
     for k=YStart_Point:YFinal_Point
         for  l=1:c
             if gray_image(j,k)== (locs(1,l))
                per(1,l)=  per(1,l)+1;
             end
         end
     end
 end

end

