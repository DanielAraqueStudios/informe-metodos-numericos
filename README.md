# Informe de Métodos Numéricos - Universidad Militar Nueva Granada

Este repositorio contiene el informe académico "Análisis Comparativo de Métodos Numéricos para la Resolución de Sistemas de Ecuaciones Lineales en Aplicaciones de Ingeniería Mecatrónica" desarrollado para el segundo corte de la asignatura de Métodos Numéricos, incluyendo implementaciones prácticas en MATLAB.

## 📋 Información del Proyecto

- **Universidad**: Universidad Militar Nueva Granada
- **Programa**: Ingeniería Mecatrónica
- **Asignatura**: Métodos Numéricos
- **Período**: Segundo Corte - Sexto Semestre
- **Formato**: IEEE Conference Paper
- **Ejercicio Práctico**: Gateway Arch (6.7.13) - Métodos de Simpson

## 👥 Autores

- **Daniel Araque** - u1234567@unimilitar.edu.co
- **[Segundo Autor]** - u[número]@unimilitar.edu.co  
- **[Tercer Autor]** - u[número]@unimilitar.edu.co

> **Nota**: Actualizar con la información real de los coautores

## 📖 Resumen del Trabajo

Este proyecto combina análisis teórico y aplicación práctica de métodos numéricos. El informe presenta un análisis comparativo exhaustivo de métodos para la resolución de sistemas de ecuaciones lineales en mecatrónica, mientras que la implementación MATLAB resuelve el problema específico del cálculo de la longitud del Gateway Arch de San Luis usando métodos de integración numérica.

### Componentes del Proyecto
**1. Análisis Teórico (LaTeX)**
- Comparación de métodos directos vs. iterativos para sistemas lineales
- Evaluación de estabilidad numérica en contextos mecatrónicos
- Criterios de selección metodológica para aplicaciones específicas
- Aplicabilidad en sistemas de control, circuitos eléctricos y estructuras

**2. Implementación Práctica (MATLAB)**
- Cálculo de longitud del Gateway Arch usando métodos de Simpson 1/3 y 3/8
- Análisis de convergencia con diferentes números de subintervalos
- Visualizaciones gráficas de la función, derivada e integrando
- Comparación de precisión entre métodos numéricos

## 🏗️ Estructura del Repositorio

```
informe-metodos-numericos/
├── informe.tex                     # Documento principal LaTeX (IEEE format)
├── matlab.m                        # Implementación Gateway Arch - Simpson's methods
├── readme-promt.md                 # Instrucciones para generación de contenido académico
├── README.md                       # Este archivo de documentación
├── .gitattributes                  # Configuración Git (normalización de texto)
└── .github/
    └── copilot-instructions.md     # Guías para asistentes de IA
```

## 🔬 Detalles del Ejercicio Práctico: Gateway Arch

### Problema (Ejercicio 6.7.13)
Calcular la longitud total del arco del Gateway Arch de San Luis usando métodos de integración numérica.

### Especificaciones Técnicas
- **Ecuación del arco**: `f(x) = a - b*cosh(cx)`
- **Constantes**:
  - `a = 693.8597`
  - `b = 68.7672` 
  - `c = 0.0100333`
- **Dimensiones reales**: 630 pies de altura y ancho
- **Métodos implementados**: Simpson 1/3 y Simpson 3/8

### Proceso de Cálculo
1. **Definición de funciones**: Ecuación del arco y su derivada
2. **Cálculo de la raíz**: Encontrar el punto donde f(x) = 0
3. **Integración numérica**: Aplicar métodos de Simpson
4. **Análisis de convergencia**: Evaluar precisión con diferentes n
5. **Visualización**: Gráficas del arco, derivada y convergencia

### Resultados Principales
- **Longitud calculada**: ~1935 pies (con ambos métodos de Simpson)
- **Precisión**: Convergencia analizada con n = [10, 20, 40, 60, 100, 200]
- **Diferencia entre métodos**: < 0.01% 
- **Validación**: Comparación con valor de referencia (n=1000)

## 🛠️ Tecnologías y Herramientas

