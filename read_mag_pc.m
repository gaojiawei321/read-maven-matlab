function [  t_pc, b_pc,r_pc ] = read_mag_pc( Ts, Te )
%READ_MAG 此处显示有关此函数的摘要
%   此处显示详细说明
dat=datestr(Ts,26);
Year=dat(1:4);
Month=dat(6:7);
Day=dat(9:10);
  disk='G';
        fc=[disk,':\maven_mat\'];
     %   fname=['ss',Year,Month,Day];
     %   fin=[fc,fname];
     %   load (fin)
        fname=['pc1s',Year,Month,Day];
        fpc=[fc,fname];
        load (fpc)

         %  B_mso=B_mso(1:32:length(B_mso),:);
    %    B_pc=B_pc(1:32:length(B_pc),:);        
    
        mat0=zeros(length(B_pc),1);     
        t_pc=datenum([B_pc(:,1),mat0,B_pc(:,7),mat0,mat0,mat0]);     
        jie=find(t_pc>Ts&t_pc<Te); 
        t_pc=t_pc(jie);
          b_pc=[B_pc(jie,8:10)];
          r_pc=[B_pc(jie,12:14)];
      
        
   %     Pc_x=B_pc(jie,12); Pc_y=B_pc(jie,13); Pc_z=B_pc(jie,14);
   %     bpc=[Pc_x,Pc_y,Pc_z]';
   %     cain_b=cain(bpc)';

end

