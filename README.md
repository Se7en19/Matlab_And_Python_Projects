# Comparación PCR vs PLS para Análisis de Espectros de Octanaje

Este proyecto implementa y compara dos técnicas de regresión multivariada: **PCR (Principal Components Regression)** y **PLS (Partial Least Squares)** para el análisis de espectros de octanaje.

## 📋 Descripción

El proyecto analiza la capacidad predictiva de ambas técnicas para estimar el octanaje basándose en datos espectrales. Se implementa desde cero el algoritmo PCR  y se compara con la implementación nativa de MATLAB para PLS.

## 🚀 Características

- **Implementación personalizada de PCR** 
- **Comparación directa** con PLS nativo de MATLAB
- **Análisis de componentes** y varianza explicada
- **Visualizaciones 3D** de los scores de PCA y PLS
- **Métricas de rendimiento** (MSE) para diferentes números de componentes

## 📁 Estructura del Proyecto

```
├── TestMSEPCA_PLS.m      # Script principal de comparación
├── PCR.m                 # Implementación de PCR con validación cruzada
├── estandarizacion.m     # Función de estandarización de datos
├── cleanData.m           # Limpieza de datos (eliminación de NaN)
├── prediction.m          # Función de predicción
├── split_data.m          # División de datos en train/test
└── README.md             
```

## 🔧 Requisitos

- MATLAB R2019b o superior
- Statistics and Machine Learning Toolbox (para `plsregress`)
- Dataset de espectros de octanaje (no incluido en el repositorio)

## 📊 Funcionalidades

### 1. Análisis de Componentes Principales (PCR)
- Implementación personalizada con descenso de gradiente
- Validación cruzada integrada
- Selección del número óptimo de componentes

### 2. Análisis de Mínimos Cuadrados Parciales (PLS)
- Utiliza la función nativa `plsregress` de MATLAB
- Comparación directa con PCR

### 3. Visualizaciones
- Gráfico de MSE vs número de componentes
- Análisis de varianza explicada
- Visualización 3D de scores de PCA y PLS

## 🎯 Uso

1. **Preparar los datos**: Asegúrate de tener tu archivo de espectros de octanaje
2. **Ejecutar el script principal**: `TestMSEPCA_PLS.m`
3. **Analizar resultados**: Revisar las gráficas generadas y métricas de rendimiento

## 📈 Resultados Esperados

El script generará:
- Comparación de MSE entre PCR y PLS
- Análisis de varianza explicada por componente
- Visualizaciones 3D de los scores
- Métricas de rendimiento para diferentes configuraciones


## 👨‍💻 Autor

[Se7en](https://github.com/Se7en19)


