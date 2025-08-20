%% PCR
% Este programa realiza un modelo de regresion lineal utilizando tecnicas
% de machine learning y pca. 
%
% El codigo esta conformado por limpieza de datos, estandarizacion,
% procesamiento de pca, realizacion de la regresion y muestra de
% resultados.
%
% Este script contiene funciones externas.
%
%
%% PROGRAMA PRINCIPAL
function [X_test, y_test,Xstd, Xprom, w, ystd,yprom, coeff, score, latent, MSE]...
    =PCR(X,y,eta,numEpocas, numPCA, split_rate,verTrain)

%% Esta seccion trabaja con los datos verificando que no haya valores NaN's 
%  en la matriz de caracteristicas y en el vector de salidas correctas.
[X,y] = cleanData(X,y);
%% Esta seccion estandariza los datos una vez limpios.
% Evaluamos el numero de datos
[m,~] = size(X);
    %% Relvovemos los datos de manera aleatoria
    idxAleatorio = randperm(m);
    X=X(idxAleatorio,:);
    y=y(idxAleatorio);
    % Realizamos la estandarizacion para cada caracteristica de la matriz
    % de caracteristicas.
    Xprom=mean(X);
    Xstd=std(X);
    Xs=(X-Xprom)./Xstd;

    % Ahora estandarizamos las salidas.
    yprom = mean(y);
    ystd = std(y);
    ys = (y-yprom)./ystd;
    
 %% Se aplica el procedimiento de pca a todos los datos
    [coeff, score, latent] = pca(Xs,'NumComponents',numPCA);
  % Determinamos el numero de medidas
    [m,~] = size(score);
  % Creamos la nueva matriz de caracteristicas
    Xpca = [ones(m,1),score];

    % determinamos el numero de caracteristicas
    [~,n] = size(Xpca);
    %% Se dividen los datos en datos de entrenamiento y prueba.
    [X_train, X_test, ~, ~] = split_data(Xpca,ys,split_rate);
    [~, ~, y_train, y_test] = split_data(Xpca,y,split_rate);
    % Ahora estandarizamos las salidas correctas solo del entrenamiento.
    yprom= mean(y_train);
    ystd = std(y_train);
    yst = (y_train-yprom)./ystd;
    %% Variables para el regresor
    w = zeros(n,1);
    MSE = zeros(m,1);
    wEpocas = zeros(n,numEpocas);

    %% Programamos el entrenamiento del regresor
    for q=1:numEpocas
       % Evaluamos el gradiente
       nablaMSE = 2*X_train'*(X_train*w-yst)/m;
       % Actualizamos el vector de parametros
       w = w-eta*nablaMSE;
       % Guardamos los valores actuales de w
       wEpocas(:,q)=w;
       % Evaluamos el desempeño del entrenamiento
       ypred = X_train*w*ystd + yprom;
       % determinamos el error en el entremiento
       MSE(q) = sqrt(sum((ypred-y_train).^2)/m);
       if verTrain ==1
           figure(1)
           % Mostramos los resultados
           subplot(2,1,1)
           plot(MSE(1:q),'dr','LineWidth',4)
           ylabel('MSE', 'FontSize',13)
           xlabel('Numero de épocas', 'FontSize',13)
           pause(0.01)
       end
    end
end


  



