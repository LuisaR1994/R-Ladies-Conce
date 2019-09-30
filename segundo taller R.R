"'Hola, Bienvenid@ a nuestro segundo taller de R
queremos que sientas confianza para plantear tus dudas durante el desarrollo 
del taller.

########################################################################################
#                      Data Frames                                                     #
########################################################################################

Los data frames son estructuras de datos de dos dimensiones 
(rectangulares) que pueden contener datos de diferentes tipos, por lo tanto,
son heterogeneas. Esta estructura de datos es la mÃ¡s usada para realizar 
análisis de datos y seguro te resultará familiar si has trabajado con otros
paquetes estadísticos.
Podemos entender a los data frames como una versión más flexible de una matriz.

Mientras que en una matriz todas las celdas deben contener datos del mismo tipo
los renglones de un data frame admiten datos de distintos tipos, pero sus 
columnas conservan la restricción de contener datos de un sólo tipo.

En términos generales, los renglones en un data frame representan casos, 
individuos u observaciones, mientras que las columnas representan atributos, 
rasgos o variables.
 Un data frame está compuesto por vectores.

Además, podemos asignar un nombre a cada vector, que se convertirá en el
nombre de la columna. Como todos los nombres, es recomendable que este sea claro, 
no ambiguo y descriptivo.

Como ya mencionamos un data frame está compuestos por vectores, por ende, procederemos
a crear los vectores con datos'"

paciente <- c(1,2,3,4)
paciente

edad <- c(25,34,28,52)
edad

diabetes <- c("Tipo1","Tipo2","Tipo1", "Tipo1")
diabetes

estado <- c("Peor","Mejor","Excelente","Peor")
estado

#Luego de haber creado los vectores con los datos a utilizar, prodeceremos a "juntarlos" en 
#una sola tabla, utilizando el comando "data.frame"

datospaciente <- data.frame(paciente, edad, diabetes, estado)
datospaciente

#Especificando elementos de una data frame según columna

datospaciente[1:3]
#o también podemos especificar (o "llamar") las columnas utilizando los nombres designados

datospaciente[c("diabetes","estado")]

datospaciente[3:4]

#la notación $ es usada para indicar una variable particular en un data frame dado
datospaciente$edad

datospaciente$paciente

datospaciente$diabetes

datospaciente$estado

#Si se quiere tabular el tipo de "diabetes" según "estado" se usa la siguiente sintaxis
table(datospaciente$diabetes, datospaciente$estado)

##Manipulación de Data Frames##

####### Instalando paquetes.
"'La instalación bÃ¡sica de R viene equipada con múltiples funciones para la importaciÃ³n de datos, 
la realización de transformaciones, el ajuste y evaluaciÃ³n de modelos estadísticos, 
las representaciones gráficas, etc. Sin embargo, la enorme potencia de R deriva de su capacidad de
incorporar en cualquier momento nuevas funciones capaces de realizar nuevas tareas.

Un paquete (package) es una colecciÃ³n de funciones, datos y cÃ³digo R que se almacenan en una carpeta
conforme a una estructura bien definida, fÃ¡cilmente accesible para R.

En la web de R se puede consultar la lista de paquetes disponibles. En la actualidad existen mÃ¡s
de 14.000 paquetes disponibles que completan diferentes funciones.

Cuando instalamos R se incorporan por defecto numerosos paquetes. 
Podemos ver una lista de los paquetes que actualmente tenemos instalados en nuestro pc 
ejecutando: https://cran.r-project.org/web/packages/available_packages_by_date.html
'"
# Los paquetes se instalan una sola vez con el siguiente comando -> install.packages(), dentro
# de los parÃ©ntesis debe ir el paquete que vamos a instalar. 

install.packages("UsingR")  
install.packages("scales") # Paquete que permite generar grÃ¡ficos y mapas
install.packages("dplyr") # funciones para anÃ¡lisis de datos

####### Cargando las librerias de los paquetes
### Estas librerías son para hacer uso de aquellos paquetes cargados, es necesario cargarlas cada
# vez que haremos uso de ellas. 
library(UsingR)
library(dplyr)
library(scales)

#Using R contiene el archivo de datos de una maratón de 2002, datos que analizaremos a continuaciÃ³n:

data <- UsingR::nym.2002

# Si queremos seleccionar variables desde nuestra tabla, usaremos el comando select()

edades <- select(data,age)
head(edades) # nos muestra los primeros 6 registros de nuestros datos

# Si uno quiere calcular por ejemplo la media de las edades marca 
# un error porque se trata de una matriz no se puede calcular la media de una matriz, 
# así que hay que deslistar los elementos de la matriz con el comando unlist

edades <- select(data, age) %>% unlist
edades

#para calcular la media entonces:
mean(edades)

#para calcular la desviación estandar
sd(edades)

#el histograma de los corredores
hist(edades)

#---para calcular las edades por género; Por ejemplo para MeanFemaleeres se filtra a través del
#comando filter. como haremos a continuación

