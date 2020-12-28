function [t_pa,energy_swe,x,z,d,wx,wz,wd] = read_swe_pad_energy( disk,Tin)
%READ_SWEA_PAD 此处显示有关此函数的摘要
%   此处显示详细说明
dat=datestr(Tin,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);

 fswe=[disk,':\maven\public\sci\swe\l2\',Year,'\',Month,'\'];
fname=dir([fswe 'mvn_swe_l2_arcpad_',Year,Month,Day,'*']);
path_swe=[fswe,fname(1).name];
info=spdfcdfinfo(path_swe);
varname=info.Variables;
t_pa=spdfcdfread(path_swe,'Variables','epoch');
pa=spdfcdfread(path_swe,'Variables','pa');
diff_en_fluxes=spdfcdfread(path_swe,'Variables','diff_en_fluxes');
energy_swe=spdfcdfread(path_swe,'Variables','energy');

counts=spdfcdfread(path_swe,'Variables','counts');
[ha,jie]=min(abs(t_pa-Tin));

  t_pa=t_pa(jie);
  pa=pa(:,:,jie);
  diff_en_fluxes=diff_en_fluxes(:,:,jie);
  counts=counts(:,:,jie);
  
  jx=45;
  jd=180-jx;
  
    for j=1:64
        
    xiao=find(pa(:,j)<jx);
zhong=find(pa(:,j)>jx&pa(:,j)<jd);
da=find(pa(:,j)>jd);

x(j)=nanmean(diff_en_fluxes(xiao,j));
z(j)=nanmean(diff_en_fluxes(zhong,j));
d(j)=nanmean(diff_en_fluxes(da,j));

wx(j)=nanstd(diff_en_fluxes(xiao,j));
wz(j)=nanstd(diff_en_fluxes(zhong,j));
wd(j)=nanstd(diff_en_fluxes(da,j));



    end
    
    









end

