function [ fr ] = bichart( gray_image,centers,radii,I )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
[countsR, grayLevelsR] = imhist(gray_image);
%[pks,locs] = findpeaks(countsR);
%get max peaks from histogram
 [ pks,locs ] = peaks( countsR ,grayLevelsR);
 %count number of pixels for each color in bichar
 [ per ] = ColorpixelsNum( locs,centers ,radii,gray_image);
 %calculate the total number of pixels in bichart and  the percentage of each color in bichart
[ finalper,perv ] = Precentage( locs,per );
%detect the black border on image
[ Y,X,C] = BlackBorder( I );
%segmenting the image and  leaving only the colors 
[ H ] = detect( gray_image,finalper,Y,X,C );
%figure,imshow(H);
%know the arangment of the colors
 fr  = arrangment(gray_image, H,Y,X,C);
 
 fr(fr==0)=[];
[r,c]=size(finalper);
[r1,c1]=size(fr);
for i=1:c1
   for j=1:c
      if  finalper(1,j)== fr(1,i)
          fr(1,i)=perv(1,j);
      end
   end
end
end

