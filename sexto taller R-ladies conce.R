#Bienvenid@ a nuestro 6to taller sobre Rmarkdown!
#Rmarkdown es un formato qu epermite una f�cil creaci�n de documentos,
#presentaciones din�micas e informes de R. Rmarkdown es un formato de sintaxis
#simplepara crear documentos en HTML, PDF y Word, para comenzar debemos instalar 
#el paquete knitr y el paquete rmarkdown
######markdown es m�s liviano que l�tex
install.packages("knitr")
install.packages("rmarkdown")
library("knitr")
library("rmarkdown")
#Luego accedemos a Rmarkdown de la siguiente manera:
#"File"-> "New File" -> "R Markdown..." 
#se abrir� un Script con formato ".Rmd"
#en el bot�n "Knit" se puede modificar el formato del archivo (PDF, HTML y Word)
############################
Texto plano
Termina linea con dos espacios para nuevo p�rrafo.
*cursivo* y _cursivo_
**negrita** y __negrita__
super�ndice^2^
  ~~tachado~~
  [eslab�n](www.rstudio.com)
# Encabezado 1
## Encabezado 2
### Encabezado 3
#### Encabezado 4
##### Encabezado 5
###### Encabezado 6
raya em: --
  raya em: ---
  elipsis: ...
ecuaci�n en l�nea: $A = \pi*r^{2}$
  imagen: ![](camino/a/smallorb.png)

regla horizontal (o nueva diapositiva):
  ***
  > cita en bloque
* lista sin orden
* elemento 2
+ sub-elemento 1
+ sub-elemento 2

1. lista ordenada
2. elemento 2
+ sub-elemento 1
+ sub-elemento 2
Encabezado Tabla | Segundo Encabezado
----------------- | -------------------
  Celda de tabla | Celda 2
Celda 3 | Celda 4 