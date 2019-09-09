#Hola!! Bienvenid@ a la introducción de R por de R-Ladies Concepción!, queremos que te
#sientas cómod@ y con la libertad de plantearnos cualquier tipo de duda, estamos
#para apoyarte!

# Si ya tienes el programa R o RStudio instalado en tu ordenador, daremos inicio al
#taller, en caso contrario, puedes dar aviso a una de las coordinadoras y
#te ayudaremos con la instalación.

#El código de R está disponible como software libre bajo las condiciones de la licencia GNU/GPL.
#Además, pretenden que RStudio sea tan sencillo e intuitivo como sea posible para proporcionar un
#entorno amigable, tanto para los ya experimentados como para los nuevos usuarios de R.

# <- Sirve para realizar comentarios en la consola.
#Esto se puede realizar anteponiendo el símbolo Hash (#) antes de tu código sin que se ejecuten los comandos.

#El editor (Script), permite escribir, ejecutar y modificar las líneas de código y guardarlas para el futuro.

#Para ejecutar los códigos en RStudio se logra haciendo click en Run (Parte superior derecha del Script) o
#se puede ejecutar desde el editor, colocando el cursor en tu línea de comando (R script) presionando (ctrl + enter)
#o desde MAC (cmd + enter).

## Algo importante es que R es sensible a las mayúsculas y minúsculas, es decir, se debe respetar la sintaxis tal cual es.'"

################################################
##           R como calculadora                #
################################################

# Comenzaremos haciendo nuestra primera suma, para esto no es necesario instalar o abrir ningún paquete,
#podemos sumar cualquier número sin necesidad de asignar nombres a éstos, para demostrarlo necesitamos
#que elijas tus números favoritos la suma de tus números es la siguiente:

inserta tu n° favorito 1 + inserta tu n° favorito 2

# Algunos ejemplos sobre las operaciones que puedes realizar con R.

#Suma y resta
2+2
2-2

#División
8 / 2

#Multiplicación
2 * 2

#División entera, se devuelve la parte entera solamente
5%/%2

#Módulo, resto de dividir un número por otro
5%%2

#Potenciaciación
2^3

#Número exponencial
exp(2)

#Raíz cuadrada
sqrt(4)

#Un valor absoluto
abs(-5)

# Valor de pi
pi

#Factorial de un número
factorial(1:5)
factorial(5)

###########################################################
# Cosultas y ayuda                                        #
###########################################################

# Y también se puede pedir ayuda e información sobre paquetes o algunas con las siguientes instrucciones

help(pi)
?pi

# Se despliega en un recuadro la información que has pedido, lo puedes intentar con lo que estimes conveniente :)
###########################################################
#   Inicio Vectores                                       #
###########################################################

# La estructura más básica en R es un vector. incluso si es un número singular como lo vimos en los ejemplos anteriores.
# Un vector es básicamente una secuencia o un set de valores, los cuales pueden ser de tipo numérico, carácter o lógico.
#Se asigna con " <- " y siempre antes de los paréntesis debe ir "c", como se muestra en los siguientes ejemplos.

x <- c(1, 2, 3, 4, 5)
y <- c("a", "b", "c", "d", "e")
z <- c(TRUE, TRUE, FALSE, TRUE, FALSE)

# De esta manera, se puede llamar el vector desde ahora
x
y
z

# Podemos crear un vector en forma abreviada y podemos realizar operaciones de suma de vectores.
#Para esto podemos crear vectores usando: operadores (+,-,*, etc).

x <- 1:5 #Podemos generar un vector secuencial sólo agregando el ("número inicial:número final.")
x

y <- c(6, 7, 8, 9, 10)
y

z <- x + y
z

# Puedes ver claramente en los fragmentos de códigos anteriores que solo sumamos dos vectores
# Usando solo el operador + se puede obtener el resultado. Esto es conocido como vectorización.

MultpVectores <- c(1,3,5,7,9) * 2

# Para sacar la raíz cuadrada del vector la función sqrt

RaízVector <- sqrt(c(1,4,9,16))
RaízVector

# Valores especiales en los vectores
#Desde el comienzo en tus datos te encontrarás tratando con un montón de datos desordenados y sucios
#en el proceso de análisis de datos.

#Es importante recordar algunos de los valores especiales en R para que no te sorprendas cuando te
#aparezcan en la consola.

1/0
Inf # si aparece Inf en la consola quiere enunciar Infinito, en este caso es por Indefinición o indeterminació al dividir por 0.

0/0
NaN # si aparece NaN quiere decir que "No es un Número". Puede ser un vector categorial.

Inf/NaN

Inf/Inf

log(Inf)

Inf + NA
# si aparece NA indica un valor perdido o no disponible.

# los siguientes fragmentos de códigos muestran algunos tests "lógicos" para R sobre estos valores especiales
#y sus resultados. Hay que recodar que FALSE y TRUE son tipo de datos de valor lógico, similares a otros
#lenguajes de programación.

vec <- c(0, Inf, NaN, NA)

is.finite (vec)

