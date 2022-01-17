I = imread( '11.png');
g = rgb2gray(I);
FF=imresize(g, 1.8);
figure,imshow(FF);
[r c]=size(FF);
% H=[];
% r1=1; 
% c1=1;
% for i=1:r
%     for j=1:c
%      H(r1,c1)=FF(i,j)-1   
%         
%     end
% end
H=255-FF;
%imshow(H);
 
I2=LinearFilter(H,Gussian2(0.05),"" );
I3=LinearFilter(I2,LaplacianSharp(),"" );
figure,imshow(I3);
txt=ocr(I3);
txt.Words
