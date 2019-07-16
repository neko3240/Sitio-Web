### borrado de variables 

rm(list = ls())

###installar y utilizar paquetes
#install.packages("rvest")
library(rvest)


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

for(i in referencias){
nombre <- i
nombre <- gsub("/m/","",nombre)
print("Titulo:")
print(nombre)

link <-  paste("https://www.rottentomatoes.com",i, sep="")

paginaunica <- read_html(link)
puntaje <- html_text(html_nodes(paginaunica,".mop-ratings-wrap__percentage"))
print("Puntaje:")
for(e in puntaje){
puntaje2 <- e
puntaje2 <- gsub("\n","",puntaje2)
print(puntaje2)
}
print("------------------------------------------------------")
}