Female <- filter(data, gender == "Female")

YearMeanFemale <- select(Female, age) %>% unlist

mean(YearMeanFemale)
hist(YearMeanFemale)

##----calculando lo mismo para los hombres
hom <- filter(data, gender == "Male")
edhom <- select(hom, age) %>% unlist
mean(edhom)
hist(edhom)


########################################
##           Cargar datos en R         #
########################################
# Como vimos, se puede trabajar creando tus propios conjuntos de datos o bien, 
#como veremos a continuación, cargando directamente a R algún dato. 

# En R se pueden importar datos con distintos formatos

###### Otros formatos

# xlsx
install.packages("readxl")
library(readxl)

data <- read_xlsx("NombreDeTuTabla.xlsx", sheet = 'hoja 1')
# sheet: corresponde al nombre de la hoja del excel que quiero leer. 

#SPSS 
install.packages("foreign")
require(foreign)

data <- read.spss("NombreDeTuTabla.sav", use.value.labels = TRUE, max.value.labels = TRUE, to.data.frame = TRUE)

# Stata
require(foreign)
data <- read.dta("NombreDeTuTabla.dta")

# Minitab

data <- read.mtp("NombreDeTuTabla.mtp"
                 
                 # CSV
                 
                 data <- read.csv("NombreDeTuTabla.csv", header = TRUE, sep = ",", dec = ".")

###############################################
#Funciones grÃ¡ficas

#title() permite aÃ±adir un título o subtítulo.
#font() Fuente a usar en el texto.
#las() Cambia el estilo de las etiquetas de los ejes (0 paralelo a los ejes, 1 siempre horizontales, 2, perpendiculares a los ejes, 3 siempre verticales)
#col() Color usado para el gráfico (ya sea para puntos, líneas.). Puede vers un listado completo de los colores disponibles en R ejecutando la funciÃ³n colors(). help(colors) explica como obtener aÃºn mÃ¡s colores. Este documento contiene una muestra de cada color.

colors() #Listado completo de los colores disponibles en R
help(colors) #Explica como obtener aÃºn mÃ¡s colores

#utilizaremos datos que contienen el salario de trabajadores segÃºn su gÃ©nero

install.packages("Lock5Data")
library(Lock5Data)
data("SalaryGender")
attach(SalaryGender) ## Este comando nos permite trabajar con las columnas de nuestra tabla sin problemas

Age

PhD

#Podemos ver la distribuciÃ³n de salarios entre hombres y mujeres mediante un histograma 
#combinado utilizando la funciÃ³n histStack() del paquete plotrix

install.packages("plotrix")
library(plotrix)

histStack(Salary, Gender, legend.pos = "topright", main = " Distribución de Salarios por género")

# Procederemos a llamar la nueva base de datos a utilizar, pero antes instalamos y abrimos el paquete
#Lock5Data que contiene los datos que utilizaremos.
#"barplot" se utiliza para dibujar diagramas de barras. 

#El siguiente ejemplo muestra el número de países en cada una de las 7 regiones en que 
#se dividiÃ³ el planeta para el estudio de los niveles de felicidad:

data("HappyPlanetIndex")
attach(HappyPlanetIndex)
barplot(table(Region) , xlab = "Region", main = "Happiness level by region", col = rainbow(10))

#El paquete plotrix contiene la funciÃ³n barp() que permite dar "volumen" a la barras:

barp(table(Region), col = "tomato4", cylindrical = TRUE, shadow = TRUE)

#Es posible construir diagramas de barras por categorías; 
# Podemos, por ejemplo representar la frecuencia de personas con doctorado por sexo utilizando los 
#datos del dataframe SalaryGender
names(SalaryGender)
library(ggplot2)

SalaryGender$PhD <- factor(SalaryGender$PhD, levels = c(0,1), c("Sin PhD","PhD"))
SalaryGender$Gender <- factor(SalaryGender$Gender, levels = c(0,1), labels = c("Mujer","Hombre"))

SalaryGender %>% group_by(Gender, PhD) %>% summarise(MeanSalary = mean(Salary)) %>%
  ggplot2::ggplot() + 
  geom_bar(stat = "identity",position = position_dodge(width = 1), aes(x = Gender, y = MeanSalary, fill = Gender))+
  facet_wrap(~PhD) +ggtitle("Promedio de salarios por Género")  + theme(legend.position="none") +
  labs(x = " ", y = "Promedio Salarios en $1.000's")

barplot(table(Gender,PhD), beside = TRUE, legend.text = TRUE, col = c("pink","cyan"))

#Aporta la misma informaciÃ³n que el diagrama de barras, pero en forma de diagrama de sectores

pie(table(Region), main = "Gráfico de torta")

# El paquete plotrix permite elaborar diagramas de sectores en 3D mediante la funciÃ³n pie3D

pie3D(table(Region), labelpos = , main = " ¿o de pizza?")

