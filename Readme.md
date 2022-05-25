# Equidad y Arbolado Urbano en Bogotá D.C. 

<font color=green>**Proyecto Final Métodos Computacionales para Políticas Públicas 2022**<br> 
**Autora:** Allison Del Río Bahamón

## 1. Motivación

En el acuerdo No. 761 de 2020, por el cual se adoptó el Plan de desarrollo económico, social, ambiental y de obras públicas del distrito capital 2020-2024, se estableció el <font color=green>programa 33 “Más árboles y más y mejor espacio público”. <font color=black>En este programa se incluyó una herramienta de política pública de gestión integral de arbolado urbano. El establecimiento de lo anterior responde a la necesidad de la población de tener un ambiente sano en la ciudad. Los árboles son indispensables para mejorar la calidad del aire, regular la temperatura y aportar un valor no solo estético sino emocional para los habitantes, además de ser vital para la conservación de las especies animales.

Desde dicho acuerdo, el Jardín Botánico de Bogotá ha liderado las acciones dirigidas a conseguir la meta del plan de desarrollo de 2020-2024 de sembrar <font color=green>80.000 árboles en la ciudad. <font color=black>No obstante, es posible reconocer la existencia de desigualdad en la cantidad de árboles por habitante existentes por localidad, lo cual debe ser un críterio vital a considerar al momento de determinar dónde plantar los árboles. En Bogotá hay 0,18 árboles por habitante, cuando la recomendación de la OMS es de 1 árbol por cada 3 personas.

Ahora, no todas las localidades se encuentran bajo la misma situación. En este proyecto se desea valorar si la manera en la que se han distribuido las plantaciones de árboles hasta el momento ha tomado en cuenta la equidad en el arbolado urbano entre localidades como un factor de plantación.

## 2. Preguntas a resolver

- ¿La ubicación de la siembra de árboles hasta el momento responde a la búsqueda de reparar la desigualdad entre localidades respecto a calidad del aire y número de árboles por persona?

- ¿Cuál sería la mejor manera de distribuir la plantación de árboles para mejorar el bienestar de la población bogotana de manera más equitativa?

## 3. Fuentes de datos

La fuente principal de información del proyecto es el censo de árboles realizado por el Jardín Botánico que se encuentra en el SIGAU (https://jbb.gov.co/sigau/).

Pero para el análisis espacial que se realizó, fue igualmente necesario emplear:
- _shape file_ de localidades de Bogotá encontrado en la página de datos abiertos de Bogotá (https://datosabiertos.bogota.gov.co/dataset/localidad-bogota-d-c) y,
- los datos de habitantes por localidad (https://sdpbogota.maps.arcgis.com/apps/MapSeries/index.html?appid=baabe888c3ab42c6bb3d10d4eaa993c5).

## 4. Metodología

La manera de abordar las preguntas planteadas fue realizar una representación geográfica de los datos que permita identificar las tendencias en la plantación del arbolado urbano y realizar un análisis espacial.

El procesamiento de los datos se realizó en Rstudio, en donde se procedió a:
- Cargar los datos de censo
- Combinar los datos de los poligonos de localidad encontrados en datos abiertos
- Filtrar los datos de censo por año (desde el inicio del programa 33) de acuerdo a los poligonos relacionados
- Realizar operaciones entre los datos de censo y habitantes por localidad haciendo uso de los mismo poligonos de Bogotá

Igualmente se editaron los plot geográficos para que los datos fueran facilmente entendidos por el público objetivo: hacedores/as de política pública.

## 5. Resultados

![arbolado_bogota_verdes](https://user-images.githubusercontent.com/68167056/170233336-f4072eeb-f684-462c-8c5f-be89ebd60e7e.png)
![arborizacion_pc_verde](https://user-images.githubusercontent.com/68167056/170233407-4dc3a076-322f-41d4-8cb5-a1258b6de250.png)
![GIF_arborizacion](https://user-images.githubusercontent.com/68167056/170233488-1184fbff-f970-461c-bbac-36519dbc377f.gif)


## 6. Conclusiones y oportunidades de mejora

1. Suba es la localidad con más arbolado total y donde se ha realizado la mayor proporción de siembra de árboles como parte del programa 33. Sin embargo, su arborización per cápita se encuentra en la mitad del espectro. 

2. La localidad con mayor arbolado per cápita es Santa Fé, con Candelaria como una zona con menor arbolado. Durante los últimos años no se ha realizado una siembra significativa en la zona.

3. Las localidades con mayor inequidad en el arbolado urbano son Mártires, Ciudad Bolívar y Bosa. Pero desde el 2020 no se ha hecho mayor siembra en estas zonas, encontrándose Bosa en la peor situación.

4. Observando los resultados es posible realizar la recomendación de priorizar la plantación de árboles en las localidades de Mártires, Bosa y Ciudad Bolívar durante los siguientes dos años del programa.

Como oportunidades de mejora y entendiendo las límitaciones en el alcance de los datos aquí presentados, se considera que:

- Una revisión conjunta de los datos de arbolado urbano con el estado y evolución de la calidad del aire (IBOCA) en las zonas donde se ha realizado la siembra de árboles vs. las localidades donde no se ha realizado la siembra de árboles permitiría priorizar más acertadamente la siembra de árboles restante en el programa.

- Mejorar la recomendación de sitios para realizar la siembra de los árboles por plantar en el programa empleando rasters para identificar las zonas baldías disponibles en las áreas con mayor inequidad en el arbolado urbano.