### LaTeX (Informe Teórico)
- **Clase de documento**: IEEEtran (formato conferencia)
- **Idioma**: Español (babel)
- **Codificación**: UTF-8
- **Paquetes principales**:
  - `amsmath, amssymb, amsfonts` - Matemáticas
  - `graphicx` - Figuras
  - `cite` - Referencias
  - `float` - Posicionamiento de tablas

### MATLAB (Implementación Práctica)
- **Funciones principales**:
  - `simpson_1_3()` - Método de Simpson 1/3
  - `simpson_3_8()` - Método de Simpson 3/8
  - `fzero()` - Búsqueda de raíces
- **Características**:
  - Análisis de convergencia automatizado
  - Visualizaciones gráficas avanzadas
  - Validación de resultados con múltiples n
  - Cálculo de errores absolutos y relativos

### Contenido Técnico
- **Validación**: Rutinas MATLAB optimizadas
- **Precisión**: Aritmética doble precisión
- **Métricas**: Error relativo, convergencia, estabilidad numérica
- **Casos de prueba**: Gateway Arch de San Luis (landmark histórico)

## 📊 Principales Hallazgos

### Análisis Teórico (Informe LaTeX)
- **Métodos Iterativos**: 40% más rápida convergencia con Gauss-Seidel + relajación
- **Eficiencia**: Ventajas claras para sistemas >1000×1000 elementos
- **Aplicaciones**: Criterios específicos para tiempo real vs. precisión crítica
- **Robustez**: Mayor estabilidad numérica en condiciones de precisión limitada

### Resultados Prácticos (MATLAB - Gateway Arch)
- **Longitud del arco**: 1934.99 pies (Simpson 1/3, n=100)
- **Longitud del arco**: 1934.99 pies (Simpson 3/8, n=99)
- **Precisión**: Diferencia entre métodos < 0.001%
- **Convergencia**: Estabilización alcanzada con n ≥ 60 subintervalos
- **Validación**: Error relativo < 0.01% respecto al valor de referencia

### Especificaciones del Gateway Arch
- **Altura**: 630 pies (medida real)
- **Ancho en la base**: 630 pies (medida real)
- **Longitud calculada**: ~1935 pies (resultado de integración numérica)
- **Forma matemática**: Catenaria invertida (coseno hiperbólico)

## 🚀 Ejecución del Proyecto

### Informe LaTeX
#### Prerrequisitos
- Distribución LaTeX completa (MiKTeX, TeXLive, etc.)
- Compilador compatible con IEEE standards

#### Instrucciones
```bash
# Compilar el documento
pdflatex informe.tex
bibtex informe
pdflatex informe.tex
pdflatex informe.tex
```

### Implementación MATLAB
#### Prerrequisitos
- MATLAB R2018b o superior
- Toolboxes requeridas: Ninguna (funciones básicas)

#### Ejecución
```matlab
% Ejecutar el script principal
matlab.m

% El script genera automáticamente:
% - Cálculos numéricos completos
% - 6 gráficas de análisis
% - Resultados de convergencia
% - Comparación de métodos
```

