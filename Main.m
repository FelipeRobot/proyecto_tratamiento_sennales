% Agrega las rutas de acceso a las carpetas necesarias para el programa.

addpath('actividades_preparacion\');
addpath('Respuesta Impulso\');
addpath('Inversión en el tiempo\');
addpath('Escalamiento\');
addpath('impulsoMundoFísico\');

% Llama a la función principal del programa.
main();

% Función principal del programa.

function main()
state_holder(); % Llama a la función para mostrar el menú.
end

% Función para mostrar el menú y gestionar las opciones seleccionadas.
function state_holder()
% Mensaje para mostrar en el menú.
    msg = " PRIMER PROYECTO MATLAB SEÑALES Y SISTEMAS _ FELIPE USECHE  & JUAN CONRADO";
% Crea el menú con las opciones disponibles.
    state = menu( msg,'Ejecución actividades preparación' ,'Escalamiento', 'Inversión en tiempo','Respuesta impulso', 'Impulso mundo físico' );
    
% Realiza una acción según la opción seleccionada.
        switch state 
            case 1
                actividades_previas();% Llama a la función para ejecutar actividades de preparación.
                main();% Vuelve al menú principal.
            case 2
                EscalamientoConOpciones(); % Llama a la función para el escalamiento con opciones.
                main();% Vuelve al menú principal.
            case 3
                InversionTiempoV2();% Llama a la función para la inversión en el tiempo.
                main();% Vuelve al menú principal.
            case 4 
                impulso();% Llama a la función para la respuesta al impulso.
                main();% Vuelve al menú principal.
            case 5
                impulsoVaso(); % Llama a la función para el impulso en un mundo físico.
                main();% Vuelve al menú principal.
        end
end