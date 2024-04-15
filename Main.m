%Agregado direeciones de archivos

addpath('actividades_preparacion\');
addpath('Respuesta Impulso\');
addpath('Inversión en el tiempo\');
addpath('Escalamiento\');
addpath('impulsoMundoFísico\');

main();

%Declaración del main

function main()
state_holder(); %llamado del menú

end

function state_holder()
    msg = " PRIMER PROYECTO MATLAB SEÑALES Y SISTEMAS _ FELIPE USECHE  & JUAN CONRADO";
    state = menu( msg,'Ejecución actividades preparación' ,'Escalamiento', 'Inversión en tiempo','Respuesta impulso', 'Impulso mundo físico' );
    
        switch state 
            case 1
                actividades_previas();
                main();
            case 2
                EscalamientoConOpciones();
                main();
            case 3
                InversionTiempoV2();
                main();
            case 4 
                impulso();
                main();
            case 5
                impulsoVaso();
                main();
        end
end