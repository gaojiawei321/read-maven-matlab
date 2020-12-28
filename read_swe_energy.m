function [ t_swe, energy_swe, e_swe ] = read_swe_energy( Ts,Te )
%READ_SWEA_ENERGY 此处显示有关此函数的摘要
%   此处显示详细说明
  disk='G';
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);

  fswe=[disk,':\maven\public\sci\swe\l2\',Year,'\',Month,'\'];
fname=dir([fswe 'mvn_swe_l2_svyspec_',Year,Month,Day,'*']);
path_swe=[fswe,fname(1).name];
info_swe=spdfcdfinfo(path_swe);
%varname=info.Variables;

t_swe=spdfcdfread(path_swe,'Variables','epoch');
energy_swe=spdfcdfread(path_swe,'Variables','energy');
e_swe=spdfcdfread(path_swe,'Variables','diff_en_fluxes');
c_swe=spdfcdfread(path_swe,'Variables','counts');


 jie=find(t_swe>Ts&t_swe<Te);
  t_swe=t_swe(jie);
 e_swe=e_swe';
  e_swe=e_swe(:,jie);
  e_swe=(log10(e_swe));
  e_swe= double(e_swe);
 swe_nan= find(e_swe==-inf);
   e_swe( swe_nan)=NaN;
end

