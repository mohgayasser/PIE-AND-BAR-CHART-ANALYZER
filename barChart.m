function  barChart(I)

import mlreportgen.dom.*;
d = Document('report2','docx'); 
open(d);
append(d,'Bar Chart','Title');

IDigitSeg=I;
Ilegend=I;
[h,w,c]=size(I);
%figure,imshow(I),title('1');
gridlinesImg=I;
RealI=I;

%legend Picture
Ilegend = imsharpen(Ilegend);
BW=~im2bw(Ilegend) ;
% figure,imshow(BW)

props = regionprops('table',BW, 'BoundingBox','Area','PixelList','Solidity','ConvexHull','EulerNumber','Centroid');

EN=props.EulerNumber;
bbox= props.BoundingBox;
Area= props.Area;
[R C]=size(Area);

Width=bbox(:,1);
Maxarea=0;
Ver=bbox(1,1);
legendIMG=I;
for i = 1:R
        if (Area(i,1)>Maxarea) && EN(i,1)==0 && Width(i,1)>100
        Maxarea=Area(i,1);
        Ver=bbox(i,:);
        legendIMG=imcrop(I,[Ver(1,1),Ver(1,2),Ver(1,3),Ver(1,4)]);
%         figure,imshow(OutputI),title(Area(i,1))
        txt=ocr(legendIMG,  'TextLayout','Block');
        newtxt= compose(txt.Text);
        L = strlength(newtxt);
        if(L==0)
             if(isempty(newtxt))
                 Maxarea=0;
             end
        else
             C = strsplit(txt.Text,{'\t','\n','\r','','0',' ',''});
             D = strjoin(C,'');
             if(isempty(D))
                 Maxarea=0;
             end
        end
        end
end


figure,imshow(legendIMG)
txtLengend=ocr(legendIMG,  'TextLayout','Block');
compText=(txtLengend.Text);
ArrayText= strsplit(compText,{'\n','I',''});
ArrayText=ArrayText(~cellfun('isempty',ArrayText));



