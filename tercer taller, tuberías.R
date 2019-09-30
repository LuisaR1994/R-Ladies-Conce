##INTRODUCCION
#¿Porqué usar la librería Dplyr?
#La estructura de datos más importante en R es el data frame.
#Esta estructura permite representar la información en forma de tabla para trabajar 
#con ella en una forma fácil de comprender (Anderson, 2016).
#Dada la importancia de trabajar en R con este tipo de estructuras, es importante 
#conocer las herramientas con que contamos para manipularlos (Anderson, 2016).
#El paquete Dplyr fue desarrollado por Hadley Wickham (Rstudio) como una optimización 
#del paquete plyr.La librería Dplyr provee poderosas funciones para manipular tablas
#de datos, facilitando así la exploración y transformación de éstos. 
#Dado que está escrito en lenguaje C++, sus funciones permiten hacer operaciones más 
#rápido que con las funciones del paquete base (Anderson, 2016). Es instuitivo en la 
#lectura y en la escritura, especialmente por la incorporación de cadena de sintaxis 
#las que permiten escribir las operaciones sobre los data frame de manera secuencial.

##################################################################
  #                    Instalar paquete dplyr
##################################################################

install.packages("dplyr")
library(dplyr)
### Si al ejecutar la librería aparece el siguiente mensaje 
### "The following objects are masked from",
### nos indica que el paquete cargado tiene funciones que poseen el mismo nombre 

### que otro paquete cargado previamente  (plyr).
### De esta manera, cuando llamemos una función cuyo nombre 
### está presente en otro paquete,se entenderá que hacemos referencia 
### al último paquete cargado. 

##################################################################
 #                       Funciones de Dplyr
##################################################################

######                La grámatica de dplyr               #######

### Algunos de los principales "verbos" del paquete dplyr son:

## select: devuelve un conjunto de columnas.
## filter: devuelve un conjunto de filas según una o varias condiciones lógicas.
## arrange: reordena filas de un data frame.
## rename: renombra variables en una data frame.
## mutate: añade nuevas variables/columnas o transforma variables existentes.
## group_by: realiza una agrupación definida por variables.
## summarise/summarize: genera resúmenes estadísticos de diferentes variables en el data frame, posiblemente con strata.
## %>% : el operador "pipe" es usado para conectar múltiples acciones en una única "pipeline" (tubería).

##################################################################
 #                        Función select()
##################################################################

## En primer lugar instalaremos el paquete que contiene la tabla de datos que usaremos de ejemplo.

install.packages("UsingR")
library(UsingR)

## Se utilizará la tabla de datos de la maratón de NY de 2002, la misma
## utilizada en el taller anterior.

data <- UsingR::nym.2002

## Con la función select() podemos seleccionar las columnas de un data frame.
## Visualizamos el contenido del Data Frame "data"

head(data)

## Para seleccionar las variables "gender" y "age" ejecutamos el siguiente comando:

genderage <- select(data, gender, age)

## Con el - podemos excluir una columna de la siguiente forma:

select(data, -age)

## Podemos utilizar la notación : para seleccionar un rango de columnas:

select(data, gender:time)

## Utilizando los operadores : y - de forma conjunta se puede lograr:

select(data, -(gender:time))

## El paquete dplyr contiene una serie de funciones que permiten facilitar el trabajo
## Si solo me acuerdo de la incial de la columna que necesito:

select(data, starts_with("g"))

## Si solo me acuerdo de la letra final de la columna que necesito:

select(data, ends_with("e"))

## Si quiero seleccionar todas las columnas:

select(data, everything())

##################################################################
#                      Función filter()
##################################################################

### La función filter() nos permite filtrar filas según una condición:

### Si queremos obtener una tabla solo con los datos de mujeres, entonces:

mujeres <- filter(data, gender == "Female")
mujeres

### Se puede incluir más de una condición para filtrar:

mujeresjovenes <- filter(mujeres, age <= 25, home %in% c("NY", "MEX", "CA"))
mujeresjovenes

### Para crear las condiciones se pueden utilizar los siguientes operadores 
### racionales y lógicos:

# "<" menor que
# ">" mayor que
# "==" igual que
# "<=" menor o igual que
# ">=" mayor o igual que
# "!=" diferente que
# "%in%" pertenece al conjunto
# "is.na" es -not a number-
# "!is.na" no -es not a number-

