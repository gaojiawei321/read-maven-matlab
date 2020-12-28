function [t_sta,n_p_h,n_o_h,n_o2_h] = read_sta_moment(Ts,Te )
%UNTITLED 此处显示有关此函数的摘要
%   markus static cdf data


disk='D';
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

fsta=[disk,':\staticdata\mom5\cdf\'];
fname=dir([fsta 'mvn_sta_ae_mom5_',Year,Month,Day,'_',Hs,'*']);
path_sta=[fsta,fname.name];
info_sta=spdfcdfinfo(path_sta);    
        
t_sta=spdfcdfread(path_sta,'Variables','Time');

n_p_h=spdfcdfread(path_sta,'Variables','den_protons_high');
n_p_l=spdfcdfread(path_sta,'Variables','den_protons_low');
n_o_h=spdfcdfread(path_sta,'Variables','den_oxygen_high');
n_o_l=spdfcdfread(path_sta,'Variables','den_oxygen_low');
n_o2_h=spdfcdfread(path_sta,'Variables','den_mol_oxygen_high');
n_o2_l=spdfcdfread(path_sta,'Variables','den_mol_oxygen_low');

 jie=find(t_sta>Ts&t_sta<Te);
 t_sta=t_sta(jie);
 n_o_h=n_o_h(jie,:);
 n_o2_h=n_o2_h(jie,:);
 n_p_h=n_p_h(jie,:);
 



end

