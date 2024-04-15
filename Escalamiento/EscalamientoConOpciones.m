function EscalamientoConOpciones()
    while true
        % Cargar la señal de audio
        [AudioEscalamiento,frecuenciaEsc] = audioread('Audio-Escalamiento.aac');

        % Presentar las opciones al usuario
        fprintf('Opciones de velocidad de reproducción:\n');
        fprintf('1. 0.5 veces la velocidad normal.\n');
        fprintf('2. 0.8 veces la velocidad normal.\n');
        fprintf('3. Velocidad normal.\n');
        fprintf('4. 1.2 veces la velocidad normal.\n');
        fprintf('5. 1.5 veces la velocidad normal.\n');
        fprintf('6. 2 veces la velocidad normal.\n');

        % Solicitar al usuario que elija una opción
        opcion = menu('Seleccione una opción de velocidad de reproducción:', '0.5 veces', '0.8 veces', 'Normal', '1.2 veces', '1.5 veces', '2 veces');

        % Aplicar el escalamiento en el tiempo según la opción seleccionada
        switch opcion
            case 1
                velocidad = 0.5;
            case 2
                velocidad = 0.8;
            case 3
                velocidad = 1;
            case 4
                velocidad = 1.2;
            case 5
                velocidad = 1.5;
            case 6
                velocidad = 2;
            otherwise
                error('Opción no válida.');
        end

        % Calcular la nueva frecuencia de muestreo
        nueva_fs = frecuenciaEsc * velocidad;
        t1 = (0:length(AudioEscalamiento)-1) / frecuenciaEsc; % Dominio de tiempo para x1
        t2 = (0:length(AudioEscalamiento)-1) / nueva_fs; % Dominio de tiempo para x1
        
         figure;
            hold on;
            plot(t1, AudioEscalamiento);
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            title('Señal de audio Original - Dominio en el tiempo');
            legend('Señal NORMAL');
            hold off;
           figure;
            hold on;
            plot(t2, AudioEscalamiento);
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            title('Señal de audio Escalada - Dominio en el tiempo');
            legend('Señal ESCALADA');
            hold off;

        % Calcular la duración de la señal escalada
        duracion_esc = length(AudioEscalamiento) / frecuenciaEsc;

        % Reproducir la señal de audio escalada
        sound(AudioEscalamiento, nueva_fs);
        pause(duracion_esc + 1); % Pausa para permitir la reproducción completa antes de la siguiente

        % Preguntar al usuario si desea volver a seleccionar una opción
        opcion_volver = menu('¿Desea volver a seleccionar una opción?', 'Sí', 'No');

        if opcion_volver == 2
            break; % Salir del bucle y volver al menú principal
        end
    end
end