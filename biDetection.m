function [ centers,radii ] = biDetection( gray_image )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
centers=[];
[centers, radii] = imfindcircles(gray_image,[80 250],'ObjectPolarity','dark','Sensitivity',0.98);
 T=isempty(centers);
if T==1
[centers, radii] = imfindcircles(gray_image,[250 320],'ObjectPolarity','dark','Sensitivity',0.92);
end

 

end