is.nan(vec)

is.na(vec)

is.infinite(vec)

# Estas funciones son bastante autoexplicativas por sus propios nombres.
#Ellas claramente indican cuales valores son infinitos y cuales son para "NaN y NA".

#En el siguiente fragmento de códigos usaremos "seq" para realizar funciones que sirve para realizar vectores.

a <- c(2.5:4.5, 6,7, c(8, 9, 10), c(12:15))
a

b <- vector("numeric", 5)
b

c <- vector("logical", 5)
c

d <- logical(5)
d

# "seq" es una función que crea secuencias

seq(1,10)

seq(1, 10, 2)

seq(10)

#Una de las mas importantes operaciones que podemos hacer sobre vectores está relacionado con subconjuntos e
#indexación de vectores para acceder a elementos específicos. Frecuentemente, se utiliza esta función cuando
#queremos correr algún código sobre algún punto específico de la data.

#Los siguientes ejemplos muestran algunas formas con las cuales podemos indexar y hacer subconjunto de vectores.

vec <- c("R", "Python", "Julia", "Haskell", "Java", "Scala")

## ¿Qué hacen las siguientes sintaxis?

vec[1]

vec[-1]

vec[2:4]

vec[c(1, 3, 5)]

nums <- c(5, 8, 10, NA, 3, 11)
nums

which.min(nums) # índice del mínimo de elementos

which.max(nums) #índice de máximo de elementos

nums[which.min(nums)] # el elemento mínimo

nums [which.max(nums)] # el elemento máximo

which(is.na(nums)) #

#Nonbramiento de vectores
#Esta es una ingeniosa característica de R donde puedes etiquetar acada elemento de un vector
#para hacer mas legible o mas fácil la interpretación de los datos.
#Existen dos formas en que se pueden etiquetar los vectores. Ambas dan los mismos resultados:

# Forma 1

c(first = 1, second = 2, third = 3, fourth = 4, fifth = 5)

#Forma 2

positions <- c(1,2,3,4,5)
names(positions)

names (positions) <- c("first", "second", "third", "fourth", "fifth")
positions

names(positions)

positions[c("second", "fourth")]

#######################################
#                MATRICES             #
#######################################

# Una matriz es un arreglo bidimensional de números.
# Hay varias maneras de definir una matriz en R. Si es una matriz pequeña podemos utilizar la siguiente sintaxis:

## Primero creamos el vector que queremos utilizar en la matriz.
datos <- c(1,2,3,4,5,6,7,8,9)

A <- matrix(datos, nrow = 3, ncol = 3, byrow = TRUE)
A
# Con el argumento nrow hemos indicado el número de filas de nuestra matriz,
# con ncol el número de columnas;
#a continuación hemos puesto los valores que forman la matriz (los valores del 1 al 9), y le hemos pedido a R
#que use esos valores para rellenar la matriz A por filas (byrow=TRUE).

#La matriz A construída:

A

#Comprobar como queda la matriz con byrow=FALSE

A <- matrix(datos, nrow = 3, ncol = 3, byrow = FALSE)

A

## Podemos nombrar cada columna
colnames(A) <- c("first", "second", "third")
A
rownames(A) <- c("R", "Julia","Python")
A

#Si disponemos de varios vectores de la misma longitud que queremos utilizar como filas (o columnas)
#de una matriz, podemos utilizar la función rbind() para unirlos por filas, o la función cbind() para
#unirlos por columnas, como vemos en el siguiente ejemplo:

vector1 <- c(1, 2, 3, 4)
vector2 <- c(5, 6, 7, 8)
vector3 <- c(9, 10, 11, 12)

M1 <- cbind(vector1, vector2, vector3) # Unimos por columnas
M1

# Utilizando rbind, compara el resultado con la matriz M1 anterior.

M2 <- rbind(vector1, vector2, vector3) # Unimos por filas
M2

#Se pueden seleccionar partes de una matriz utilizando los índices de posición [fila, columna] entre corchetes.
#El siguiente ejemplo ilustra la forma de hacerlo:

A[2,3]   # Se selecciona el valor de la fila 2, columna 3

A[2,]    # Se selecciona la fila 2 completa

A[,3]    # Se selecciona la columna 3 completa

A[1,2:3] # Se seleccionan el segundo y tercer valor de la fila 1

dim(A) #Permite conocer las dimensiones de la matriz, cuantas columnas y filas tiene el arreglo.


#Operaciones con matrices
#La función diag() extrae la diagonal principal de una matriz:

diag(A)

#También permite crear matrices diagonales:

diag(c(1,2,3,4))

## Multiplicación de matrices.

M1 %*% M2

## Transponer una matriz

M1
t(M1)

## suma de matrices
M1 + t(M2)

