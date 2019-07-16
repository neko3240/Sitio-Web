### borrado de variables 

rm(list = ls())

###installar y utilizar paquetes
#install.packages("rvest")
#

#install.packages("ggplot2")
library(rvest)
library(ggplot2)


#insertar link de sitio web (ya tiene el criterio de busqueda integrado en la url)

Pagina <- "https://www.rottentomatoes.com/"

#Leer informacion del sitio

Pagina_read <- read_html(Pagina)

#Espesificar el area a extraerse informacion

Pagina_Nodes <- html_nodes(Pagina_read,'.sidebarInTheaterOpening')

Pagina_Nodes2 <- html_nodes(Pagina_Nodes,'.middle_col')

Pagina_Nodes3 <- html_nodes(Pagina_Nodes2,"a")

#Alistar links individualmente

referencias <- html_attr(Pagina_Nodes3,"href")

TABLA <- matrix(c("nada",0,0),ncol=3,byrow=TRUE)
colnames(TABLA) <- c("Nombre","PC","PP")

row_to_keep = c(FALSE)
TABLA = TABLA[row_to_keep,]

for(i in referencias){
  nombre <- i
  nombre <- gsub("/m/","",nombre)
  nombre <- gsub("_"," ",nombre)
  print("Titulo:")
  print(nombre)
  
  link <-  paste("https://www.rottentomatoes.com",i, sep="")
  paginaunica <- read_html(link)
  puntaje <- html_text(html_nodes(paginaunica,".mop-ratings-wrap__percentage"))
  print("Puntajes:")
  for(e in puntaje){
    puntaje2 <- e
    puntaje2 <- gsub("\n","",puntaje2)
    puntaje2 <- gsub("%","",puntaje2)
    puntaje2 <- gsub(" ","",puntaje2)
    puntaje2 <- as.numeric(puntaje2)
    print(puntaje2)
  }
  
  if (puntaje2 > 100 || puntaje2 < 1){
    puntaje2 <- 0
  }
  TABLA <- rbind(TABLA, c(nombre,puntaje,puntaje))

  print("------------------------------------------------------")
}

TABLA <- gsub("%","",TABLA)
DATAFRAMEPELICULAS <- as.data.frame(TABLA)
DATAFRAMEPELICULAS$PP <- gsub(" ","",DATAFRAMEPELICULAS$PP)
DATAFRAMEPELICULAS$PC <- gsub(" ","",DATAFRAMEPELICULAS$PC)
DATAFRAMEPELICULAS$PP <- as.numeric(DATAFRAMEPELICULAS$PP)
DATAFRAMEPELICULAS$PC <- as.numeric(DATAFRAMEPELICULAS$PC)

DATAFRAMEPELICULAS %>%
  ggplot() +
  aes(x = Nombre, y = PP) +
  geom_bar(stat="identity")+
  coord_flip()