##################################################################
#                       Función arrange()
##################################################################

### La función arrange() se utiliza para ordenar las filas de un data frame 
### de acuerdo a una o varias columnas/variables.

### Por defecto arrenge() ordena las filas en orden ascendente

### Si queremos ordenar a los competidores según el puesto obtenido:

arrange(data, time)

### Si lo queremos ordenar de forma descendente:

arrange(data, desc(time))
View(data)

### Podemos ordenar las filas según varias variables:

arrange(data, age, time)

##################################################################
#                       Función rename()
##################################################################

### La función rename() está diseñada para renombrar una variable 
### en un data frame:

### Vemos los nombres de las variables en el dataframe "data"

names(data)

### vamos a pasar los nombres de las variables al español:

rename(data, lugar = place, genero = gender, edad = age, hogar = home, tiempo = time)

##################################################################
#                       Función mutate()
##################################################################

## Con la función mutate() podemos computar tranformaciones de variables en un data frame. 
## A menudo, tendremos la necesidad de crear nuevas variables que se calculan a partir de 
## variables existentes,mutate() nos proporciona una interface clara para realizar este
## tipo de operaciones.

## Se urilizará otro de los dataset básicos de R para el ejemplo
## Instalación del Dataset

data("iris")
iris

#agregare una nueva columna que significará la forma del petalo

mutate(iris, forma = Petal.Width/Petal.Length)

##################################################################
##              Sitaxis en cádena o función %>% (pipe)
##################################################################

## El paquete incorpora una sintaxis encadenada que permite escribir las acciones 
## en un orden natural, en oposición a la forma anidada en la que lo haríamos normalmente.
## Primero se escribe el nombre del fichero y luego las acciones en el orden en que se 
## realizan separadas por el operador %>% (que podríamos leer como "entonces").

iris %>%
  select(contains('Petal'))  %>%
  filter(Petal.Length > 4)   %>%
  arrange(Petal.Length)

## Podemos comparar con el código anidado habitual:

arrange(filter(select(iris, contains('Petal')), Petal.Length > 4), Petal.Length)

##################################################################
##                  group_by() + sumarise()
##################################################################

## Usamos summarise() para aplicar comandos a variables.
## Normalmente se usa en combinación con group_by() de manera que se calculen
## estadísticos para subgrupos de observaciones.

iris %>%
  group_by(Species) %>%
  summarise(mean(Petal.Length))

## Una variación viene dada por la acción summarise_each() 
## en la que se consideran varias variables a la vez.

## Un ejemplo es el siguiente, en el que se calculan las medias de cada una 
## de las medidas del pétalo y para cada una de las tres especies:

iris %>%
  group_by(Species) %>%
  summarise_each(funs(mean), contains('Petal'))
  
############################################################
# Análisis de datos
############################################################
## Leer el conjunto de datos que se extrajo desde la página de Junaeb "http://junaebabierta.junaeb.cl/"
# los cuales se encuentran disponibles para toda la comunidad. 

"El Mapa Nutricional de Junaeb corresponde al perfil nutricional nacional de cuatro 
niveles educacionales (prekínder, kínder, 1° básico y 1° medio) del sistema educacional subvencionado. 
Es una herramienta que posibilita dimensionar la magnitud de las distintas situaciones nutricionales 
(desnutrición, bajo peso, normal, sobrepeso, obesidad y retraso en talla), tanto a nivel local como 
nacional, y construir una tendencia a lo largo de los años.

Los datos que utilizaremos corresponden a cursos de pre kinder y primero básico de los años 2016 y 2017.
"

datos <- read.csv("DatosJunaeb_2016-2017.csv", header = TRUE, sep = ";", dec = ",")

#Vemos un resumen de los datos, con el comando head, tenemos 
#los 6 primeros registros de nuestra tabla.

head(datos)

## Usando las herramientas de la librería Dplyr podemos realizar resúmenes
# de la información que en una tabla completa no podríamos ver. 
names(datos)

# Vemos un resumen de cada variable de nuestros datos

summary(datos)
View(datos)

## Eliminamos algunos datos "NA" 
datos <- na.omit(datos)

