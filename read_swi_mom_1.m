function [t_swi, n_swi, p_swi,v_swi, T_swi,q_swi,T_mod ] = read_swi_mom_1( Ts,Te)
%READ_SWE_T 此处显示有关此函数的摘要
%   此处显示详细说明

%disk='/Users/gaojiawei';
disk='G';
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);

%fswi=[disk,'/maven/data/sci/swi/mom/MAVEN_',Year,'/',Month,'/'];
%fname=dir([fswi 'mvn_swi_l2_onboardsvymom_',Year,Month,Day,'*']);


fswi=[disk,':\maven\public\sci\swi\l2\',Year,'\',Month,'\'];
fname=dir([fswi 'mvn_swi_l2_onboardsvymom_',Year,Month,Day,'*']);

path_swi=[fswi,fname(1).name];
info_swi=spdfcdfinfo(path_swi);
t_swi=spdfcdfread(path_swi,'Variables','epoch');
n_swi=spdfcdfread(path_swi,'Variables','density');
p_swi=spdfcdfread(path_swi,'Variables','pressure');
v_swi=spdfcdfread(path_swi,'Variables','velocity_mso');
T_swi=spdfcdfread(path_swi,'Variables','temperature_mso');

T_mod=spdfcdfread(path_swi,'Variables','telem_mode');

%p_label=spdfcdfread(path_swi,'Variables','p_label');
% Pxx Pyy Pzz Pxy Pxz Pyz
% Tx Ty Tz

%pindex=spdfcdfread(path_swi,'Variables','pindex');


q_swi=spdfcdfread(path_swi,'Variables','quality_flag');


 jie=find(t_swi>Ts&t_swi<Te);
  t_swi=t_swi(jie);
  n_swi=n_swi(jie);
  p_swi=p_swi(jie,:);
  v_swi=v_swi(jie,:);
  T_swi=T_swi(jie,:);
  q_swi=q_swi(jie,:);
  T_mod=T_mod(jie);

end

