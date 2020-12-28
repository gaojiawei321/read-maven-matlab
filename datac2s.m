function [ N ] = datac2s( x,y,z,tposn,pposn )
%datac2s 将z坐标系下的数据转换成q坐标系下。
% tposn  pposn theta 与phi 角度。弧度制
%输出 N=[Bx,By,Bz]
cp=cos(pposn);
sp=sin(pposn);
ct=cos(tposn);
st=sin(tposn);
%转换矩阵为

N=[(st.*cp.*x'+st.*sp.*y'+ct.*z');
    -(-ct.*cp.*x'-ct.*sp.*y'+st.*z');
    -(sp.*x'-cp.*y')];
end

