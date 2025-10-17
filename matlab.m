% =========================================================================
% CALCULO DE LA LONGITUD DEL GATEWAY ARCH
% Ejercicio 6.7.13 - Metodos de Simpson 1/3 y 3/8
% =========================================================================

clear all; clc; close all;

fprintf('========================================================================\n');
fprintf('CALCULO DE LA LONGITUD DEL GATEWAY ARCH\n');
fprintf('Metodos de Simpson 1/3 y 3/8\n');
fprintf('========================================================================\n\n');

% =========================================================================
% PASO 1: DEFINICION DE FUNCIONES
% =========================================================================

fprintf('PASO 1: Definicion de funciones\n');
fprintf('------------------------------------------------------------------------\n');

% Constantes del Gateway Arch (ecuacion correcta)
a = 693.8597;  % Valor corregido
b_coef = 68.7672;
c = 0.0100333;  % Valor corregido

fprintf('Constantes:\n');
fprintf('  a = %.4f\n', a);
fprintf('  b_coef = %.4f\n', b_coef);
fprintf('  c = %.8f\n\n', c);

% Funcion del Gateway Arch: f(x) = a - b*cosh(cx)
% Nota: cosh(x) = (e^x + e^-x)/2
f = @(x) a - b_coef * cosh(c*x);

% Derivada: f'(x) = -b*c*sinh(cx)
% Nota: sinh(x) = (e^x - e^-x)/2
f_prime = @(x) -b_coef * c * sinh(c*x);

