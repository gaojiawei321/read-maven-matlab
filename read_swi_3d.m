function [  t_swi, energy_swi, e_swi] = read_swi_3d(  Ts,Te )
%READ_SWIA_ 此处显示有关此函数的摘要
%   此处显示详细说明
disk='G';
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);

     fswi=[disk,':\maven\public\sci\swi\l2\',Year,'\',Month,'\'];
fname=dir([fswi 'mvn_swi_l2_coarsearc3d_',Year,Month,Day,'*']);
path_swi=[fswi,fname(1).name];
info_swi=spdfcdfinfo(path_swi);



end

