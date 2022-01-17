%I = imread( '2.jpg'); %pie
%I = imread( '4.jpg');  %pie
%I = imread( '1.png'); %pie
%I = imread( '3.png'); %pie
I = imread( '5.png'); %bar
%I = imread( '6.jpg'); %bar
%I = imread( '8.png'); %bar
%I = imread( '7.jpg'); %bar
figure,imshow(I);
gray_image = rgb2gray(I);

%detect if the image for bi or bar chart
[ centers,radii ] = biDetection( gray_image );
R=isempty(centers);
if R==1
    %barchart code
    barChart(I)
    
else
 centers=round(centers);
 radii=round(radii);
 [ fr ] = bichart( gray_image,centers,radii,I );
 [l, len]=size(fr);
 TextDetection(I,fr); 
 report(len,'Pie chart');
end 
    
