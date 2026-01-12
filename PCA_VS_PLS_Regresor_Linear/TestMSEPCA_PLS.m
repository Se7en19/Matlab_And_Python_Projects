%% Este es un script diseñado para comparar el rendimiento del PCR 
% (Principal Components Analysis Regresor) y PLS (Projection Latent Structures)

%% PROGRAMA PRINCIPAL
% Cargamos los datos
clear,clc,clf
% Cargamos los datos
T=readtable('espectroOctanaje.txt');
% Extraemos los espectros
espectros = T{:,1:401};
octanaje = T.octane;

% Variables 
numComponents = 50;
split_rate =1;
componentsVsMse_train = zeros(1,numComponents);
[X_test,y_test] = split_data(espectros,octanaje, split_rate);
[N,~] = size(X_test);
m = size(y_test,1);
y_pred = zeros(m,numComponents);
numEpocas = 100;
eta = 2.8e-3;

%% PROCEDIMIENDO DEL PCA %%

for q=1:numComponents
    [~,~,~,~,~,~,~,coeff,score,latent,MSE]...
        =PCR(espectros,octanaje,eta,numEpocas,q,split_rate,0);
    % Almacenamos el MSE para cada componente
    componentsVsMse_train(:,q) = MSE(end) ;
    % Almacenamos las predicciones de cada componente.
    % y_pred(:,q) = prediction(X_test,ystd,yprom,w);
    % disp(size(y_pred(:,q)));
end
%% PROCEDIMIENTO DEL PLS
% estandarizamos los datos que vamos a ingresar a plsregress
[Xs,ys] = estandarizacion(espectros,octanaje);
[XL,YL,XS,YS,BETA,PCTVAR,MSE] = plsregress(Xs,ys,numComponents);

% Graficamos los resultados.
figure(2);
hold on
plot(1:numComponents, componentsVsMse_train, '-o', 'LineWidth', 1.5,...
    'MarkerSize', 6, 'DisplayName', 'MSE: (PCR)');
plot(1:numComponents, MSE(2,2:end), '-d', 'LineWidth', 1.5, ...
   'MarkerSize', 6, 'DisplayName', 'MSE: (PLS)');
hold off;
grid on
xlabel('Número de Componentes');
ylabel('Error');
title('Error Cuadrático Medio por Componente');
legend('show');
%% Graficamos la informacion contenida por componente
figure(3);
varianza = (cumsum(latent)./sum(latent))*100;
hold on
plot(varianza(1:numComponents,1), '-o', 'DisplayName','PCA')
plot(1:numComponents,cumsum(100*PCTVAR(2,:)),'-d','DisplayName','PLS');
xlabel('Numero de componentes');
ylabel('Porcentaje de varianza explicada en y');
legend('show');
hold off
%%
figure(4);
idxBajo = octanaje<86;
idxMedio = 86<octanaje & octanaje<88;
idxAlto = 88<octanaje;
% Gráficos para diamantes (score)
scatter3(score(idxBajo, 1), score(idxBajo, 2), score(idxBajo, 3), 'd', ...
    'MarkerEdgeColor', [0, 0.8, 1], 'MarkerFaceColor', [0, 0.8, 1], 'LineWidth', 1.5); % Cian
hold on;
scatter3(score(idxMedio, 1), score(idxMedio, 2), score(idxMedio, 3), 'd', ...
    'MarkerEdgeColor', [1, 0, 1], 'MarkerFaceColor', [1, 0, 1], 'LineWidth', 1.5); % Magenta
scatter3(score(idxAlto, 1), score(idxAlto, 2), score(idxAlto, 3), 'd', ...
    'MarkerEdgeColor', [0.5, 1, 0], 'MarkerFaceColor', [0.5, 1, 0], 'LineWidth', 1.5); % Verde lima

% Gráficos para prismas (XS)
scatter3(XS(idxBajo, 1), XS(idxBajo, 2), XS(idxBajo, 3), 'p', ...
    'MarkerEdgeColor', [0.8, 0, 0], 'MarkerFaceColor', [0.8, 0, 0], 'LineWidth', 1.5); % Rojo oscuro
scatter3(XS(idxMedio, 1), XS(idxMedio, 2), XS(idxMedio, 3), 'p', ...
    'MarkerEdgeColor', [1, 0.8, 0], 'MarkerFaceColor', [1, 0.8, 0], 'LineWidth', 1.5); % Amarillo dorado
scatter3(XS(idxAlto, 1), XS(idxAlto, 2), XS(idxAlto, 3), 'p', ...
    'MarkerEdgeColor', [0, 0, 0.8], 'MarkerFaceColor', [0, 0, 0.8], 'LineWidth', 1.5); % Azul oscuro

xlabel('PC: 1')
ylabel('PC: 2')
zlabel('PC: 3')