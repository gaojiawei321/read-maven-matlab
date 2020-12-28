function [  t_mso, b_mso,r_mso ] = read_mag_mso_1(  Ts, Te )
%function [  t_mso, b_mso,r_mso, bc, bp, cain_b  ] = read_mag(  Ts, Te )
%READ_MAG 此处显示有关此函数的摘要
%   此处显示详细说明
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);
%Rm=3389;

global B_mso_1s

% laod B_mso_1s

  %disk='/Volumes/H';
  %      fc=[disk,'/maven_mat/'];
  %      fname=['ss',Year,Month,Day];
  %      fin=[fc,fname];
  %      load (fin)
     %   fname=['pc',Year,Month,Day];
     %   fpc=[fc,fname];
     %   load (fpc)

         %  B_mso=B_mso(1:32:length(B_mso),:);
      %  B_pc=B_pc(1:32:length(B_pc),:);        
      %  mat0=zeros(length(B_mso),1);     
      %  t_mso=datenum([B_mso(:,1),mat0,B_mso(:,7),mat0,mat0,mat0]); 
        
     %  t_mso=1; 
        
        jie=find(B_mso_1s.time>Ts&B_mso_1s.time<Te); 
        t_mso=B_mso_1s.time(jie);
        b_mso=B_mso_1s.B(jie,:);
        r_mso=B_mso_1s.mso(jie,:);
        
   %      mso_x=B_mso(jie,12);  mso_y=B_mso(jie,13);mso_z=B_mso(jie,14);
   %     mso_Bx=B_mso(jie,8);mso_By=B_mso(jie,9);mso_Bz=B_mso(jie,10);
   %       B_mso=[mso_Bx mso_By mso_Bz];
   %       b_mso=B_mso;
      %  Mso_Bt=(mso_Bx.^2+mso_By.^2+mso_Bz.^2).^0.5;
   %     r_mso=[mso_x mso_y  mso_z];
        
        
        
      %  R=(mso_x.^2+mso_y.^2+mso_z.^2).^0.5;
      %  H=R-Rm;
      %  bc=zeros(1,length(B_mso));
      %  for i=1:length(B_mso)
      %  bc(i)=dot(B_mso(i,1:3),r_mso(i,1:3))/R(i);
      %  end
      %  bc=bc';
      %  bp=(Mso_Bt.^2-bc.^2).^0.5;
      %  Pc_x=B_pc(jie,12); Pc_y=B_pc(jie,13); Pc_z=B_pc(jie,14);
      %  bpc=[Pc_x,Pc_y,Pc_z]';
  %      cain_b=cain(bpc)';

end

