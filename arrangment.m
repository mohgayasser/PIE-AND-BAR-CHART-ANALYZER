function [ fr ] = arrangment(gray_image, H,Y,X,C )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[h,w]=size(gray_image);
 [yh,xh]=size(H);
 %if the border box is vertical
if yh>xh
    
    nonzerorows=0;
    countofnonzero=0;
    maxofnonzero=0;
    zerorows=0;
    countofzero=0;
    minofzero=[];
    mincount=1;
    %to detect the number of rows that have the color information to
    %segment based on it
    for i=1:h-Y
        for j=1:w-X
           if H(i,j)>0
               nonzerorows=nonzerorows+1;
               else
               zerorows=zerorows+1;
           end 
        end 
        if nonzerorows>5
           countofnonzero=countofnonzero+1;
           nonzerorows=0;
             minofzero(mincount)=countofzero;
             countofzero=0;
             zerorows=0;
            mincount=mincount+1;
        else
            zerorows=0;
            countofzero=countofzero+1;
            if countofnonzero>maxofnonzero
                maxofnonzero=countofnonzero;
                countofnonzero=0;
                nonzerorows=0;
            end
        end
    end
        
 %if max less than 20 rows that meaning the rows have little information about
 %this color so the number of zeros well be grater than the number of colors in
 %the rows so we need to maximize the number of rows
   if maxofnonzero>=20 
   segment=maxofnonzero; 
   else
       minofzero=max(minofzero);
       segment=minofzero;
   end
   fr=[];
    pervalue=[];
    indexfr=1;
    occur=[];
    index=1;
    % to know the most frequent number in each segment of rows
  for i=segment:segment:h-Y-10
      for j=i-segment+1:i
            for q=1:w-X
              if H(j,q)>0
                pervalue(index)=H(j,q);
               
                index=index+1;
              end 
            end
      end
      if index==1
          break;
      end
       [M,F] = mode(pervalue);
       found=0;
       for n=1:indexfr-1
           if M==fr(1,n)
               found=n;
               break;
           end
       end 
       % if any number appears twice, so we need to know which time
       % that the number was more frequent than the other
       if found>0 &&occur(n)<F 
      fr(n)=[];
      occur(n)=[];
      fr(indexfr)=M;
      occur(indexfr)=F;
      indexfr=indexfr+1;
       elseif found==0 
      fr(indexfr)=M;
      occur(indexfr)=F;
      indexfr=indexfr+1;
       end
        clear pervalue;
        index=1; 
  end 
else
    %if the black border is Horizontal
    
     nonzerorows=0;
    countofnonzero=0;
    maxofnonzero=0;
    zerorows=0;
    countofzero=0;
    minofzero=[];
    mincount=1;
    %to detect the number of rows that have the color information to
    %segment based on it
    for i=1:w-X
        for j=1:h-Y
           if H(j,i)>0
               nonzerorows=nonzerorows+1;
           else
               zerorows=zerorows+1;
           end 
        end 
        if nonzerorows>5
           countofnonzero=countofnonzero+1;
           nonzerorows=0;
          
             minofzero(mincount)=countofzero;
             countofzero=0;
             zerorows=0;
            mincount=mincount+1;
        else
            zerorows=0;
            countofzero=countofzero+1;
            if countofnonzero>maxofnonzero
                maxofnonzero=countofnonzero;
                countofnonzero=0;
                nonzerorows=0;
            end
            
        end 
    end
 %if max less than 20 rows that meaning the rows have little information about
 %this color so the number of zeros well be grater than the number of colors in
 %the rows so we need to maximize the number of rows
   if maxofnonzero>=10 
   segment=maxofnonzero; 
   else
       
       minofzero=max(minofzero);
       segment=minofzero-maxofnonzero;
   end
    fr=[];
    pervalue=[];
    indexfr=1;
    occur=[];
  for i=segment:segment:X+C-60
      clear pervalue;
      index=1;
      for j=i-segment+1:i
            for q=1:h-Y
              if H(q,j) >0
                pervalue(index)=H(q,j);
                index=index+1;
              end 
            end
      end
       if index==1
          break;
      end
       [M,F] = mode(pervalue);
       found=0;
       for n=1:indexfr-1
           if M==fr(1,n)
               found=n;
               break;
           end
       end 
       if found>0 &&occur(n)<F 
      fr(n)=[];
      occur(n)=[];
      fr(indexfr)=M;
      occur(indexfr)=F;
      indexfr=indexfr+1;
       elseif found==0 
      fr(indexfr)=M;
      occur(indexfr)=F;
      indexfr=indexfr+1;
       end
       
  end 
 
end 

end