% Integrando: g(x) = sqrt(1 + (f'(x))^2)
g = @(x) sqrt(1 + f_prime(x).^2);

fprintf('Funciones definidas:\n');
fprintf('  f(x) = %.4f - %.4f * cosh(%.7fx)\n', a, b_coef, c);
fprintf('  f''(x) = -%.4f * %.7f * sinh(%.7fx)\n', b_coef, c, c);
fprintf('  g(x) = sqrt(1 + (f''(x))^2)\n\n');

% =========================================================================
% PASO 2: ENCONTRAR LA RAIZ b
% =========================================================================

fprintf('========================================================================\n');
fprintf('PASO 2: Encontrar la raiz b (donde f(x) = 0) usando Metodo de Biseccion\n');
fprintf('------------------------------------------------------------------------\n');

% Metodo de Biseccion
a_bisec = 250;  % Limite inferior
b_bisec = 350;  % Limite superior
tol = 1e-10;    % Tolerancia
max_iter = 100; % Maximo numero de iteraciones

fprintf('Metodo de Biseccion:\n');
fprintf('Intervalo inicial: [%.2f, %.2f]\n', a_bisec, b_bisec);
fprintf('Tolerancia: %.2e\n', tol);
fprintf('\n');
fprintf('  Iter     a           b           c           f(c)         Error\n');
fprintf('  ----   --------    --------    --------    ----------   --------\n');

iter = 0;
error = inf;

while error > tol && iter < max_iter
    c = (a_bisec + b_bisec) / 2;  % Punto medio
    fc = f(c);
    error = abs(b_bisec - a_bisec) / 2;
    
    if mod(iter, 10) == 0 || iter < 5  % Mostrar solo algunas iteraciones
        fprintf('  %4d   %.6f   %.6f   %.6f   %.6e   %.6e\n', ...
                iter, a_bisec, b_bisec, c, fc, error);
    end
    
    if abs(fc) < tol || error < tol
        break;
    end
    
    % Actualizar el intervalo
    if f(a_bisec) * fc < 0
        b_bisec = c;
    else
        a_bisec = c;
    end
    
    iter = iter + 1;
end

b_raiz = (a_bisec + b_bisec) / 2;

fprintf('  ...\n');
fprintf('  %4d   %.6f   %.6f   %.6f   %.6e   %.6e\n', ...
        iter, a_bisec, b_bisec, b_raiz, f(b_raiz), error);
fprintf('\n');
fprintf('Raiz encontrada: b = %.10f pies\n', b_raiz);
fprintf('Numero de iteraciones: %d\n', iter);
fprintf('Verificacion: f(b) = %.10e\n', f(b_raiz));
fprintf('Altura del arco: f(0) = %.4f pies (debe ser ~630 pies)\n', f(0));
fprintf('Ancho total del arco: 2*b = %.4f pies (debe ser ~630 pies)\n\n', 2*b_raiz);

% =========================================================================
% PASO 3: METODO DE SIMPSON 1/3
% =========================================================================

fprintf('========================================================================\n');
fprintf('PASO 3: Metodo de Simpson 1/3\n');
fprintf('------------------------------------------------------------------------\n');

% Valores de n para analizar convergencia
n_valores_13 = [10, 20, 40, 60, 100, 200];

fprintf('Analisis de convergencia con diferentes valores de n:\n\n');
fprintf('  n      h          Integral           Longitud (pies)\n');
fprintf('  ----   --------   ----------------   ----------------\n');

longitudes_13_conv = zeros(size(n_valores_13));
for i = 1:length(n_valores_13)
    n = n_valores_13(i);
    h = b_raiz / n;
    integral = simpson_1_3(g, 0, b_raiz, n);
    longitud = 2 * integral;
    longitudes_13_conv(i) = longitud;
    fprintf('  %-4d   %.4f   %.10f   %.10f\n', n, h, integral, longitud);
end

% Resultado final con n=100
n_final_13 = 100;
integral_13 = simpson_1_3(g, 0, b_raiz, n_final_13);
longitud_13 = 2 * integral_13;

fprintf('\n>>> RESULTADO FINAL (Simpson 1/3, n=%d):\n', n_final_13);
fprintf('    Integral = %.10f\n', integral_13);
fprintf('    Longitud = %.5f pies\n', longitud_13);
fprintf('    Con 5 cifras significativas: %.5g pies\n\n', longitud_13);

% =========================================================================
% PASO 4: METODO DE SIMPSON 3/8
% =========================================================================

fprintf('========================================================================\n');
fprintf('PASO 4: Metodo de Simpson 3/8\n');
fprintf('------------------------------------------------------------------------\n');

% Valores de n para analizar convergencia (multiplos de 3)
n_valores_38 = [9, 30, 60, 90, 99, 198];

fprintf('Analisis de convergencia con diferentes valores de n:\n\n');
fprintf('  n      h          Integral           Longitud (pies)\n');
fprintf('  ----   --------   ----------------   ----------------\n');

longitudes_38_conv = zeros(size(n_valores_38));
for i = 1:length(n_valores_38)
    n = n_valores_38(i);
    h = b_raiz / n;
    integral = simpson_3_8(g, 0, b_raiz, n);
    longitud = 2 * integral;
    longitudes_38_conv(i) = longitud;
    fprintf('  %-4d   %.4f   %.10f   %.10f\n', n, h, integral, longitud);
end

% Resultado final con n=99
n_final_38 = 99;
integral_38 = simpson_3_8(g, 0, b_raiz, n_final_38);
longitud_38 = 2 * integral_38;

fprintf('\n>>> RESULTADO FINAL (Simpson 3/8, n=%d):\n', n_final_38);
fprintf('    Integral = %.10f\n', integral_38);
fprintf('    Longitud = %.5f pies\n', longitud_38);
fprintf('    Con 5 cifras significativas: %.5g pies\n\n', longitud_38);

% =========================================================================
% PASO 5: COMPARACION Y ANALISIS
% =========================================================================

fprintf('========================================================================\n');
fprintf('COMPARACION Y ANALISIS DE RESULTADOS\n');
fprintf('========================================================================\n\n');

% Valor teorico calculado con alta precision
n_alta_precision = 1000;
integral_exacto = simpson_1_3(g, 0, b_raiz, n_alta_precision);
longitud_exacta = 2 * integral_exacto;

fprintf('Resultados finales:\n');
fprintf('  Raiz encontrada:          b = %.5f pies\n', b_raiz);
fprintf('  Altura del arco:          h = %.5f pies\n', f(0));
fprintf('  Ancho del arco:           w = %.5f pies\n', 2*b_raiz);
fprintf('  Simpson 1/3 (n=%d):       L = %.5f pies\n', n_final_13, longitud_13);
fprintf('  Simpson 3/8 (n=%d):        L = %.5f pies\n', n_final_38, longitud_38);
fprintf('  Valor de referencia:      L = %.5f pies (n=1000)\n\n', longitud_exacta);

diferencia = abs(longitud_13 - longitud_38);
error_13 = abs(longitud_13 - longitud_exacta);
error_38 = abs(longitud_38 - longitud_exacta);
error_rel_13 = (error_13 / longitud_exacta) * 100;
error_rel_38 = (error_38 / longitud_exacta) * 100;

fprintf('Analisis de precision:\n');
fprintf('  Diferencia entre metodos:     %.6f pies (%.6f%%)\n', diferencia, (diferencia/longitud_13)*100);
fprintf('  Error absoluto (1/3):         %.6f pies\n', error_13);
fprintf('  Error relativo (1/3):         %.6f%%\n', error_rel_13);
fprintf('  Error absoluto (3/8):         %.6f pies\n', error_38);
fprintf('  Error relativo (3/8):         %.6f%%\n\n', error_rel_38);

fprintf('NOTA: El Gateway Arch tiene:\n');
fprintf('  - Altura: 630 pies\n');
fprintf('  - Ancho en la base: 630 pies\n');
fprintf('  - Longitud del arco (curva): %.2f pies\n\n', longitud_exacta);

% =========================================================================
% PASO 6: GRAFICAS
% =========================================================================

fprintf('========================================================================\n');
fprintf('GENERANDO GRAFICAS...\n');
fprintf('========================================================================\n\n');

% Crear figura
figure('Position', [100, 100, 1400, 900]);

% Grafica 1: Gateway Arch
subplot(2, 3, 1);
x_arch = linspace(-b_raiz, b_raiz, 1000);
y_arch = f(x_arch);
plot(x_arch, y_arch, 'b-', 'LineWidth', 2.5);
hold on;
fill([x_arch, fliplr(x_arch)], [y_arch, zeros(size(y_arch))], 'b', 'FaceAlpha', 0.2);
plot([b_raiz, -b_raiz], [0, 0], 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r', 'LineWidth', 2);
plot([0], [f(0)], 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g', 'LineWidth', 2);
text(0, f(0)+30, sprintf('h = %.1f ft', f(0)), 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
text(b_raiz, -40, sprintf('b = %.1f ft', b_raiz), 'HorizontalAlignment', 'center', 'FontWeight', 'bold');
grid on;
xlabel('x (pies)', 'FontWeight', 'bold');
ylabel('y (pies)', 'FontWeight', 'bold');
title('Gateway Arch de San Luis', 'FontWeight', 'bold', 'FontSize', 12);
axis equal;

% Grafica 2: Derivada f'(x)
subplot(2, 3, 2);
x_plot = linspace(0, b_raiz, 500);
y_deriv = f_prime(x_plot);
plot(x_plot, y_deriv, 'r-', 'LineWidth', 2);
hold on;
area(x_plot, y_deriv, 'FaceColor', 'r', 'FaceAlpha', 0.3);
yline(0, '--k', 'LineWidth', 1);
grid on;
xlabel('x (pies)', 'FontWeight', 'bold');
ylabel('f''(x)', 'FontWeight', 'bold');
title('Derivada f''(x) = -b*c*sinh(cx)', 'FontWeight', 'bold', 'FontSize', 12);

% Grafica 3: Integrando g(x)
subplot(2, 3, 3);
y_g = g(x_plot);
plot(x_plot, y_g, 'g-', 'LineWidth', 2);
hold on;
area(x_plot, y_g, 'FaceColor', 'g', 'FaceAlpha', 0.3);
grid on;
xlabel('x (pies)', 'FontWeight', 'bold');
ylabel('g(x)', 'FontWeight', 'bold');
title('Integrando: g(x) = \surd(1+(f''(x))^2)', 'FontWeight', 'bold', 'FontSize', 12);

% Grafica 4: Convergencia Simpson 1/3
subplot(2, 3, 4);
plot(n_valores_13, longitudes_13_conv, 'bo-', 'LineWidth', 2, 'MarkerSize', 10, 'MarkerFaceColor', 'b');
hold on;
yline(longitud_exacta, '--r', 'LineWidth', 2, 'DisplayName', 'Referencia (n=1000)');
grid on;
xlabel('n (subintervalos)', 'FontWeight', 'bold');
ylabel('Longitud (pies)', 'FontWeight', 'bold');
title('Convergencia: Simpson 1/3', 'FontWeight', 'bold', 'FontSize', 12);
legend('Simpson 1/3', 'Valor de referencia', 'Location', 'best');

% Grafica 5: Convergencia Simpson 3/8
subplot(2, 3, 5);
plot(n_valores_38, longitudes_38_conv, 'mo-', 'LineWidth', 2, 'MarkerSize', 10, 'MarkerFaceColor', 'm');
hold on;
yline(longitud_exacta, '--r', 'LineWidth', 2, 'DisplayName', 'Referencia (n=1000)');
grid on;
xlabel('n (subintervalos)', 'FontWeight', 'bold');
ylabel('Longitud (pies)', 'FontWeight', 'bold');
title('Convergencia: Simpson 3/8', 'FontWeight', 'bold', 'FontSize', 12);
legend('Simpson 3/8', 'Valor de referencia', 'Location', 'best');

% Grafica 6: Comparacion final
subplot(2, 3, 6);
metodos = {'Simpson 1/3', 'Simpson 3/8', 'Referencia'};
longitudes = [longitud_13, longitud_38, longitud_exacta];
colores = [0 0 1; 1 0 1; 1 0 0];
b = bar(longitudes, 'FaceColor', 'flat');
b.CData = colores;
set(gca, 'XTickLabel', metodos);
ylabel('Longitud (pies)', 'FontWeight', 'bold');
title('Comparación de Resultados', 'FontWeight', 'bold', 'FontSize', 12);
grid on;
ylim([min(longitudes)-10, max(longitudes)+10]);
% Agregar valores sobre las barras
for i = 1:length(longitudes)
    text(i, longitudes(i) + 2, sprintf('%.2f', longitudes(i)), ...
        'HorizontalAlignment', 'center', 'FontWeight', 'bold');
end

fprintf('Graficas generadas exitosamente!\n\n');

fprintf('========================================================================\n');
fprintf('PROCESO COMPLETADO\n');
fprintf('========================================================================\n');

% =========================================================================
% FUNCIONES
% =========================================================================

function I = simpson_1_3(func, a, b, n)
    % SIMPSON_1_3 Metodo de Simpson 1/3 para integracion numerica
    %
    % Entrada:
    %   func - Funcion a integrar
    %   a    - Limite inferior
    %   b    - Limite superior
    %   n    - Numero de subintervalos (debe ser PAR)
    %
    % Salida:
    %   I    - Valor de la integral aproximada
    
    % Verificar que n sea par
    if mod(n, 2) ~= 0
        error('n debe ser par para el metodo de Simpson 1/3');
    end
    
    % Calcular tamaño de paso
    h = (b - a) / n;
    
    % Generar puntos de evaluacion
    x = linspace(a, b, n+1);
    
    % Evaluar la funcion en todos los puntos
    y = func(x);
    
    % Aplicar la formula de Simpson 1/3
    I = y(1) + y(end);                  % Extremos (coef. 1)
    I = I + 4 * sum(y(2:2:end-1));      % Puntos impares (coef. 4)
    I = I + 2 * sum(y(3:2:end-2));      % Puntos pares (coef. 2)
    I = I * h / 3;                      % Multiplicar por h/3
end

function I = simpson_3_8(func, a, b, n)
    % SIMPSON_3_8 Metodo de Simpson 3/8 para integracion numerica
    %
    % Entrada:
    %   func - Funcion a integrar
    %   a    - Limite inferior
    %   b    - Limite superior
    %   n    - Numero de subintervalos (debe ser MULTIPLO DE 3)
    %
    % Salida:
    %   I    - Valor de la integral aproximada
    
    % Verificar que n sea multiplo de 3
    if mod(n, 3) ~= 0
        error('n debe ser multiplo de 3 para el metodo de Simpson 3/8');
    end
    
    % Calcular tamaño de paso
    h = (b - a) / n;
    
    % Generar puntos de evaluacion
    x = linspace(a, b, n+1);
    
    % Evaluar la funcion en todos los puntos
    y = func(x);
    
    % Aplicar la formula de Simpson 3/8
    I = y(1) + y(end);                  % Extremos (coef. 1)
    
    % Sumar los terminos intermedios con sus coeficientes
    for i = 2:n
        if mod(i-1, 3) == 0
            I = I + 2 * y(i);           % Cada tercer punto (coef. 2)
        else
            I = I + 3 * y(i);           % Los demas puntos (coef. 3)
        end
    end
    
    I = I * 3 * h / 8;                  % Multiplicar por 3h/8
end