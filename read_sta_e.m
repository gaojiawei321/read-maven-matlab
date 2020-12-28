function [ t_sta, e_sta, energy_sta ] = read_sta_e(Ts,Te)
%READ_MAV_STA_E  %load static energy
disk='G';
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);

fsta=[disk,':\maven\public\sci\sta\l2\',Year,'\',Month,'\'];
fname=dir([fsta 'mvn_sta_l2_c0-64e2m_',Year,Month,Day,'*']);
path_sta=[fsta,fname.name];
info_sta=spdfcdfinfo(path_sta);

t_sta=spdfcdfread(path_sta,'Variables','epoch');
%data=spdfcdfread(path_sta,'Variables','data');
data=spdfcdfread(path_sta,'Variables','eflux');

   energy=spdfcdfread(path_sta,'Variables','energy');   
   
    en=energy(:,:,1);
    energy_sta=sum(en,2)/27;
    
  jie=find(t_sta>Ts&t_sta<Te);
  t_sta=t_sta(jie);
  data=data(:,:,jie);
 
  e_sta=shiftdim(data(1,:,:));
   e_sta=double(e_sta);
   e_sta=log10(e_sta);
     sta_nan= find(e_sta==-inf);
         e_sta( sta_nan)=NaN;

end

