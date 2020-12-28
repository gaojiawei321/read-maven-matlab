function [t_swe, energy_swe, e_swe ] = read_swe_T( Ts,Te)
%READ_SWE_T �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

  disk='G';
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);

  fswe=[disk,':\maven\public\sci\swe\l2\',Year,'\',Month,'\'];
fname=dir([fswe 'mvn_swe_l2_svy3d_',Year,Month,Day,'*']);
path_swe=[fswe,fname(1).name];
info_swe=spdfcdfinfo(path_swe);







end

