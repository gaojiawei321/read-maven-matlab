function   [ t_mso,b_mso,v_s] = read_speed( disk, Ts ,Te);
%READ_KP_SPEE 此处显示有关此函数的摘要
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
          
         mso_x=B_mso(jie,12);  mso_y=B_mso(jie,13);mso_z=B_mso(jie,14);
      
      %   vx=diff(mso_x)*32;
      %   vy=diff(mso_y)*32;
      %  vz=diff(mso_z)*32;
          vx=diff(mso_x);
         vy=diff(mso_y);
         vz=diff(mso_z);
         
        v_s=[vx,vy,vz];
        v_s(end+1,:)=v_s(end,:);
end

