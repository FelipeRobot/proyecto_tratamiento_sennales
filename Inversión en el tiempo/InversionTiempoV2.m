function InversionTiempoV2()
    while true
        % Crear un bucle para permitir al usuario seleccionar la señal de voz
        while true
            % Cargar las tres señales de voz
            [y1,fr1] = audioread('Odio la luz al oído.aac');
            [y2,fr2] = audioread('Anita_Lava_La_Tina.m4a');
            [y3,fr3] = audioread('A_Mercedes_Ese_De_Crema (1).m4a');

            % Crear un menú desplegable para que el usuario seleccione la señal de voz
            opcion_signal = menu('Seleccione una señal de voz:', 'Odio la luz azul al oído', 'Anita lava la tina', 'A Mercedes ese de crema');

            % Seleccionar la señal de voz según la opción elegida
            switch opcion_signal
                case 1
                    x = y1;
                    fs = fr1;
                    frase = 'Odio la luz azul al oído';
                    break; % Salir del bucle y continuar con la siguiente acción
                case 2
                    x = y2;
                    fs = fr2;
                    frase = 'Anita lava la tina';
                    break; % Salir del bucle y continuar con la siguiente acción
                case 3
                    x = y3;
                    fs = fr3;
                    frase = 'A Mercedes ese de crema';
                    break; % Salir del bucle y continuar con la siguiente acción
                otherwise
                    error('Opción no válida.');
            end
        end
        x_invertida = flipud(x);
        t0 = (0:length(x)-1) / fs;
         figure;
            hold on;
            plot(t0, x_invertida); 
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            title('Señal de audio Invertida - Dominio en el tiempo');
            legend('Señal Modificada');
            hold off;
           figure;
            hold on;
            plot(t0, x); 
            xlabel('Tiempo (s)');
            ylabel('Amplitud');
            title('Señal de audio Original - Dominio en el tiempo');
            legend('Señal Original');
            hold off;
        
        % Crear un menú desplegable para permitir al usuario seleccionar qué acción realizar
        opcion_action = menu('Seleccione una acción:', 'Escuchar la señal original', 'Escuchar la señal invertida', 'Volver al menú principal');

        % Realizar la acción seleccionada por el usuario
        switch opcion_action
            case 1
                sound(x, fs);
                pause(length(x) / fs + 1); % Pausa para permitir la reproducción completa antes de continuar
            case 2
                sound(x_invertida, fs);
                pause(length(x_invertida) / fs + 1); % Pausa para permitir la reproducción completa antes de continuar
            case 3
                break; % Salir del bucle y volver al menú principal
            otherwise
                error('Opción no válida.');
        end
    end
end