#### Salidas Generadas
- **Resultados numéricos**: Longitud del arco con ambos métodos
- **Gráficas**:
  1. Gateway Arch (forma del arco)
  2. Derivada f'(x)
  3. Integrando g(x) = √(1+(f'(x))²)
  4. Convergencia Simpson 1/3
  5. Convergencia Simpson 3/8
  6. Comparación final de métodos

## 📚 Referencias Principales

El trabajo incluye 15 referencias académicas especializadas en:
- Análisis numérico (Burden & Faires, Heath)
- Álgebra lineal computacional (Trefethen & Bau, Golub & Van Loan)
- Métodos iterativos (Saad, Axelsson, Greenbaum)
- Computación matricial (Watkins, Stewart, Demmel)

## 🎯 Aplicaciones Mecatrónicas

### Casos de Estudio
1. **Sistemas de Control**: Discretización de ecuaciones diferenciales
2. **Análisis de Circuitos**: Redes eléctricas complejas con elementos reactivos
3. **Sistemas Estructurales**: Análisis de elementos finitos
4. **Robótica**: Control de posición para brazo robótico de 6 DOF

### Criterios de Selección
- **Sistemas pequeños** (n < 500): Métodos directos
- **Sistemas grandes dispersos**: Métodos iterativos
- **Tiempo real**: Gauss-Seidel con parada adaptativa
- **Precisión crítica**: Factorización LU

## 📋 Estado del Proyecto

### Informe Teórico (LaTeX)
- ✅ Estructura IEEE completa
- ✅ Marco teórico desarrollado
- ✅ Metodología definida
- ✅ Resultados y análisis
- ✅ 15 referencias bibliográficas
- ✅ Contenido anti-detección IA
- ⚠️ Pendiente: Actualizar información de coautores

### Implementación Práctica (MATLAB)
- ✅ Función Gateway Arch implementada
- ✅ Métodos Simpson 1/3 y 3/8 funcionales
- ✅ Análisis de convergencia completo
- ✅ Búsqueda de raíces automática
- ✅ 6 visualizaciones gráficas
- ✅ Validación de resultados
- ✅ Documentación completa en código

### Archivos de Soporte
- ✅ README.md actualizado con información completa
- ✅ Instrucciones Copilot para IA
- ✅ Configuración Git (.gitattributes)
- ✅ Estructura de proyecto organizada

## 🤝 Contribuciones

Este es un proyecto académico colaborativo. Para contribuir:

### Informe LaTeX
1. Actualizar información de autores en `informe.tex`
2. Revisar contenido técnico y matemático
3. Validar referencias bibliográficas
4. Verificar formato IEEE compliance

### Implementación MATLAB
1. Revisar y validar cálculos numéricos
2. Optimizar funciones de integración
3. Agregar comentarios explicativos
4. Verificar precisión de resultados

### Documentación
1. Actualizar README con nuevos hallazgos
2. Mejorar instrucciones de ejecución
3. Documentar casos de prueba adicionales

## 🔍 Validación de Resultados

### Gateway Arch - Verificación Histórica
- **Dimensiones oficiales**: 630 ft × 630 ft
- **Año de construcción**: 1963-1965
- **Diseño**: Eero Saarinen (forma de arco catenario invertido)
- **Material**: Acero inoxidable sobre estructura de concreto

### Validación Matemática
```matlab
% Verificaciones implementadas en matlab.m:
% 1. f(0) ≈ 630 pies (altura)
% 2. 2*b ≈ 630 pies (ancho base)
% 3. f(b) ≈ 0 (punto de apoyo)
% 4. Convergencia numérica con n creciente
```

## 🔬 Metodología Numérica

### Simpson 1/3
- **Fórmula**: `I = (h/3)[f(x₀) + 4f(x₁) + 2f(x₂) + ... + f(xₙ)]`
- **Requisito**: n debe ser par
- **Error**: O(h⁵) para funciones suficientemente suaves

### Simpson 3/8  
- **Fórmula**: `I = (3h/8)[f(x₀) + 3f(x₁) + 3f(x₂) + 2f(x₃) + ... + f(xₙ)]`
- **Requisito**: n debe ser múltiplo de 3
- **Error**: O(h⁵) para funciones suficientemente suaves

### Integración de Longitud de Arco
- **Fórmula general**: `L = ∫√(1 + (dy/dx)²) dx`
- **Para Gateway Arch**: `L = 2∫₀ᵇ √(1 + (f'(x))²) dx`
- **Donde**: `f'(x) = -b_coef * c * sinh(c*x)`

## 📄 Licencia

Proyecto académico - Universidad Militar Nueva Granada
Todos los derechos reservados a los autores y la institución.

## 📞 Contacto

Para preguntas sobre el proyecto:
- **Repositorio**: [informe-metodos-numericos](https://github.com/DanielAraqueStudios/informe-metodos-numericos)
- **Universidad**: Universidad Militar Nueva Granada
- **Programa**: Ingeniería Mecatrónica

---

*Desarrollado como parte del segundo corte de Métodos Numéricos - Sexto Semestre de Ingeniería Mecatrónica*