# Si utilizamos la tabla sin asignar, sólo se mostrarán los resultados, no guardará otra tabla

datos %>% 
  dplyr::group_by(nombre.región, área.geográfica, nivel) %>%
  dplyr::summarise(cantidad = n())

#Generaremos un gráfico para ver mejor los resultados de la data
datos %>% 
  dplyr::group_by(nombre.región, área.geográfica, nivel) %>%
  dplyr::summarise(cantidad = n()) %>%
  # Aquí comenzamos a realizar el gráfico para visualizar mejor los resultados
  ggplot(aes(x =  nombre.región, y = cantidad, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Cantidad de niños", x = " ")+
  facet_wrap(~área.geográfica)

#¿Qué puede concluir?

levels(datos$nombre.región)
 
### Las regiones se encuentran mal etiquetadas, o con nombres diferentes

#Hay que renombrar las regiones de nuestros datos 

levels(datos$nombre.región)[1] <- "Región de Antofagasta"
levels(datos$nombre.región)[2] <- "Región de La Araucanía"
levels(datos$nombre.región)[3] <- "Región de Arica y Parinacota"
levels(datos$nombre.región)[4] <- "Región de Atacama"
levels(datos$nombre.región)[5] <- "Región de Aysén del Gral. Carlos Ibáñez del Campo"
levels(datos$nombre.región)[6] <- "Región del Biobío"
levels(datos$nombre.región)[7] <- "Región de Coquimbo"
levels(datos$nombre.región)[8] <- "Región del Libertador Gral. Bernardo O’Higgins"
levels(datos$nombre.región)[9] <- "Región de Los Lagos"
levels(datos$nombre.región)[10] <- "Región de Los Ríos"
levels(datos$nombre.región)[11] <- "Región de Magallanes y de la Antártica Chilena"
levels(datos$nombre.región)[12] <- "Región del Maule"
levels(datos$nombre.región)[13] <- "Región Metropolitana de Santiago"

## Ojo con los cambios que siguen
levels(datos$nombre.región)

levels(datos$nombre.región)[16] <- "Región de Tarapacá"
levels(datos$nombre.región)

## También podemos realizar algún cambio así

levels(datos$nombre.región)[which(levels(datos$nombre.región) == "Valparaíso")] <- "Región de Valparaíso"
##Qué hace el comando which()? 
#

## Haremos una tabla resumen, agruparemos por región, área geográfica (Rural o urbano) y nivel (Pre kinder o Primero básico)
Resumen_1 <- datos %>% 
  dplyr::group_by(nombre.región, área.geográfica, nivel) %>%
  dplyr::summarise(total_ninos_desnutricion = sum(niños.con.desnutrición),
            total_ninos_BajoPeso = sum(niños.con.bajo.peso),
            total_ninos_PesoNormal = sum(niños.con.peso.normal),
            total_ninos_Obesidad = sum(niños.con.obesidad),
            total_ninos_retraso_Talla = sum(niños.con.retraso.en.talla),
            total_ninas_desnutricion = sum(niñas.con.desnutrición),
            total_ninas_BajoPeso = sum(niñas.con.bajo.peso),
            total_ninas_PesoNormal = sum(niñas.con.peso.normal),
            total_ninas_retraso_Talla = sum(niñas.con.retraso.en.talla),
            total_ninas_Obesidad = sum(niñas.con.obesidad))

#Vemos un ejemplo de los datos que tenemos, tenemos los totales de niños por región, área geográfica y nivel de cada variable.
head(Resumen_1)

#Ahora, graficaremos para ver mejor los resultados de esa tabla
ggplot(Resumen_1, aes(x = nombre.región, y = total_ninos_desnutricion, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Total niños con desnutrición", x = " ")+
  facet_wrap(~área.geográfica)

## ¿Qué nos damos cuenta al ver el gráfico? 
 
##Ahora, si vemos el total de niños con obesidad por región

ggplot(Resumen_1, aes(x = nombre.región, y = total_ninos_Obesidad, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Total niños con obesidad por región", x = " ")+
  facet_wrap(~área.geográfica)

## Vemos que no es posible comparar entre regiones, debido a que la cantidad de niños por región es diferente
# Calcularemos la proporción de niños para cada variable

Resumen_2 <- datos %>% 
  dplyr::group_by(nombre.región, área.geográfica, nivel) %>%
  dplyr::summarise(total.ninos = sum(total.niños),
                   total.ninas = sum(total.niñas),
                   prop_ninos_desnutricion = (sum(niños.con.desnutrición)/total.ninos)*100,
                   prop_ninos_BajoPeso = (sum(niños.con.bajo.peso)/total.ninos)*100,
                   prop_ninos_PesoNormal = (sum(niños.con.peso.normal)/total.ninos)*100,
                   prop_ninos_Obesidad = (sum(niños.con.obesidad)/total.ninos)*100,
                   prop_ninos_retraso_Talla = (sum(niños.con.retraso.en.talla)/total.ninos)*100,
                   prop_ninas_desnutricion = (sum(niñas.con.desnutrición)/total.ninas)*100,
                   prop_ninas_BajoPeso = (sum(niñas.con.bajo.peso)/total.ninas)*100,
                   prop_ninas_PesoNormal = (sum(niñas.con.peso.normal)/total.ninas)*100,
                   prop_ninas_retraso_Talla = (sum(niñas.con.retraso.en.talla)/total.ninas)*100,
                   prop_ninas_Obesidad = sum((niñas.con.obesidad)/total.ninas)*100)

# ¿Qué puedes deducir con el siguiente gráfico? 
#
ggplot(Resumen_2, aes(x =  nombre.región, y = prop_ninos_desnutricion, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Porcentaje de niños con desnutrición", x = " ")+
  facet_wrap(~área.geográfica)

# ¿Qué puedes deducir con el siguiente gráfico? 
#
ggplot(Resumen_2, aes(x =  nombre.región, y = prop_ninas_desnutricion, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Porcentaje de niñas con desnutrición", x = " ")+
  facet_wrap(~área.geográfica)

# ¿Qué puedes deducir con el siguiente gráfico? 
#
ggplot(Resumen_2, aes(x =  nombre.región, y = prop_ninos_Obesidad, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Porcentaje de niños con obesidad", x = " ")+
  facet_wrap(~área.geográfica)

# ¿Qué puedes deducir con el siguiente gráfico? 
#
ggplot(Resumen_2, aes(x =  nombre.región, y = prop_ninas_Obesidad, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Porcentaje de niñas con obesidad", x = " ")+
  facet_wrap(~área.geográfica)

### Si queremos ver cuál es la región que tiene una mayor cantidad de niños con desnutrición y la mayor que tiene obesidad?
Resumen_2 %>%
  dplyr::arrange(desc(prop_ninos_desnutricion)) %>%
  dplyr::select(nombre.región, área.geográfica, nivel, prop_ninos_desnutricion) %>% 
  .[1:10,]  # Rescatamos los 10 primeros casos

Resumen_2 %>%
  dplyr::arrange(desc(prop_ninos_Obesidad)) %>%
  dplyr::select(nombre.región, área.geográfica, nivel, prop_ninos_Obesidad) %>%
  .[1:10,]

## Podemos filtrar por región
 Resumen_2 %>% 
  dplyr::filter(nombre.región == 'Región del Biobío') %>%
   dplyr::select(nivel,prop_ninos_desnutricion, prop_ninos_PesoNormal, prop_ninos_Obesidad,
                 prop_ninas_desnutricion, prop_ninas_PesoNormal, prop_ninas_Obesidad) %>%
   arrange(nivel)
 
 Resumen_2 %>% 
   dplyr::filter(nombre.región == 'Región del Biobío' | nombre.región == "Región de Magallanes y de la Antártica Chilena") %>%
   dplyr::select(nivel,prop_ninos_desnutricion, prop_ninos_PesoNormal, prop_ninos_Obesidad,
                 prop_ninas_desnutricion, prop_ninas_PesoNormal, prop_ninas_Obesidad) %>%
   arrange(nombre.región, área.geográfica)

 


datos <- read.csv("DatosJunaeb_2016-2017.csv", header = TRUE, sep = ";", dec = ",")

#Vemos un resumen de los datos, con el comando head, tenemos 
#los 6 primeros registros de nuestra tabla.

head(datos)

## Usando las herramientas de la librería Dplyr podemos realizar resúmenes
# de la información que en una tabla completa no podríamos ver. 
names(datos)

# Vemos un resumen de cada variable de nuestros datos

summary(datos)

## Eliminamos algunos datos "NA" 
datos <- na.omit(datos)

# Si utilizamos la tabla sin asignar, sólo se mostrarán los resultados, no guardará otra tabla

datos %>% 
  dplyr::group_by(nombre.región, área.geográfica, nivel) %>%
  dplyr::summarise(cantidad = n())

#Generaremos un gráfico para ver mejor los resultados de la data
datos %>% 
  dplyr::group_by(nombre.región, área.geográfica, nivel) %>%
  dplyr::summarise(cantidad = n()) %>%
  # Aquí comenzamos a realizar el gráfico para visualizar mejor los resultados
  ggplot(aes(x =  nombre.región, y = cantidad, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Cantidad de niños", x = " ")+
  facet_wrap(~área.geográfica)

#¿Qué puede concluir?

levels(datos$nombre.región)
 
### Las regiones se encuentran mal etiquetadas, o con nombres diferentes

#Hay que renombrar las regiones de nuestros datos 

levels(datos$nombre.región)[1] <- "Región de Antofagasta"
levels(datos$nombre.región)[2] <- "Región de La Araucanía"
levels(datos$nombre.región)[3] <- "Región de Arica y Parinacota"
levels(datos$nombre.región)[4] <- "Región de Atacama"
levels(datos$nombre.región)[5] <- "Región de Aysén del Gral. Carlos Ibáñez del Campo"
levels(datos$nombre.región)[6] <- "Región del Biobío"
levels(datos$nombre.región)[7] <- "Región de Coquimbo"
levels(datos$nombre.región)[8] <- "Región del Libertador Gral. Bernardo O’Higgins"
levels(datos$nombre.región)[9] <- "Región de Los Lagos"
levels(datos$nombre.región)[10] <- "Región de Los Ríos"
levels(datos$nombre.región)[11] <- "Región de Magallanes y de la Antártica Chilena"
levels(datos$nombre.región)[12] <- "Región del Maule"
levels(datos$nombre.región)[13] <- "Región Metropolitana de Santiago"

## Ojo con los cambios que siguen
levels(datos$nombre.región)

levels(datos$nombre.región)[16] <- "Región de Tarapacá"
levels(datos$nombre.región)

## También podemos realizar algún cambio así
levels(datos$nombre.región)[which(levels(datos$nombre.región) == "Valparaíso")] <- "Región de Valparaíso"

## Haremos una tabla resumen, agruparemos por región, área geográfica (Rural o urbano) y nivel (Pre kinder o Primero básico)
Resumen_1 <- datos %>% 
  dplyr::group_by(nombre.región, área.geográfica, nivel) %>%
  dplyr::summarise(total_ninos_desnutricion = sum(niños.con.desnutrición),
            total_ninos_BajoPeso = sum(niños.con.bajo.peso),
            total_ninos_PesoNormal = sum(niños.con.peso.normal),
            total_ninos_Obesidad = sum(niños.con.obesidad),
            total_ninos_retraso_Talla = sum(niños.con.retraso.en.talla),
            total_ninas_desnutricion = sum(niñas.con.desnutrición),
            total_ninas_BajoPeso = sum(niñas.con.bajo.peso),
            total_ninas_PesoNormal = sum(niñas.con.peso.normal),
            total_ninas_retraso_Talla = sum(niñas.con.retraso.en.talla),
            total_ninas_Obesidad = sum(niñas.con.obesidad))

#Vemos un ejemplo de los datos que tenemos, tenemos los totales de niños por región, área geográfica y nivel de cada variable.
head(Resumen_1)

#Ahora, graficaremos para ver mejor los resultados de esa tabla
ggplot(Resumen_1, aes(x = nombre.región, y = total_ninos_desnutricion, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Total niños con desnutrición", x = " ")+
  facet_wrap(~área.geográfica)

## ¿Qué nos damos cuenta al ver el gráfico? 
 
##Ahora, si vemos el total de niños con obesidad por región

ggplot(Resumen_1, aes(x = nombre.región, y = total_ninos_Obesidad, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Total niños con obesidad por región", x = " ")+
  facet_wrap(~área.geográfica)

## Vemos que no es posible comparar entre regiones, debido a que la cantidad de niños por región es diferente
# Calcularemos la proporción de niños para cada variable

Resumen_2 <- datos %>% 
  dplyr::group_by(nombre.región, área.geográfica, nivel) %>%
  dplyr::summarise(total.ninos = sum(total.niños),
                   total.ninas = sum(total.niñas),
                   prop_ninos_desnutricion = (sum(niños.con.desnutrición)/total.ninos)*100,
                   prop_ninos_BajoPeso = (sum(niños.con.bajo.peso)/total.ninos)*100,
                   prop_ninos_PesoNormal = (sum(niños.con.peso.normal)/total.ninos)*100,
                   prop_ninos_Obesidad = (sum(niños.con.obesidad)/total.ninos)*100,
                   prop_ninos_retraso_Talla = (sum(niños.con.retraso.en.talla)/total.ninos)*100,
                   prop_ninas_desnutricion = (sum(niñas.con.desnutrición)/total.ninas)*100,
                   prop_ninas_BajoPeso = (sum(niñas.con.bajo.peso)/total.ninas)*100,
                   prop_ninas_PesoNormal = (sum(niñas.con.peso.normal)/total.ninas)*100,
                   prop_ninas_retraso_Talla = (sum(niñas.con.retraso.en.talla)/total.ninas)*100,
                   prop_ninas_Obesidad = sum((niñas.con.obesidad)/total.ninas)*100)

# ¿Qué puedes deducir con el siguiente gráfico? 
#
ggplot(Resumen_2, aes(x =  nombre.región, y = prop_ninos_desnutricion, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Porcentaje de niños con desnutrición", x = " ")+
  facet_wrap(~área.geográfica)

# ¿Qué puedes deducir con el siguiente gráfico? 
#
ggplot(Resumen_2, aes(x =  nombre.región, y = prop_ninas_desnutricion, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Porcentaje de niñas con desnutrición", x = " ")+
  facet_wrap(~área.geográfica)

# ¿Qué puedes deducir con el siguiente gráfico? 
#
ggplot(Resumen_2, aes(x =  nombre.región, y = prop_ninos_Obesidad, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Porcentaje de niños con obesidad", x = " ")+
  facet_wrap(~área.geográfica)

# ¿Qué puedes deducir con el siguiente gráfico? 
#
ggplot(Resumen_2, aes(x =  nombre.región, y = prop_ninas_Obesidad, fill = nivel)) +
  geom_bar(position = "dodge",stat = "identity") +
  coord_flip() +
  labs(y = "Porcentaje de niñas con obesidad", x = " ")+
  facet_wrap(~área.geográfica)

### Si queremos ver cuál es la región que tiene una mayor cantidad de niños con desnutrición y la mayor que tiene obesidad?
Resumen_2 %>%
  dplyr::arrange(desc(prop_ninos_desnutricion)) %>%
  dplyr::select(nombre.región, área.geográfica, nivel, prop_ninos_desnutricion) %>% 
  .[1:10,]  # Rescatamos los 10 primeros casos

Resumen_2 %>%
  dplyr::arrange(desc(prop_ninos_Obesidad)) %>%
  dplyr::select(nombre.región, área.geográfica, nivel, prop_ninos_Obesidad) %>%
  .[1:10,]

## Podemos filtrar por región
 Resumen_2 %>% 
  dplyr::filter(nombre.región == 'Región del Biobío') %>%
   dplyr::select(nivel,prop_ninos_desnutricion, prop_ninos_PesoNormal, prop_ninos_Obesidad,
                 prop_ninas_desnutricion, prop_ninas_PesoNormal, prop_ninas_Obesidad) %>%
   arrange(nivel)
 
 Resumen_2 %>% 
   dplyr::filter(nombre.región == 'Región del Biobío' | nombre.región == "Región de Magallanes y de la Antártica Chilena") %>%
   dplyr::select(nivel,prop_ninos_desnutricion, prop_ninos_PesoNormal, prop_ninos_Obesidad,
                 prop_ninas_desnutricion, prop_ninas_PesoNormal, prop_ninas_Obesidad) %>%
   arrange(nombre.región, área.geográfica)
