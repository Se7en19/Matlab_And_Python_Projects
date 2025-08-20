%% Este script tiene la funcion de limpiar los posibles valores NaN's 
%  que contengan las columnas en una base de datos.
%
%  Tiene como enfoque la limpieza de datos para ser utilizados en tecnicas
%  de machine learning supervisados por lo que la funcion tendras las
%  entradas siguientes:
%
%  X   Es la matriz de caracteristicas en nuestra base de datos.
%  y   Es el vector de salidas correctas de la base de datos.
function [X,y] = cleanData(X,y)
    
    % "y" sufrirá una transformacion de tamaño, asi que
    % guardamos su tamaño original en una variable "b".
    b = y;

    % Obtenemos el numero de caracteristicas.
    [~,n] = size(X);
    % Localizamos los posibles valores NaN's que contenga el vector de
    % salida y se los eliminamos a la matriz de caracteristicas
    X = X(~isnan(b),:);

    % Localizamos y eliminamos los posibles valores NaN's que contenga la
    % matriz de caracteristicas
    for q=1:n
        X=X(~isnan(X(:,q)),:);
    end

    % Se hace el mismo procedimiento para el vector de salidas correctas
    y=y(~isnan(b),:);
    for q=1:n
        y=y(~isnan(X(:,q)),:);
    end