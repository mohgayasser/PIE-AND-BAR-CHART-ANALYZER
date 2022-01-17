function  M2 = LaplacianSharp()

M=zeros(3,3);
M(1,1)=-1;
M(1,2)=-1;
M(1,3)=-1;
M(2,1)=-1;
M(2,2)=9;
M(2,3)=-1;
M(3,1)=-1;
M(3,2)=-1;
M(3,3)=-1;
M2=M;

end

