% Inicialización de la variable flag para el bucle principal
flag = 1;
% Bucle principal que permite al usuario interactuar con las señales de audio
while flag == 1
 % Cargar la señal de audio principal y la señal de impulso
[audio, fs1] = audioread('Audio.aac');
[impulso, fs2] = audioread('impulso.aac');

 % Presentar al usuario un menú de opciones
state = menu('Seleccione una opción: ','Escuchar audio original' ,'Escuchar impulso', 'Escuchar respuesta', 'salir al menú principal');
% Realizar acciones según la opción seleccionada por el usuario

switch state
    case 1
         % Reproducir y graficar la señal de audio original
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
        % Reproducir y graficar la señal de impulso
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
       % Calcular y reproducir la convolución de la señal de audio y la señal de impulso
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
        % Salir del bucle y volver al menú principal
        flag = 0;
        
end
end