%color Segmentation
%*%*%*%*%*% red %*%*%*%*%*%
Red=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==191 )&& (I(i,j,2)==63) && (I(i,j,3)==63)
            Red(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end
% figure,imshow(Red),title('Red');
IRed = Red;
RedHeight=0;
if(check==1)
    bw2=im2bw(IRed);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    height = bb(:,4);
    if height(1) > height(2)
        RedHeight=height(1);
    else
        RedHeight=height(2);
    end
end



%*%*%*%*%*% blue %*%*%*%*%*%
blue=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==63 )&& (I(i,j,2)==127) && (I(i,j,3)==191)
            blue(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end
% figure,imshow(blue),title('blue');
blueHeight=0;
if(check==1)
    Iblue = blue;
    bw2=im2bw(Iblue);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    height = bb(:,4);
    if height(1) > height(2)
        blueHeight=height(1);
    else
        blueHeight=height(2);
    end
end




%*%*%*%*%*% Purple %*%*%*%*%*%
Purple=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==191 )&& (I(i,j,2)==63) && (I(i,j,3)==191)
            Purple(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end
% figure,imshow(Purple),title('Purple');

PurpleHeight=0;
if(check==1)
    IPurple = Purple;
    bw2=im2bw(IPurple);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    height = bb(:,4);
    if height(1) > height(2)
        PurpleHeight=height(1);
    else
        PurpleHeight=height(2);
    end
end




%*%*%*%*%*% Green  %*%*%*%*%*%
Green=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==127 )&& (I(i,j,2)==191) && (I(i,j,3)==63)
            Green(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end
GreenHeight=0;
if(check==1)
    IGreen = Green;
    bw2=im2bw(IGreen);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    height = bb(:,4);
    if height(1) > height(2)
        GreenHeight=height(1);
    else
        GreenHeight=height(2);
    end
end



%*%*%*%*%*% DarkPurple %*%*%*%*%*%
DarkPurple=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==127 )&& (I(i,j,2)==63) && (I(i,j,3)==191)
            DarkPurple(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end
DarkPurpleHeight=0;
if(check==1)
    IDarkPurple = DarkPurple;
    bw2=im2bw(IDarkPurple);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    if height(1) > height(2)
        DarkPurpleHeight=height(1);
    else
        DarkPurpleHeight=height(2);
    end
end


%----------2-----------%

gridlinesImg=I;
%*%*%*%*%*% Yellow %*%*%*%*%*%
Yellow=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==255 )&& (I(i,j,2)==255) && (I(i,j,3)==77)
            Yellow(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end


YellowHeight=0;
if(check==1)
    IYellow = Yellow;
    bw2=im2bw(IYellow);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > YellowHeight
            YellowHeight=height(kk);
        end
    end
end


%*%*%*%*%*% Gray %*%*%*%*%*%
Gray=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==76)&& (I(i,j,2)==76) && (I(i,j,3)==76)
            Gray(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end

GrayHeight=0;
if(check==1)
    IGray = Gray;
    bw2=im2bw(IGray);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > GrayHeight
            GrayHeight=height(kk);
        end
    end
end



%*%*%*%*%*% Green1 %*%*%*%*%*%
Green1=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if ((I(i,j,1)==178 )&& (I(i,j,2)==223) && (I(i,j,3)==132)) ||((I(i,j,1)==176 )&& (I(i,j,2)==221) && (I(i,j,3)==130))||((I(i,j,1)==175 )&& (I(i,j,2)==220) && (I(i,j,3)==129))||((I(i,j,1)==190)&& (I(i,j,2)==214) && (I(i,j,3)==166))||((I(i,j,1)==177)&& (I(i,j,2)==222) && (I(i,j,3)==131))||((I(i,j,1)==184)&& (I(i,j,2)==224) && (I(i,j,3)==135))||((I(i,j,1)==179)&& (I(i,j,2)==224) && (I(i,j,3)==133))
            Green1(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end
%figure,imshow(Green1)
Green1Height=0;
if(check==1)
    IGreen1 = Green1;
    bw2=im2bw(IGreen1);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > Green1Height
            Green1Height=height(kk);
        end
    end
end


%*%*%*%*%*% blue1 %*%*%*%*%*%
blue1=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==178 )&& (I(i,j,2)==223) && (I(i,j,3)==132)
            blue1(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end
blue1Height=0;
if(check==1)
    Iblue1 = blue1;
    bw2=im2bw(Iblue1);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > blue1Height
            blue1Height=height(kk);
        end
    end
end

%*%*%*%*%*% Green2 %*%*%*%*%*%
Green2=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==76 )&& (I(i,j,2)==199) && (I(i,j,3)==132)
            Green2(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end

Green2Height=0;
if(check==1)
    IGreen2 = Green2;
    bw2=im2bw(IGreen2);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > Green2Height
            Green2Height=height(kk);
        end
    end
end

%*%*%*%*%*% Red2 %*%*%*%*%*%
Red2=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==255 )&& (I(i,j,2)==77) && (I(i,j,3)==77)
            Red2(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end

Red2Height=0;
if(check==1)
    IRed2 = Red2;
    bw2=im2bw(IRed2);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > Red2Height
            Red2Height=height(kk);
        end
    end
end

%*%*%*%*%*% Purple2 %*%*%*%*%*%
Purple2=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)== 154 )&& (I(i,j,2)== 110) && (I(i,j,3)== 187)
            Purple2(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end
% figure,imshow(Purple2),title('Purple2');
Purple2Height=0;
if(check==1)
    IPurple2 = Purple2;
    bw2=im2bw(IPurple2);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > Purple2Height
            Purple2Height=height(kk);
        end
    end
end

%*%*%*%*%*% blue2 %*%*%*%*%*%
blue2=zeros(h,w,c);
for i=1:h
    for j=1:w
        if (I(i,j,1)==124 )&& (I(i,j,2)==156) && (I(i,j,3)==213)
            blue2(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end

blue2Height=0;
if(check==1)
    Iblue2 = blue2;
    bw2=im2bw(Iblue2);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > blue2Height
            blue2Height=height(kk);
        end
    end
end

%----------3-----------%

gridlinesImg=I;
%*%*%*%*%*% blue3 %*%*%*%*%*%
blue3=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==0 )&& (I(i,j,2)==126) && (I(i,j,3)==214)
            blue3(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end


blue3Height=0;
if(check==1)
    Iblue3 = blue3;
    bw2=im2bw(Iblue3);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > blue3Height
            blue3Height=height(kk);
        end
    end
end
%*%*%*%*%*% Red3 %*%*%*%*%*%
Red3=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==255 )&& (I(i,j,2)==0) && (I(i,j,3)==0)
            Red3(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end


Red3Height=0;
if(check==1)
    IRed3 = Red3;
    bw2=im2bw(IRed3);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > Red3Height
            Red3Height=height(kk);
        end
    end
end


%*%*%*%*%*% Green3 %*%*%*%*%*%
Green3=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==82 )&& (I(i,j,2)==215) && (I(i,j,3)==38)
            Green3(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end


Green3Height=0;
if(check==1)
    IGreen3 = Green3;
    bw2=im2bw(IGreen3);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > Green3Height
            Green3Height=height(kk);
        end
    end
end


%*%*%*%*%*% Yellow3 %*%*%*%*%*%
Yellow3=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==255 )&& (I(i,j,2)==236) && (I(i,j,3)==0)
            Yellow3(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end


Yellow3Height=0;
if(check==1)
    IYellow3 = Yellow3;
    bw2=im2bw(IYellow3);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > Yellow3Height
            Yellow3Height=height(kk);
        end
    end
end



%----------4-----------%

I = imgaussfilt(I,4);

[h,w,c]=size(I);
%figure,imshow(I),title('1');
gridlinesImg=I;
RealI=I;

gridlinesImg=I;
% figure,imshow(I)
%*%*%*%*%*% blue4 %*%*%*%*%*%
blue4=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
%        if (I(i,j,1)==73||I(i,j,1)==76||I(i,j,1)==95||I(i,j,1)==80||I(i,j,1)==108||I(i,j,1)==157) && (I(i,j,2)==74||I(i,j,2)==73||I(i,j,2)==80||I(i,j,2)==77||I(i,j,2)==96||I(i,j,2)==108||I(i,j,2)==155) && (I(i,j,3)==250||I(i,j,3)==243||I(i,j,3)==245||I(i,j,3)==241||I(i,j,3)==236||I(i,j,3)==239)
%         if ( (I(i,j,1)>71&&I(i,j,1)<81) ||(I(i,j,1)>94&&I(i,j,1)<109)||I(i,j,1)==277||I(i,j,1)==248||I(i,j,1)==211) && (I(i,j,2)==74||I(i,j,2)==209||I(i,j,2)==73||I(i,j,2)==80||I(i,j,2)==77||I(i,j,2)==96||I(i,j,2)==248||I(i,j,2)==108||I(i,j,2)==155||I(i,j,2)==155||I(i,j,2)==227) && (I(i,j,3)==250||I(i,j,3)==246||I(i,j,3)==243||I(i,j,3)==245||I(i,j,3)==241||I(i,j,3)==236||I(i,j,3)==239||I(i,j,3)==242||I(i,j,3)==252)
          if ( (I(i,j,1)>70&&I(i,j,1)<85) ) && (I(i,j,2)>72&&I(i,j,2)<87) && (I(i,j,3)>227&&I(i,j,3)<251)
            blue4(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end
% figure,imshow(blue4)
blue4Height=0;
if(check==1)
    Iblue4 = blue4;
    bw2=im2bw(Iblue4);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > blue4Height
            blue4Height=height(kk);
        end
    end
end

%*%*%*%*%*% Purple4 %*%*%*%*%*%
Purple4=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
%        if (I(i,j,1)==182||I(i,j,1)==181||I(i,j,1)==180||I(i,j,1)==183||I(i,j,1)==178 )&& (I(i,j,2)==109||I(i,j,2)==111||I(i,j,2)==112||I(i,j,2)==113||I(i,j,2)==110) && (I(i,j,3)==181||I(i,j,3)==182||I(i,j,3)==183)
         if (I(i,j,1)==182||I(i,j,1)==181||I(i,j,1)==180||I(i,j,1)==183||I(i,j,1)==178 )&& (I(i,j,2)==109||I(i,j,2)==111||I(i,j,2)==112||I(i,j,2)==113||I(i,j,2)==110) && (I(i,j,3)==181||I(i,j,3)==182||I(i,j,3)==183)
            Purple4(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end
% figure,imshow(Purple4)
Purple4Height=0;
if(check==1)
    IPurple4 = Purple4;
    bw2=im2bw(IPurple4);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > Purple4Height
            Purple4Height=height(kk);
        end
    end
end

%*%*%*%*%*% Red4 %*%*%*%*%*%
Red4=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if (I(i,j,1)==250)&& (I(i,j,2)==76||I(i,j,2)==75) && (I(i,j,3)==77)
            Red4(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end
% figure,imshow(Red4)
Red4Height=0;
if(check==1)
    IRed4 = Red4;
    bw2=im2bw(IRed4);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > Red4Height
            Red4Height=height(kk);
        end
    end
end

%*%*%*%*%*% Green4 %*%*%*%*%*%
Green4=zeros(h,w,c);
check=0;
for i=1:h
    for j=1:w
        if  (I(i,j,1)>75 &&I(i,j,1)<81) && (I(i,j,2)<251 &&I(i,j,2)>230) && (I(i,j,3)>75 || I(i,j,3)<90)
            %        if ((I(i,j,1)==86 )&& (I(i,j,2)==255) && (I(i,j,3)==87)) || ((I(i,j,1)==91 )&& (I(i,j,2)==255) && (I(i,j,3)==93))|| ((I(i,j,1)==90 )&& (I(i,j,2)==255) && (I(i,j,3)==91))|| ((I(i,j,1)==75 )&& (I(i,j,2)==254) && (I(i,j,3)==77))|| ((I(i,j,1)==91 )&& (I(i,j,2)==255) && (I(i,j,3)==91))|| ((I(i,j,1)==141 )&& (I(i,j,2)==255) && (I(i,j,3)==143))|| ((I(i,j,1)==162 )&& (I(i,j,2)==255) && (I(i,j,3)==168))|| ((I(i,j,1)==141 )&& (I(i,j,2)==255) && (I(i,j,3)==143))
            Green4(i,j,:)=I(i,j,:);
            gridlinesImg(i,j,:) = 255;
            check=1;
        end
    end
end
% figure,imshow(Green4)
Green4Height=0;
if(check==1)
    IGreen4 = Green4;
    bw2=im2bw(IGreen4);
    L=bwlabel(bw2);
    box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
    bb = vertcat(box.BoundingBox);
    % width = bb(:,3)
    height = bb(:,4);
    [rHeight,cHeight]=size(height);
    for kk=1:rHeight
        if height(kk) > Green4Height
            Green4Height=height(kk);
        end
    end
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Digit Color Segmentaion

I =IDigitSeg;
I = imcrop(I,[0 0 80 700]);
rgbImage = I;
grayImage = rgb2gray(rgbImage);
binaryImage = grayImage > 120;
%figure,imshow(binaryImage);
results = ocr(binaryImage, 'CharacterSet', '0123456789', 'TextLayout','Block');
FirstNumber=strtok(results.Text);
numberSeg = str2num(['uint8(',FirstNumber,')']);

numberSeg = int32(numberSeg);  % x is an integer
numberSeg = double(numberSeg); % x is a double



for i=1:h
    for j=1:w
        if(RealI(i,j,3) ~= 255 && RealI(i,j,1) ~= 255 && RealI(i,j,2) ~= 255)
            RealI(i,j,:) = 255;
        else
            RealI(i,j,:) = 0;
        end
    end
end
RealI = imcrop(RealI,[0 0 500 700]);


I=imsharpen(RealI);
I=im2bw(I);
I = edge(I,'sobel');
se = strel('disk',7);
I = imclose(I,se);

SobelVertical = edge(I,'Sobel',([]),'vertical');
L=bwlabel(SobelVertical);
box=regionprops(L,'Area',  'PixelIdxList','BoundingBox');
bb = vertcat(box.BoundingBox);
% width = bb(:,3)
height = bb(:,4);
MaxHeight=0;
sizeHeight=size(height);
for i=1:sizeHeight
    for j=1:w
        if(height(i,:) > MaxHeight)
            MaxHeight = height(i,:);
        end
    end
end


% numberSeg=11 ; %%%%1 px = 0.026458333 cm

GreenHeightCM=(GreenHeight*numberSeg)/MaxHeight   ;      
GreenHeightCM=round(GreenHeightCM);
if GreenHeightCM~=0
    
GreenHeightCM;


RedHeightCM=(RedHeight*numberSeg)/MaxHeight      ;   
RedHeightCM=round(RedHeightCM);
fprintf('%s = %i\n',string(ArrayText(1)),RedHeightCM)
        str2=string(ArrayText(1))+' = '+RedHeightCM;
        append(d,(str2));

blueHeightCM=(blueHeight*numberSeg)/MaxHeight      ;   
blueHeightCM=round(blueHeightCM);
fprintf('%s = %i\n',string(ArrayText(2)),blueHeightCM)
        str2=string(ArrayText(2))+' = '+blueHeightCM;
        append(d,(str2));

PurpleHeightCM=(PurpleHeight*numberSeg)/MaxHeight      ;   
PurpleHeightCM=round(PurpleHeightCM);
fprintf('%s = %i\n',string(ArrayText(3)),PurpleHeightCM)
        str2=string(ArrayText(3))+' = '+PurpleHeightCM;
        append(d,(str2));

fprintf('%s = %i\n',string(ArrayText(4)),GreenHeightCM)
        str2=string(ArrayText(4))+' = '+GreenHeightCM;
        append(d,(str2));

DarkPurpleHeightCM=(DarkPurpleHeight*numberSeg)/MaxHeight      ;   
DarkPurpleHeightCM=round(DarkPurpleHeightCM);
fprintf('%s = %i\n',string(ArrayText(5)),DarkPurpleHeightCM)

        str2=string(ArrayText(5))+' = '+DarkPurpleHeightCM;
        append(d,(str2));

else
%      numberSeg=5 ; 
     
    MaxHeight;
    YellowHeightCM=(YellowHeight*numberSeg)/MaxHeight   ;     
    YellowHeightCM=round(YellowHeightCM);

    if YellowHeightCM~=0
       % fprintf('%s = %i\n',string(ArrayText(1)),YellowHeightCM)
       
        str2=string(ArrayText(1))+' = '+YellowHeightCM;
        append(d,(str2));
        
        GrayHeightCM=(GrayHeight*numberSeg)/MaxHeight      ;   
        GrayHeightCM=round(GrayHeightCM);
       % fprintf('%s = %i\n',string(ArrayText(2)),GrayHeightCM)
        str2=string(ArrayText(2))+' = '+GrayHeightCM;
        append(d,(str2));
        
        Green1HeightCM=(Green1Height*numberSeg)/MaxHeight      ;   
        Green1HeightCM=round(Green1HeightCM);
       % fprintf('%s = %i\n',string(ArrayText(3)),Green1HeightCM)
        
        str2=string(ArrayText(3))+' = '+Green1HeightCM;
        append(d,(str2));
        
        blue1HeightCM=(blue1Height*numberSeg)/MaxHeight      ;   
        blue1HeightCM=round(blue1HeightCM);
        %fprintf('%s = %i\n',string(ArrayText(4)),blue1HeightCM)
        str2=string(ArrayText(4))+' = '+blue1HeightCM;
        append(d,(str2));
        
        Green2HeightCM=(Green2Height*numberSeg)/MaxHeight      ;   
        Green2HeightCM=round(Green2HeightCM);
      %  fprintf('%s = %i\n',string(ArrayText(5)),Green2HeightCM)
        str2=string(ArrayText(5))+' = '+Green2HeightCM;
        append(d,(str2));
        
        Red2HeightCM=(Red2Height*numberSeg)/MaxHeight      ;   
        Red2HeightCM=round(Red2HeightCM);
       % fprintf('%s = %i\n',string(ArrayText(6)),Red2HeightCM)
        str2=string(ArrayText(6))+' = '+Red2HeightCM;
        append(d,(str2));
        
        Purple2HeightCM=(Purple2Height*numberSeg)/MaxHeight      ;   
        Purple2HeightCM=round(Purple2HeightCM);
      %  fprintf('%s = %i\n',string(ArrayText(7)),Purple2HeightCM)
        str2=string(ArrayText(7))+' = '+Purple2HeightCM;
        append(d,(str2));
        
        blue2HeightCM=(blue2Height*numberSeg)/MaxHeight      ;   
        blue2HeightCM=round(blue2HeightCM);
        %fprintf('%s = %i\n',string(ArrayText(8)),blue2HeightCM)
        str2=string(ArrayText(8))+' = '+blue2HeightCM;
        append(d,(str2));
        
        
    else
%         numberSeg=40 ; 
        MaxHeight;
        Yellow3HeightCM=(Yellow3Height*numberSeg)/MaxHeight   ;     
        Yellow3HeightCM=round(Yellow3HeightCM);
        ArrayText;
        if Yellow3HeightCM~=0
            blue3HeightCM=(blue3Height*numberSeg)/MaxHeight      ;   
            blue3HeightCM=round(blue3HeightCM);
        %fprintf('%s = %i\n',string(ArrayText(1)),blue3HeightCM)
        str2=string(ArrayText(1))+' = '+blue3HeightCM;
        append(d,(str2));
        
        
            str=strsplit(string(ArrayText(2)),' ');
            Red3HeightCM=(Red3Height*numberSeg)/MaxHeight      ;   
            Red3HeightCM=round(Red3HeightCM);
        %fprintf('%s = %i\n',string(str(2)),Red3HeightCM)
        str2=string(str(2))+' = '+Red3HeightCM;
        append(d,(str2));
            Green3HeightCM=(Green3Height*numberSeg)/MaxHeight      ;   
            Green3HeightCM=round(Green3HeightCM);
        %fprintf('%s = %i\n',string(str(3)),Green3HeightCM)
        str2=string(str(3))+' = '+Green3HeightCM;
        append(d,(str2));
        
       % fprintf('%s = %i\n',string(str(4)+str(5)),Yellow3HeightCM)
       str2=string(str(4)+str(5))+' = '+Yellow3HeightCM;
        append(d,(str2));
        
        else
%             numberSeg=15; 
            MaxHeight;
          
            Green4HeightCM=(Green4Height*numberSeg)/MaxHeight      ;   
            Green4HeightCM=round(Green4HeightCM)  ;
            str=string(ArrayText(1));
           
      %  fprintf('%s = %i\n',str,Green4HeightCM)
      str2=str+' = '+Green4HeightCM;
          append(d,str2);
        
            Purple4HeightCM=(Purple4Height*numberSeg)/MaxHeight      ;   
            Purple4HeightCM=round(Purple4HeightCM)  ;
     %   fprintf('%s = %i\n',string(ArrayText(2)),Purple4HeightCM)
     str=string(ArrayText(2))+' = '+Purple4HeightCM;
            append(d,str);
        
            Red4HeightCM=(Red4Height*numberSeg)/MaxHeight      ;   
            Red4HeightCM=round(Red4HeightCM)  ;
    %    fprintf('%s = %i\n',string(ArrayText(3)),Red4HeightCM)
    str=string(ArrayText(3))+' = '+Red4HeightCM;
    
            append(d,str);
            blue4HeightCM=(blue4Height*numberSeg)/MaxHeight      ;   
            blue4HeightCM=round(blue4HeightCM)  ;
   %     fprintf('%s = %i\n',string(ArrayText(4)),blue4HeightCM)
            str=string(ArrayText(4))+' = '+blue4HeightCM;
            append(d,str);
%             append(d,(blue4HeightCM));
           
    end
end

%figure,imshow(gridlinesImg),title('gridlinesImg');

close(d);
rptview(d.OutputPath);
end

