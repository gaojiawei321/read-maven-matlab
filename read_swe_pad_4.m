function [t_pa, hp] = read_swe_pad2( Ts,Te,emin,emax)
%READ_SWEA_PAD 此处显示有关此函数的摘要
%   此处显示详细说明
 disk='G';
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);

 fswe=[disk,':\maven\public\sci\swe\l2\',Year,'\',Month,'\'];
fname=dir([fswe 'mvn_swe_l2_svypad_',Year,Month,Day,'*']);
path_swe=[fswe,fname(1).name];
info=spdfcdfinfo(path_swe);
varname=info.Variables;
t_pa=spdfcdfread(path_swe,'Variables','epoch');
pa=spdfcdfread(path_swe,'Variables','pa');
diff_en_fluxes=spdfcdfread(path_swe,'Variables','diff_en_fluxes');
energy_swe=spdfcdfread(path_swe,'Variables','energy');

jie=find(t_pa>Ts&t_pa<Te);
  t_pa=t_pa(jie);
  pa=pa(:,:,jie);
  diff_en_fluxes=diff_en_fluxes(:,:,jie);


norm_pa=zeros(16,length(t_pa));
flux_en=zeros(16,length(t_pa));
 pa_en=zeros(16,length(t_pa));
 for i=1:length(t_pa)  
         flux_en(:,i)= nanmean(diff_en_fluxes(:,emin:emax,i),2);
         pa_en(:,i)= nanmean(pa(:,emin:emax,i),2);      
         norm_pa(:,i)=double(flux_en(:,i)/nanmean(flux_en(:,i)));
 end
%norm=mean(pa_flux)

%norm_pa(1:16,:)=double(flux_en(:,)/nanmean(flux_en(:)));
hp=zeros(36,length(pa));

for t=1:length(t_pa)
  try
       [p_jiao,sun]=sort(pa_en(:,t))
    p_norm=norm_pa(sun);
       
    pn=p_norm(~isnan(p_norm));
    jn=p_jiao(~isnan(p_norm));
    
        d=0:5:175;
        hp(:,t)=interp1(pn,jn,d,'linear');
  end   
end
  
        

end

