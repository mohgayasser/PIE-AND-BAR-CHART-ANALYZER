function [ H,yh,xh ] = detect( gray_image,finalper,Y,X,C )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


[h,w]=size(gray_image);
[r,c]=size(finalper);
arrangpervalue=[];
col=[];
row=[];
count=1;
found=0;
H=zeros([h-Y,w-X]);
%figure,imshow(H);
xh=1;yh=1;
for i=Y+5:h
    for j=X+5:X+C
        for k=1:c
       if gray_image(i,j)==  finalper(1,k)
        H(yh,xh)= gray_image(i,j);
        
       end
        end 
          xh=xh+1;
    end
    yh=yh+1;
    xh=1;
end 

end

