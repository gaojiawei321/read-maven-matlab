function [ Year Month  Day] = date2str( year,month,day )
%DATE2STR �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
 Year=num2str(year);
        if day<10            
            Day=['0',num2str(day)];
        else
            Day=num2str(day);
        end
        if month<10
            Month=['0',num2str(month)];
        else
            Month=num2str(month);
        end

end

