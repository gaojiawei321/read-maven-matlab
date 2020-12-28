function [t_euv, d_euv] = read_euv( Ts,Te)
%READ_SWE_T 此处显示有关此函数的摘要
%   此处显示详细说明

  disk='G';
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);

  fswi=[disk,':\maven\public\sci\euv\l2\',Year,'\',Month,'\'];
fname=dir([fswi 'mvn_euv_l2_bands_',Year,Month,Day,'*']);
path_euv=[fswi,fname(1).name];
info_euv=spdfcdfinfo(path_euv);
t_euv=spdfcdfread(path_euv,'Variables','epoch');

d_euv=spdfcdfread(path_euv,'Variables','data');

f_euv=spdfcdfread(path_euv,'Variables','flag');
%dis_euv=spdfcdfread(path_euv,'Variables','maven_sun_distance');
%c_euv=spdfcdfread(path_euv,'Variables','counts');


 jie=find(t_euv>Ts&t_euv<Te);
 
   t_euv=t_euv(jie);
  d_euv=d_euv(jie,3);
  f_euv=f_euv(jie);
  
 nz=find(f_euv==0);  %flag 质量好--0
 t_euv=t_euv(nz);
 d_euv=d_euv(nz);
 


  

end

