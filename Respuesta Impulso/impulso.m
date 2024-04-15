%-----respuesta impulso


% Función principal para gestionar la respuesta al impulso.
function impulso()
    addpath('main\');% Agrega la ruta de acceso a la carpeta principal.
while true 
    % Menú de opciones para el usuario.
    current_state = menu('Seleccione una opción','Audio original', 'Respuesta impulso 1','Respuesta impulso 2','Respuesta impulso 3','Respuesta impulso 4' ,'Volver al menú principal');
    % Acciones según la opción seleccionada.
    switch current_state
        case 1
            [audio, fs1] = audioread('Respuesta impulso.aac');% Lee el audio original.
            sound(audio,fs1);% Reproduce el audio.
            impulso();% Vuelve al menú de respuesta al impulso.
        case 2
            impulso1 =audioread('MMR.wav'); % Lee la respuesta al impulso 1.
            respuesta_impulso(impulso1);% Calcula y reproduce la convolución
            impulso();% Vuelve al menú de respuesta al impulso.
        case 3
            impulso2 =audioread('SLIT_FV_E001_M2S.wav');% Lee la respuesta al impulso 2.
            respuesta_impulso(impulso2);% Calcula y reproduce la convolución.
            impulso();% Vuelve al menú de respuesta al impulso.
        case 4
            impulso3 =audioread('SLIT_MDA_E001_M2S.wav'); % Lee la respuesta al impulso 3.
            respuesta_impulso(impulso3);% Calcula y reproduce la convolución.
            impulso();% Vuelve al menú de respuesta al impulso.
        case 5
            impulso4 =audioread('SLIT_SC_E001_M2S.wav');% Lee la respuesta al impulso 4.
            respuesta_impulso(impulso4);% Calcula y reproduce la convolución.
            impulso();% Vuelve al menú de respuesta al impulso.
        case 6
           break;% Salir del bucle y volver al menú principal.
         
    end
end
end
% Función para calcular la convolución de la señal de impulso con el audio original.
    function respuesta_impulso(sennal_impulso)

        [audio, fs1] = audioread('Respuesta impulso.aac');% Lee el audio original.
        y_impulso = conv(audio(:), sennal_impulso(:));% Calcula la convolución.
        sound(y_impulso,fs1); % Reproduce la señal resultante

    end