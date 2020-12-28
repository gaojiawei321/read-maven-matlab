function [ t_kp,e_d,e_t ] = read_kp_lpw( Ts ,Te)
%READ_KP_LPW 此处显示有关此函数的摘要
%   此处显示详细说明
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);
disk='G'
fc=[disk,':\maven\public\sci\kp\insitu\',Year,'\',Month,'\'];
fname=dir([fc 'mvn_kp_insitu_',Year,Month,Day,'*']);
fin=[fc,fname(1).name];
fid=fopen(fin,'r');
qian=fscanf(fid,'%s',49);
had=qian(227:229);

c=textscan(fid,' %s %f %s %s %f %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %f %s %s %s %s %s %s %s %s %s %s %s %s %f %f %f %f %f %f %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %f %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %f %f %f %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s','headerlines',str2num(had));

%               001002003004005006007008009010011012013014015016017018019020021022023024025026027028029030031032033034035036037038039040041042043044045046047048049050051052053054055056057058059060061062063064065066067068069070071072073074075076077078079080081082083084085086087088089090091092093094095096097098099100101102103104105106107108109110111112113114115116117118119120121122123124125126127128129130131132133134135136137138139140141142143144145146147148149150151152153154155156157158159160161162163164165166167168169170171172173174175176177178179180181182183184185186187188189190191192193194195196197198199200201202203204205206207208209210211212213214215216217218219220221222223224225226227228229230231232233234235236237238239240241242243244245246247248249250251252253254255256257258259260261262263264265266267268269270271272273274275276277278279280281282283284285286287288289290291292293294295296297298299300
fclose(fid);
Time_kp=cell2mat(c{1});
T_kp=datenum(str2num(Time_kp(:,1:4)),str2num(Time_kp(:,6:7)),str2num(Time_kp(:,9:10)),str2num(Time_kp(:,12:13)),str2num(Time_kp(:,15:16)),str2num(Time_kp(:,18:19)));

 jie=find(T_kp>Ts&T_kp<Te);
 t_kp=T_kp(jie);
e_d=c{2}(jie);
e_t=c{5}(jie);

end

