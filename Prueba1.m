
% 
% delete(instrfind)
% clc
% 
% % K=serial('COM6','BaudRate',9600,'TimeOut',200,'Terminator','LF');
% % fopen(K);
% % L=1;
% % %fwrite(K,L,'int16');
% % p=fwrite(K,L);
% % fclose(K);
% 
% 
% 
% s = serial('COM6');
% fopen(s);
% fwrite(s, 1,'char');
% fclose(s);
% fprintf('FINE');


% a=arduino('COM5');
% methods(a);
% readDigitalPin(a,'D2')
% readVoltage(a,'A0')
% readPotentiometerUI(a)
% writeDigitalPin(a,'D13',1)
% writePWMVoltage(a,'D10',1)


p=readDigitalPin(a,'D2');
for i=1:51;
    if p==1;
        disp('No hay nada')
    else
        disp('coño esta activado');
        pause(.008333);
        disp('coño')
    end
end


