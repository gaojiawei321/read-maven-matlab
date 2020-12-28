function [t_sta,data_sta] = read_sta_moment(Ts,Te );
%UNTITLED 此处显示有关此函数的摘要
%   markus static cdf data


disk='H';
dat=datestr(Ts,31);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);
hs=dat(12:13);
hs=str2num(hs);
if hs<8
    Hs='00';
else if hs<16
        Hs='08';
    else Hs='16';
    end
end

fsta=[disk,':\STATIC_V5\cdf\'];
fname=dir([fsta 'mvn_sta_ae_mom_v05_r03_',Year,Month,Day,'_',Hs,'*']);
path_sta=[fsta,fname.name];
info_sta=spdfcdfinfo(path_sta);    
        
t_sta=spdfcdfread(path_sta,'Variables','Time');

% (30*1.6*10^-19*2/(1.67*10^-27)).^0.5/1000 = 75 km/s

v_p_h=spdfcdfread(path_sta,'Variables','vel_xyz_protons_high');
v_p_l=spdfcdfread(path_sta,'Variables','vel_xyz_protons_low');
v_o_h=spdfcdfread(path_sta,'Variables','vel_xyz_oxygen_high');
v_o_l=spdfcdfread(path_sta,'Variables','vel_xyz_oxygen_low');
v_o2_h=spdfcdfread(path_sta,'Variables','vel_xyz_mol_oxygen_high');
v_o2_l=spdfcdfread(path_sta,'Variables','vel_xyz_mol_oxygen_low');


d_p_h=spdfcdfread(path_sta,'Variables','den_protons_high');
d_p_l=spdfcdfread(path_sta,'Variables','den_protons_low');
d_o_h=spdfcdfread(path_sta,'Variables','den_oxygen_high');
d_o_l=spdfcdfread(path_sta,'Variables','den_oxygen_low');
d_o2_h=spdfcdfread(path_sta,'Variables','den_mol_oxygen_high');
d_o2_l=spdfcdfread(path_sta,'Variables','den_mol_oxygen_low');


 jie=find(t_sta>Ts&t_sta<Te);
 t_sta=t_sta(jie);
 
 voh=v_o_h(jie,:);
 vo2h=v_o2_h(jie,:);
 vph=v_p_h(jie,:);
 
 vol=v_o_l(jie,:);
 vo2l=v_o2_l(jie,:);
 vpl=v_p_l(jie,:);
 
 doh=d_o_h(jie,:);
 do2h=d_o2_h(jie,:);
 dph=d_p_h(jie,:);
 
 dol=d_o_l(jie,:);
 do2l=d_o2_l(jie,:);
 dpl=d_p_l(jie,:);
 
 %%    time vph voh vo2h dph doh do2h  vpl  vol vo2l dpl dol do2l ];
 %%      1  2-4 5-7 8-10  11  12 13  14-16 17-19 20-22 23 24  25
 
data_sta=[vph  voh vo2h dph doh do2h  vpl  vol vo2l dpl dol do2l ];

%data.t_sta=t_sta;
%data.vph=vph;
%data.voh=voh;
%data.vo2h=vo2h;
%data.dph=dph;
%data.doh=doh;
%data.do2h=do2h;

%data.vpl=vpl;
%data.vol=vol;
%data.vo2l=vo2l;
%data.dpl=dpl;
%data.dol=dol;
%data.do2l=do2l;


%z1=find(data<-1.0000e+30);
%data(z1)=NaN;


end

