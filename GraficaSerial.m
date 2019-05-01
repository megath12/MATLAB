Delete Opened Ports in MATLAB
delete(instrfind)
clc

Create a Serial Object
ser = serial('COM5', 'BaudRate',9600, 'Timeout',10);
DATA_SIZE = 50;
temperature = zeros(DATA_SIZE, 1);
% timestamp = zeros(DATA_SIZE, 1);
% timestamp = datetime(timestamp, timestamp, timestamp);
% for i = 1:DATA_SIZE
%    timestamp(i) = datetime;
% end
index = 1;
% Open Communication Port
fopen(ser);
while true
    temp = fscanf(ser);
    if size(temp) == [0][0]
        disp 'Timeout Occurs'
        disp 'Check Connections'
        break
    else
        if index < DATA_SIZE
            index = index+1;
        else
            % Reset Subscript Index
            index = 1;
        end
        temperature(index) = str2double(temp);
        % Time Stamp Temperature Values
        % timestamp(index) = datetime;
        % plot(timestamp, temperature, 'LineWidth',2,'Color',[0,0,1.0])
        plot(temperature, 'LineWidth',2,'Color',[0,0,1.0])
        ylim([0,30])
        xlabel('Tiempo(s) \rightarrow')
        ylabel('Distancia(cm)\rightarrow');
        title('Distancia- Tiempo  ');
        drawnow
    end
end



