function [t_pa, hp] = read_swe_pad( Ts,Te,emin,emax)
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


b_azim=spdfcdfread(path_swe,'Variables','b_azim');
b_elev=spdfcdfread(path_swe,'Variables','b_elev');


jie=find(t_pa>Ts&t_pa<Te);
  t_pa=t_pa(jie);
  pa=pa(:,:,jie);
  diff_en_fluxes=diff_en_fluxes(:,:,jie);
  
b_azim=b_azim(jie);
b_elev=b_elev(jie);


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
sz=size(pa)


hp=zeros(36,sz(3));
for t=1:length(t_pa)
    for i=1:36

            imin=i*5-5;
            imax=i*5;
            
            a=find(imin<pa_en(:,t)&imax>pa_en(:,t));
            hp(i,t)=nanmean(norm_pa(a,t));
     
        
    end
end
  
  
for t=1:length(t_pa)
    
    p1=isnan(hp(:,t))-1;
    p2=find(p1==-1);
  %  p2(1)
    
    
    for pa=1:36-p2(1)
        spa=37-pa;
        p=hp(spa,t);    %从最上面开始，不是nan就向下赋值一个、、、
        
        if isnan(p)
            
        else
            
            te=0;
            p1=hp(spa-1,t);
            
            while isnan(p1)
                
                if spa-te-2==0
                    hp(spa-1-te,t)=hp(spa,t);
                    p1=1;
                else
                    hp(spa-1-te,t)=hp(spa,t);
                    p1=hp(spa-2-te,t);   
                    te=te+1;
                end
                
                
            end
        end
    end
end

end

