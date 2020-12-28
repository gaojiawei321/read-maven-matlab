function [t_lpw, data ] = read_lpw_nt( Ts,Te)
%READ_SWE_T 此处显示有关此函数的摘要
%   此处显示详细说明

  disk='G';
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);

  fswi=[disk,':\maven\public\sci\lpw\l2\',Year,'\',Month,'\'];
fname=dir([fswi 'mvn_lpw_l2_lpnt_',Year,Month,Day,'_v03_*']);
path_lpw=[fswi,fname(1).name];
info_lpw=spdfcdfinfo(path_lpw);

%ne [cc]::te [K]::usc [V]::ne_hi [cc]::vsc_hi [V]::not used yet::not used yet::not used yet::not used yet::not used yet
%Integers: The uncertainty of the values with a scale of 0-100. 100 is the best quality.  Use data with flag value above 50. #  The 5 digit decimal number represent a binary number containing information of specific atticue and sc activities. For all numbers see instrument SIS.
 
t_lpw=spdfcdfread(path_lpw,'Variables','epoch');
data=spdfcdfread(path_lpw,'Variables','data');
%ddata_lo=spdfcdfread(path_lpw,'Variables','ddata_lo');
%ddata_up=spdfcdfread(path_lpw,'Variables','ddata_up');
flag=spdfcdfread(path_lpw,'Variables','flag');
%info=spdfcdfread(path_lpw,'Variables','info');


%q_swi=spdfcdfread(path_swi,'Variables','quality_flag');


  z1=find(flag>50);
  t_lpw=t_lpw(z1);
  data=data(z1,:);

 jie=find(t_lpw>Ts&t_lpw<Te);
  t_lpw=t_lpw(jie);
  data=data(jie,:);


  

end

