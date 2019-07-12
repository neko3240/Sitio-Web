### borrado de variables 

rm(list = ls())

###installar y utilizar paquetes
#install.packages("rvest")
library(rvest)


#insertar link de sitio web (ya tiene el criterio de busqueda integrado en la url)

Pagina <- "https://www.falabella.com/falabella-cl/category/cat7480067/Relojes-deportivos"

#Leer informacion del sitio

Pagina_read <- read_html(Pagina)

#Espesificar el area a extraerse informacion

Pagina_Nodes <- html_nodes(Pagina_read,'.content__image')

#Referirce a links individuales

referencias <- html_attr(Pagina_Nodes,"href")


for(i in referencias){
  print(i)
  
  Infoproducto <- read_html(i)

  Nombre <- html_text(html_nodes(Infoproducto,".product-title"))
  print(Nombre)

  Precio <- html_text(html_nodes(Infoproducto,".product-price-value"))
  print(Precio)

  Imagen <- html_text(html_nodes(Infoproducto,".magnifier-image"))
  print(Imagen)

Print("------------------------------------------------------")

  }


