#install.packages("rvest")
library(rvest)


pagina <- read_html("Sitio Web .html")

NodesDelHTML <- html_nodes(pagina,".noticia")

texto <- html_text(NodesDelHTML)

print(texto)

#texto <- gsub("\n","", texto)
texto <- gsub("\t","", texto)
texto <- gsub("\r","", texto)
print(texto)

write(texto,file = "texto.txt", sep = ";")
#----------------------------------------------------

pagina <- read_html("Sitio Web .html")

NodesDelHTML <- html_nodes(pagina,".tabla")

tabla <- html_table(NodesDelHTML)[[1]]

print(tabla)
print()
tabla$X2<- gsub("\\$"," ",tabla$X2)
tabla$X3<- gsub("\\$"," ",tabla$X3)
tabla$X2 <- gsub("[.]"," ",tabla$x2)
tabla$X3 <- gsub("[.]"," ",tabla$x3)


strsplit()

tolower()

unlist()

table()

as.data.frame()

write.table(tabla,file = "palabrasnoticias.cvs", sep = ";")

#extraccion informacion tabla 1

tabla1 <- html_table(NodesDelHTML[1][[1]])

#extraccion info tabla 2

tabla2 <- html_table(NodesDelHTML[2][[1]])

#buscar en el data frame
tablmergeproductossupermercado <-paste(tablamergeproductos," ", tablamergesuper)

#boxplot
#tableMerge %>%

## scar forma del fera chileno
  
PaginaChilenaDelLibr <- "https://www.feriachilenadellibro.cl/"

PaginaChilenaDelRead <- read_html(PaginaChilenaDelLibr)

PaginaChilenaNodesReferences <- html_nodes(PaginaChilenaDelRead,".product-item-photo")

referencias <- html_attr(PaginaChilenaNodesReferences,"href")

for(refe in referencias){
  print(refe)
lecturalibro <- read_html(refe)
precio <- html_text(html_nodes(lecturalibro,".price"))
print(precio)
}



