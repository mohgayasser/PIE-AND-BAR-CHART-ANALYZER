function Out = LinearFilter(I,Filter, Postproc )

I2=im2double(I); 
countImage = conv2(I2,Filter); %bt3ml l convlution 
[r, c] = find(countImage);  %return indices of nonzero row&col mn al sora aly wa5daha
unpadded_m = countImage(min(r):max(r), min(c):max(c));
ResultImage= (unpadded_m);
%figure,imshow(ResultImage);
Out=im2uint8(ResultImage);
end
 