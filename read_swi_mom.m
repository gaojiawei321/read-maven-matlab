function [t_swi, d_swi, p_swi,v_swi, T_swi ] = read_swi_mom( Ts,Te)
%READ_SWE_T 此处显示有关此函数的摘要
%   此处显示详细说明

  disk='G';
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);

  fswi=[disk,':\maven\public\sci\swi\l2\',Year,'\',Month,'\'];
fname=dir([fswi 'mvn_swi_l2_onboardsvymom_',Year,Month,Day,'*']);
path_swi=[fswi,fname(1).name];
info_swi=spdfcdfinfo(path_swi);
t_swi=spdfcdfread(path_swi,'Variables','epoch');
d_swi=spdfcdfread(path_swi,'Variables','density');
p_swi=spdfcdfread(path_swi,'Variables','pressure');
v_swi=spdfcdfread(path_swi,'Variables','velocity_mso');
T_swi=spdfcdfread(path_swi,'Variables','temperature_mso');

%q_swi=spdfcdfread(path_swi,'Variables','quality_flag');


 jie=find(t_swi>Ts&t_swi<Te);
  t_swi1=t_swi(jie);
  d_swi1=d_swi(jie);
  p_swi1=p_swi(jie,:);
  v_swi1=v_swi(jie,:);
  T_swi1=T_swi(jie,:);
  
  [t_swi,a1,b1]=unique(t_swi1);
  d_swi=d_swi1(a1,:);
  p_swi=p_swi1(a1,:);
  v_swi=v_swi1(a1,:);
  T_swi=T_swi1(a1,:);
  
  

end

