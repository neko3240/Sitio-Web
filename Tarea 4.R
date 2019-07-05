#install.packages("rvest")
library(rvest)


#Extraer informacion de nuestro sitio web

Pagina_ali <- "https://www.aliexpress.com/wholesale?catId=0&initiative_id=SB_20190703150555&SearchText=reloj+deportivo"

Pagina_ali_read <- read_html(Pagina_ali)

Pagina_ali_NodesRef <- html_nodes(Pagina_ali_read,".picRind history-item")

referencias <- html_attr(Pagina_ali_NodesRef,"href")




for(refe in referencias){
  print(refe)
  Infoproducto <- read_html(i)

  Nombre <- html_text(html_nodes(Infoproducto,".product-title"))
  print(Nombre)

  Precio <- html_text(html_nodes(Infoproducto,".product-price-value"))
  print(Precio)

  Imagen <- html_text(html_nodes(Infoproducto,".magnifier-image"))
  print(Imagen)

Print("------------------------------------------------------")

  }


