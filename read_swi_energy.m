function [  t_swi, energy_swi, e_swi] = read_swi_energy(  Ts,Te )
%READ_SWIA_ 此处显示有关此函数的摘要
%   此处显示详细说明
disk='G';
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);

     fswi=[disk,':\maven\public\sci\swi\l2\',Year,'\',Month,'\'];
fname=dir([fswi 'mvn_swi_l2_onboardsvyspec_',Year,Month,Day,'*']);
path_swi=[fswi,fname(1).name];
info_swi=spdfcdfinfo(path_swi);

t_swi=spdfcdfread(path_swi,'Variables','epoch');
e_swi=spdfcdfread(path_swi,'Variables','spectra_diff_en_fluxes');
energy_swi=spdfcdfread(path_swi,'Variables','energy_spectra');


 jie=find(t_swi>Ts&t_swi<Te);
  t_swi=t_swi(jie);
 e_swi=e_swi';
  e_swi=e_swi(:,jie);
  e_swi=(log10(e_swi));
  e_swi= double(e_swi);
 swe_nan= find(e_swi==-inf);
   e_swi( swe_nan)=NaN;

end

