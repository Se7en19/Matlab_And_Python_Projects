%% Esta funcion realiza las predicciones de un modelo entrenado utilizando 
%  datos de prueba.
%  
%  Valores de entrada:
%  X_test  Son los datos que han sido seperados/divididos de la matriz de
%          caracteristicas original (X), su tamaño depende de la tasa de
%          division que podria ser por ejemplo 80% datos de entrenamiento
%          (X_train) y 20% datos de prueba (X_test).
%
%  y_std,  estos dos datos corresponde al promedio y la desvacion estandar
%  y_prom  del vector de salidas que corresponden a los datos de
%          entrenamiento, es decir, estos datos son de y_train.
%
%  w       son los datos de ponderacion correspondientes al modelo creado
%
%  coeff   Es la matriz de transformacion que pasa los datos de X_test al
%          contexto de pca.


%% PROGRAMA PRINCIPAL
function y_pred = prediction(X_test, ystd,yprom, w)
    %m = size(X_test,1); % Obtenemos el numero de medidas
    y_pred = X_test*w*ystd + yprom; % Realizamos las predicciones.
end