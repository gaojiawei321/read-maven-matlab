function [t_sta,v_sta ] = read_sta_speed( Ts ,Te)
%READ_SPEED_STA 此处显示有关此函数的摘要
%   此处显示详细说明
disk='G';
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);
 fsta=[disk,':\maven\public\sci\sta\l2\',Year,'\',Month,'\'];
fname=dir([fsta 'mvn_sta_l2_c6-32e64m_',Year,Month,Day,'*']);
path_sta=[fsta,fname.name];
info_sta=spdfcdfinfo(path_sta);
t_sta=spdfcdfread(path_sta,'Variables','epoch');

quat_mso=spdfcdfread(path_sta,'Variables','quat_mso');

%data=spdfcdfread(path_sta,'Variables','data');

data=spdfcdfread(path_sta,'Variables','eflux');


 jie=find(t_sta>Ts&t_sta<Te);
 t_sta=t_sta(jie);
  data=data(:,:,jie);
  
  
  %sum(data)
  
          for j=1:64
             mean_e(j,:)=nanmean(data(j,:,:));
          end
          
        
          for j=1:64
              ev1=  mean_e(1,:);
              nj1=ev1*1.6*10^-19;
              v1=(nj1.*2/((1.672.*10^-27)*j)).^0.5;
              
             v_sta(j,:)=v1;
             
          end
  
        
          
%ev1=  mean_e(1,1)
%nj1=ev1*1.6*10^-19;
%v1=(nj1*2/(1.672*10^-27))^0.5;




end

