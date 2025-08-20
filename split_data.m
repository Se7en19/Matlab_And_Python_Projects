%% Este algoritmo divide una base de datos dependiendo a la tasa de
%  division que se da a la funcion split().

% A CONSIDERAR:
% X, y deben pasar por el proceso de ''limpieza'' de modo que al entrar a
% la funcion split_data, la matriz de caracteristicas (X) y el vector de
% salidas (y) no deben contener valores NaN's.
%% Programa principal
function [X_train, X_test, y_train, y_test] =...
    split_data(X,y,split_rate)
% calculamos el numero de mediciones 
    [m,~] = size(X);
% Determinamos el indice de division.
    ind = round(m*split_rate);
% Dividimos los datos en conjuntos de entrenamiento y prueba
    X_train = X(1:ind, :);
    X_test = X(ind+1:end, :);
    y_train = y(1:ind);
    y_test = y(ind+1:end);
end
