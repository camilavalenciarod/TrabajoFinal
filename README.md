
# Efecto de grupo par sobre el rendimiento académico de los estudiantes de primer semestre de la Facultad de Economía en la Universidad del Rosario

[Camila Valencia](https://github.com/camilavalenciarod/Resume/blob/master/HojadeVida%20Nov%202016.pdf) 

25-Nov-2016



---

## Descripción y Motivación

La principal motivacion de este trabajo es identificar el efecto de la calidad de la red de estudio de los individuos sobre el rendimiento academico de los estudiantes.

Algunas preguntas que pretendo responder con  este trabajo:

- Que clase de polarizacion hay en la red de estudiantes universitarios?
- 
- Cual es el efecto del grupo par sobre el rendimiento academico?

## Metodos usados

Los datos con los que cuento son algunas caracteristicas socioeconomicas provenientes de las encuestas de admision de la universidad del Rosario y todos los datos que se le preguntan a los estudiantes en la prueba Saber 11. Ademas para analizar los rendimientos academicos, tengo el promedio ponderado y las notas de todas las materias que vieron el primer semestre del 2016. Ademas tengo la encuesta que se llevo a cabo a finales del semestre en donde se preguntaba cuales eran los estudiantes con los que estudiaba una vez por semana por fuera de los horarios de clase, cuales eran los estudiantes con los hacia ejercicio, cuales con los que salia a actividades sociales (cine, teatro, fiesta, bares), cuales eran los estudiantes mas cercanos a los que les pediria un consejo personal, cuales eran los estudiantes a los que conocia antes de entrar a la universidad y cuales son los que considera lideres.

Todos los datos estan codificados por el numero del individuo, los datos de la encuesta de redes estaban forma string con el codigo de todos los estudiantes pertenecientes a la red del individuo

1. Excel
    - Lo primero fue convertir esa unica celda con la informacion de la red en varias columnas y despues de eso hacer la matriz de unos         que me deja modelar la red con los comandos de igraph en R
    - Despues de esto hice multiplique las filas de la matriz por los vectores que me interesaban tener el promedio de la red, como lo es       el desempeño promedio de la red de cada estudiante y como lo es los resultados del Saber 11 promedio de la red de cada estudiante
    
2. Redes en R
    - Al tener la matriz de la red, mediante una serie de comandos en R. Modele las graficas con direcciones, las redes con atributos como      lo son genero, estrato, programa, desempeño academico, ser beneficiario de ser pilo paga
    - Ademas de las graficas, obtuve una serie de variables descriptivas de cada una de las 6 redes
    
3. Analisis en Stata
    - Con la base generada en excel pude correr la regresion de minimos cuadrados ordinarios la cual tiene un problema de endogeneidad por      el problema de reflexion descrito por Manski (1993). 
    - Luego muestro la regresion de minimos cuadrados ordinarios en dos etapas, para resolver el probema de endogeneidad por medio de           variables instrumentales.

## Resultados





<img src="images/dispersion2.png">

---
