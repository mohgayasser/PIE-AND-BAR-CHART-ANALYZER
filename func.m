function f = func(indcpy,x1,I3,i,r1,c1,ff,xx,hori,ii)
%indcpy->contain indices of rows with values seprated by 0
%x1->lastindex
%I3->image to split
%final precentage
%xx->first or not
%hozi-> border l kelma bl 3rd wla tool
%ii->counter ll swr

[x y]=size(I3);
oldind=x1;
rep=-1;
first=xx;
tmp=oldind;
while indcpy(x1)~=0
        x1=x1+1; 
        y1=x1+1;
        if y1>=x
            y1=x-1;
        end
        if (0==indcpy(y1)&&first~=1 &&rep <= 0) || (0==indcpy(x1)&&hori==1) 
            if x1-tmp<=6
                rep=rep+1;
                tmp=x1;
                x1=x1+2;
            end
        end  
end
if hori==0
    index=x1-1;   
    for e=indcpy(oldind):indcpy(index)
        for r=1:y
            txt(r1,c1)=I3(e,r);
            c1=c1+1;
        end
        r1=r1+1;
        c1=1;
    end 
    
else
    index=x1-1; 
    for  r=1:x
        for e=indcpy(oldind):indcpy(index)
            txt(r1,c1)=I3(r,e);
            c1=c1+1;
        end
        r1=r1+1;
        c1=1;
    end
end 

II=255-txt;  
J = insertText(II, [170 0],ff(i) );
file=sprintf('result%d.png',ii);
imwrite(J, file); 
f=x1; 
end