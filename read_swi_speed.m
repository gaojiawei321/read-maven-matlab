function [ t_mso,b_mso,t_swi,v_mso ] = read_swi_speed(  Ts ,Te )
%READ_SPEED_SWE 此处显示有关此函数的摘要
%   此处显示详细说明
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);
Rm=3389;
  disk='G';
        fc=[disk,':\maven_mat\'];
        fname=['ss',Year,Month,Day];
        fin=[fc,fname];
        load (fin)
    %    fname=['pc',Year,Month,Day];
    %    fpc=[fc,fname];
    %    load (fpc)
        B_mso=B_mso(1:32:length(B_mso),:);
      %  B_pc=B_pc(1:32:length(B_pc),:); 
         mat0=zeros(length(B_mso),1);     
        t_mso=datenum([B_mso(:,1),mat0,B_mso(:,7),mat0,mat0,mat0]);     
        jie=find(t_mso>Ts&t_mso<Te); 
        t_mso=t_mso(jie);
          mso_Bx=B_mso(jie,8);mso_By=B_mso(jie,9);mso_Bz=B_mso(jie,10);
          b_mso=[mso_Bx mso_By mso_Bz];

   fswi=[disk,':\maven\public\sci\swi\l2\',Year,'\',Month,'\'];
fname=dir([fswi 'mvn_swi_l2_onboardsvymom_',Year,Month,Day,'*']);
path_swi=[fswi,fname(1).name];
info=spdfcdfinfo(path_swi);
        
        
        
t_swi=spdfcdfread(path_swi,'Variables','epoch');

        
v_mso=spdfcdfread(path_swi,'Variables','velocity_mso');


d=spdfcdfread(path_swi,'Variables','density');
        
   jie=find(t_swi>Ts&t_swi<Te);
   t_swi=t_swi(jie);
   v_mso=v_mso(jie,:);
   
     d=d(jie);
     
        

end

