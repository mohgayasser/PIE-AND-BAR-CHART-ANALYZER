function [ Ysbox,Xsbox,count ] = BlackBorder( I )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% I = imread( '4.jpg');
gray_image = rgb2gray(I);
[r,c]=size(gray_image);
H=ones(size(gray_image));

for i=1:c
    for j=1:r
       if  gray_image(j,i)== 0
           H(j,i)=0;
         
       end
    end 
end
Xsbox=0;
Ysbox=0;
count=0;
for i=1:r
     for j=1:c
      if  H(i,j)==0
          if count==0
          Xsbox=j;
          Ysbox=i;
          end
         count=count+1;
      end 
     end 
     if count>50 
         break;
     end
end

end

