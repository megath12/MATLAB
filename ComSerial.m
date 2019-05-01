%Opened Ports in MATLAB
delete(instrfind)
clc
clear all

s=serial('COM5','BaudRate',9600,'TimeOut',200,'Terminator','LF');
fopen(s);
N=60;
for L=0:N;

k=fscanf(s);
fprintf(k);
% k1=str2double(k);
% n=stem(L,k1,'r');
% 
% xlabel('Tiempo(s) \rightarrow');
% ylabel('Distancia(cm)\rightarrow');
% title('Lectura ');
% axis([L-2 L+2 0 40]);
% grid on
% drawnow
pause(.05);
clc
end

fclose(s);
disp('Fin')


