%% Este es un script con funcion estandarizacion(), con objetivo de 
%  estandarizar los datos entregados.

%% PROGRAMA PRINCIPAL
function [Xs,ys] = estandarizacion(X,y)
    Xstd = std(X);
    Xprom = mean(X);
    Xs = (X - Xprom) ./ Xstd; % Estandarizar los datos
    % Estandarizar la variable dependiente
    ystd = std(y);
    yprom = mean(y);
    ys = (y - yprom) ./ ystd; % Estandarizar la variable dependiente
end