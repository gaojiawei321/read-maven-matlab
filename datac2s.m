function [ N ] = datac2s( x,y,z,tposn,pposn )
%datac2s ��z����ϵ�µ�����ת����q����ϵ�¡�
% tposn  pposn theta ��phi �Ƕȡ�������
%��� N=[Bx,By,Bz]
cp=cos(pposn);
sp=sin(pposn);
ct=cos(tposn);
st=sin(tposn);
%ת������Ϊ

N=[(st.*cp.*x'+st.*sp.*y'+ct.*z');
    -(-ct.*cp.*x'-ct.*sp.*y'+st.*z');
    -(sp.*x'-cp.*y')];
end

