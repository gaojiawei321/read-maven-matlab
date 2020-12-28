function [ t_sta, m_sta ] = read_sta_m(Ts,Te)
%READ_MAV_STA_E  %load static m
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
%data=spdfcdfread(path_sta,'Variables','data');
data=spdfcdfread(path_sta,'Variables','eflux');




  jie=find(t_sta>Ts&t_sta<Te);
  data=data(:,:,jie);
   t_sta=t_sta(jie);
          for j=1:64
             sum_e(j,:)=sum(data(j,:,:));
        end
        
        
   m_sta=double(log10(sum_e));
   sta_nan= find(m_sta==-inf);
   m_sta( sta_nan)=NaN;




end

