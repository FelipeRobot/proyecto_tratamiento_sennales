
flag = 1;
while flag == 1

[audio, fs1] = audioread('Audio.aac');
[impulso, fs2] = audioread('impulso.aac');

state = menu('Seleccione una opción: ','Escuchar audio original' ,'Escuchar impulso', 'Escuchar respuesta', 'salir al menú principal');
switch state
    case 1
        sound(audio,fs1);
        figure;
            hold on;
            t0 = (0:length(audio)-1) / fs1;
            plot(t0, audio); 
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            title('Señal de audio - Dominio en el tiempo');
            hold off;
    case 2
        sound(impulso, fs2);  
        figure;
            hold on;
            t0 = (0:length(impulso)-1) / fs2;
            plot(t0, impulso); 
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            title('Señal de audio - Dominio en el tiempo');
            hold off;
    case 3
       y_impulso = conv(audio(:), impulso(:));
       sound(y_impulso, fs1);
        figure;
            hold on;
            t0 = (0:length(y_impulso)-1) / fs1;
            plot(t0, y_impulso); 
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            title('Señal de audio - Dominio en el tiempo');
            legend('Señal Modificada');
            hold off;
    case 4 
        flag = 0;
        
end
end