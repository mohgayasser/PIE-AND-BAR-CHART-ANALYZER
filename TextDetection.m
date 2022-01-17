 function outind = TextDetection(I,fr)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

gray_image = rgb2gray(I);
A=gray_image;
%detect the black border on image
[ Y,X,~] = BlackBorder( I );
[h,w]=size(gray_image);
[a,b]=size(A); 
hori=0;
if h-Y >w-X %rows>cols -> border bl gamb
    for j=1:a 
         for i=1:X
             A(j,i)=0;
         end
    end 
else
    hori=1;
    for i=1:Y
        for j=1:b
            A(i,j)=0;
        end
    end
end  

[r, c] = find(A);  %return indices of nonzero row&col mn al sora aly wa5daha
unpaddedA = A(min(r):max(r), min(c):max(c));
unpaddedA=imresize(unpaddedA,1.5);
%imfill 3shan tgeb l border bs w atr7o ml sora l kamlaa hytl3 fl F l kalam
%bs mngher l border
F=imfill(unpaddedA) - unpaddedA;
I3=LinearFilter(F,LaplacianSharp(),"" );
ind=[];
zz=1;
[x y]= size(I3);
counter=0;
%balf 3l sora ashof l row da kan malosh lzma aghlbo zeroes wala kan mohm w
%mhtagoo m3aya fl crop l gdedaa
if hori==0
    for i=1:x
        for j=1:y 
            if I3(i,j) == 0 
                counter=counter+1;
            end     
        end 
          if counter > 0.85*(y)
            ind(zz)=0;
          else
          ind(zz)=i;
      end
      zz=zz+1;
      counter=0;  
    end
else
    for i=1:y
        for j= 1:x
            if I3(j,i) == 0 
                counter=counter+1;
            end     
        end 
          if counter > 0.85*(x)
            ind(zz)=0;
          else
          ind(zz)=i;
      end
      zz=zz+1;
      counter=0;  
    end
end
r1=1;
c1=1;
s=size(ind);
indcpy=[];
%loop btlf 3la l indices l gm3thaa lw zero neglect lw rkam btkhdo t7oto fl
%indcpy l gdeda l hyb2a feha indices lcrops l 72e2eya bt3ty
for i=1:s(2)
    if (i+1)>s(2)
        break
    else    
     if(ind(i)==0)
        if(ind(i+1)==0)
            continue
        elseif(ind(i+1)~=0)
            indcpy(c1)=ind(i);
            c1=c1+1;
        end
    else
        indcpy(c1)=ind(i);
            c1=c1+1;
    end
    end
end 
%3shan atl3 kol goz2 m3 l precentage bt3too
x1=2;
siz=size(fr);
i=1; ii=1;
[l k]=size(indcpy);
x1=func(indcpy,x1,I3,i,r1,c1,fr,1,hori,ii);
while x1+1 ~= k 
    if(x1+1)>k-4 || (i)==siz(2)
        break
    end
   ii=ii+1;
   x1=func(indcpy,x1+1,I3,i+1,r1,c1,fr,0,hori,ii);
   i=i+1;
end 
end 