#Los data frames son estructuras de datos de dos dimensiones
#(rectangulares) que pueden contener datos de diferentes tipos, por lo tanto,
#son heterogéneas. Esta estructura de datos es la más usada para realizar 
#análisis de datos y seguro te resultará familiar si has trabajado con otros
#paquetes estadísticos.
#Podemos entender a los data frames como una versión más flexible de una matriz.
#mientras que en una matriz todas las celdas deben contener datos del mismo tipo
#los renglones de un data frame admiten datos de distintos tipos, pero sus 
#columnas conservan la restricción de contener datos de un sólo tipo.

#En términos generales, los renglones en un data frame representan casos, 
#individuos u observaciones, mientras que las columnas representan atributos, 
#rasgos o variables.
#Un data frame está compuesto por vectores.
#Además, podemos asignar un nombre a cada vector, que se convertirá en el 
#nombre de la columna.Como todos los nombres, es recomendable que este sea 
#claro, no ambiguo y descriptivo.
#Creando un Data Frame
#como ya mencionamos un data frame está compuestos por vectores, por ende, procederemos
#a crear los vectores con datos
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

datospaciente[1:2]
#o también podemos especificar (o "llamar") las columnas utilizando los nombres designados

datospaciente[c("diabetes","estado")]

datospaciente[3:4]

#la notación $ es usada para indicar una variable particular en un data frame dado
datospaciente$edad

datospaciente$paciente

datospaciente$diabetes

datospaciente$estado


#Si se quiere tabular el tipo de "diabetes" según "estado" se usa el siguiente comando
table(datospaciente$diabetes, datospaciente$estado)

##Manipulación de Data Frames##
install.packages("UsingR")
install.packages("scales")
install.packages("dplyr")
library(UsingR)
library(dplyr)
library(scales)

#Using R contiene la base de datos de una maratón de 2002, base de datos que analizaremos

data <- UsingR::nym.2002

#para comenzar a filtrar se usa el comando select

edades <- select(data,age)

#si uno quiere calcular por ejemplo la media de las edades marca 
#un error porque se trata de una matriz
#no se puede calcular la media de una matriz, 
#asi que hay que deselistar los elementos de la matriz con el comando unlist

edades <- select(data, age) %>% unlist
edades

#para calcular la media entonces:
mean(edades)
#para calcular la desviaciÃ³n estandar
sd(edades)
#el histograma de los corredores
hist(edades)

#---para calcular las edades por gÃ©nero mujeres
#se filtra a travÃ©s del comando filter

muj <- filter(data, gender=="Female")
edmuj <- select(muj, age) %>% unlist
mean(edmuj)

hist(edmuj)

##----calculando lo mismo para los hombres
hom <- filter(data, gender=="Male")
edhom <- select(hom, age) %>% unlist
mean(edhom)
hist(edhom)
###############################################
#Funciones gráficas

#title() permite añadir un título o subtítulo.
#font() Fuente a usar en el texto.
#las() Cambia el estilo de las etiquetas de los ejes (0 paralelo a los ejes, 1 siempre horizontales, 2, perpendiculares a los ejes, 3 siempre verticales)
#col() Color usado para el gráfico (ya sea para puntos, líneas.). Puede vers un listado completo de los colores disponibles en R ejecutando la función colors(). help(colors) explica como obtener aún más colores. Este documento contiene una muestra de cada color.

colors() #Listado completo de los colores disponibles en R
help(colors) #Explica como obtener aún más colores
#utilizaremos una base de datos que contiene el salario de trabajadores según su género
install.packages("Lock5Data")
library(Lock5Data)
data("SalaryGender")
attach(SalaryGender)
#Podemos ver la distribución de salarios entre hombres y mujeres mediante un histograma 
#combinado utilizando la función histStack() del paquete plotrix
install.packages("plotrix")
library(plotrix)
histStack(Salary,Gender,legend.pos="topright")

#procederemos a llamar la nueva base de datos a utilizar, pero antes instalamos y abrimos el paquete
#Lock5Data que contiene la base de datos que utilizaremos, "barplot" se utiliza para dibujar diagramas
#de barras. El siguiente ejemplo muestra el número de países en cada una de las 7 regiones en que 
#se dividió el planeta para el estudio de los niveles de felicidad:
data("HappyPlanetIndex")
attach(HappyPlanetIndex)
barplot(table(Region),xlab="Region",main="Happiness level by region", col=rainbow(10))


#El paquete plotrix contiene la función barp() que permite dar "volumen" a la barras:

barp(table(Region),col="lightblue",cylindrical=TRUE,shadow=TRUE)


#Es posible construir diagramas de barras por categorías; podemos, por ejemplo representar la frecuencia de 
#doctores por sexo utilizando los datos del dataframe SalaryGender


PhD=factor(SalaryGender$PhD,levels=c(0,1),c("PhD","non PhD"))
Gender=factor(SalaryGender$Gender,levels=c(0,1),labels=c("Female","Male"))
barplot(table(Gender,PhD),beside=TRUE,legend.text=TRUE,col=c("pink","cyan"))

#Aporta la misma información que el diagrama de barras, pero en forma de diagrama de sectores

pie(table(Region))

#El paquete plotrix permite elaborar diagramas de sectores en 3D mediante la función pie3D

pie3D(table(Region))

