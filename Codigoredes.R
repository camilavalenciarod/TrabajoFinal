install.packages('igraph')
install.packages('network') 
install.packages('sna')
install.packages('ndtv')
install.packages('visNetwork')

library(igraph)
library(network)
library(sna)
library(ndtv)
library(visNetwork)

base_1 <- read.csv("C:/Users/camila.valencia/Desktop/Efectos Pares/red1.csv", sep=";")
base_2 <- read.csv("C:/Users/camila.valencia/Desktop/Efectos Pares/red2.csv", sep=";")
base_3 <- read.csv("C:/Users/camila.valencia/Desktop/Efectos Pares/red3.csv", sep=";")
base_4 <- read.csv("C:/Users/camila.valencia/Desktop/Efectos Pares/red4.csv", sep=";")
base_5 <- read.csv("C:/Users/camila.valencia/Desktop/Efectos Pares/red5.csv", sep=";")
base_6 <- read.csv("C:/Users/camila.valencia/Desktop/Efectos Pares/red6.csv", sep=";")
Atributos2 <- read.csv ("C:/Users/camila.valencia/Desktop/Efectos Pares/Atributos2.csv", sep=";")
#La red como una matriz




network_1 <- as.matrix(base_1)
#Crea el grafico de la matriz con el cual se pueden hacer todo tipo de analisis
g_1 <- graph.adjacency(network_1)
#Betweenness es 
(b_1 <- betweenness(g_1, directed = FALSE))
#closeness es
(c_1 <- closeness(g_1, mode = "out"))
#degree es 
(d_1 <- degree(g_1, mode = "out"))
#Hace un objeto en formato red para que 
red_1 <-as.network.matrix(network_1)
#grafica la red 
plot.network(red_1)
title(main = "Red de estudio fuera de clase (min 1 x semana)")


## Adjuntar la matriz de la primera base

m=as.matrix(base_1)
net=graph.adjacency(m,mode="undirected",weighted=NULL,diag=FALSE)


#Importar los atributos de los individuos


V(net)$promedio=as.character(Atributos2$nota3[match(V(net)$name,Atributos2$Ind)]) # This code says to create a vertex attribute called "Sex" by extracting the value of the column "Sex" in the attributes file when the Bird ID number matches the vertex name.
V(net)$promedio 
V(net)$color=V(net)$promedio 
V(net)$color=gsub("1","red",V(net)$color) 
V(net)$color=gsub("2","yellow",V(net)$color) 
V(net)$color=gsub("3","green",V(net)$color) 
plot.igraph(net,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)
V(net)$size=degree(net)*0.5 
plot.igraph(net,vertex.label=NA,layout=layout.fruchterman.reingold)
title(main = "Red de estudio fuera de clase (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("Bajo","Medio","Alto")
             , title="Desempeño académico", pt.bg = c("red", "yellow", "green")
             , pch = c(21,21,21))


V(net)$Sex=as.character(Atributos2$Genero[match(V(net)$name,Atributos2$Ind)]) 
#Crea el atributo genero haciendo match en las dos bases por el Ind
V(net)$Sex # Este imprime el atributo
V(net)$color=V(net)$Sex #Asigna el atributo genero al color de los vertices
V(net)$color=gsub("0","purple",V(net)$color) #Mujeres seran moradas
V(net)$color=gsub("1","lightgreen",V(net)$color) #Hombres seran verdes

V(net)$size=degree(net)*0.5 #Hace la grafica segun el grado de conectividad
plot.igraph(net,vertex.label=NA,layout=layout.fruchterman.reingold)
title(main = "Red de estudio fuera de clase (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("Mujeres","Hombres")
             , title="Genero", pt.bg = c("purple",  "lightgreen")
             , pch = 21)


V(net)$estrato=as.character(Atributos2$Estrato[match(V(net)$name,Atributos2$Ind)]) # This code says to create a vertex attribute called "Sex" by extracting the value of the column "Sex" in the attributes file when the Bird ID number matches the vertex name.
V(net)$estrato 
V(net)$color=V(net)$estrato 
V(net)$color=gsub("1","darkblue",V(net)$color) 
V(net)$color=gsub("2","darkblue",V(net)$color) 
V(net)$color=gsub("3","blue1",V(net)$color) 
V(net)$color=gsub("4","blue1",V(net)$color) 
V(net)$color=gsub("5","lightblue",V(net)$color) 
V(net)$color=gsub("6","lightblue",V(net)$color) 
plot.igraph(net,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)

V(net)$size=degree(net)*0.5 
plot.igraph(net,vertex.label=NA,layout=layout.fruchterman.reingold)
title(main = "Red de estudio fuera de clase (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("1 y 2","3 y 4","5 y 6")
             , title="Estratos Socioeconómicos", pt.bg = c("darkblue", "blue1", "lightblue")
             , pch = c(21,21,21))

V(net)$pilo=as.character(Atributos2$pilopaga[match(V(net)$name,Atributos2$Ind)]) 
V(net)$color=V(net)$pilo 
V(net)$color=gsub("0","red",V(net)$color) 
V(net)$color=gsub("1","darkred",V(net)$color) 
plot.igraph(net,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)
V(net)$size=degree(net)*0.5 
plot.igraph(net,vertex.label=NA,layout=layout.fruchterman.reingold)
title(main = "Red de estudio fuera de clase (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("Si","No")
             , title="Beneficiario ser pilo paga", pt.bg = c("darkred",  "red")
             , pch = 21)

V(net)$programa=as.character(Atributos2$programa[match(V(net)$name,Atributos2$Ind)]) 
V(net)$color=V(net)$programa 
V(net)$color=gsub("0","green",V(net)$color) #Programa de Finanzas
V(net)$color=gsub("1","blue",V(net)$color) #Programa de economia
plot.igraph(net,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)
V(net)$size=degree(net)*0.5 
plot.igraph(net,vertex.label=NA,layout=layout.fruchterman.reingold)
title(main = "Red de estudio fuera de clase (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("Finanzas y Comercio Internacional","Economía")
             , title="Programa Academico", pt.bg = c("green",  "blue")
             , pch = 21)

##Ahora trabajare con la red de actividades sociales

network_2 <- as.matrix(base_2)
g_2 <- graph.adjacency(network_2)
(b_2 <- betweenness(g_2, directed = FALSE))
(c_2 <- closeness(g_2, mode = "out"))
(d_2 <- degree(g_2, mode = "out"))
red_2 <-as.network.matrix(network_2)
plot.network(red_2) 
title(main = "Red de planes sociales (min 1 x semana)")


m1=as.matrix(base_2)
net1=graph.adjacency(m1,mode="undirected",weighted=NULL,diag=FALSE)


#Importar los atributos de los individuos


V(net1)$promedio=as.character(Atributos2$nota3[match(V(net1)$name,Atributos2$Ind)]) # This code says to create a vertex attribute called "Sex" by extracting the value of the column "Sex" in the attributes file when the Bird ID number matches the vertex name.
V(net1)$promedio 
V(net1)$color=V(net1)$promedio 
V(net1)$color=gsub("1","red",V(net1)$color) 
V(net1)$color=gsub("2","yellow",V(net1)$color) 
V(net1)$color=gsub("3","green",V(net1)$color) 
plot.igraph(net1,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)
title(main = "Red de actividades sociales (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("Bajo","Medio","Alto")
             , title="Desempeño académico", pt.bg = c("red", "yellow", "green")
             , pch = c(21,21,21))

V(net1)$Sex1=as.character(Atributos2$Genero[match(V(net1)$name,Atributos2$Ind)]) 
#Crea el atributo genero haciendo match en las dos bases por el Ind
V(net1)$Sex1 # Este imprime el atributo
V(net1)$color=V(net1)$Sex1 #Asigna el atributo genero al color de los vertices
V(net1)$color=gsub("0","purple",V(net1)$color) #Mujeres seran moradas
V(net1)$color=gsub("1","lightgreen",V(net1)$color) #Hombres seran verdes
plot.igraph(net1,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)
V(net1)$size=degree(net1)* 0.5 #Hace la grafica segun el grado de conectividad

title(main = "Red de actividades sociales (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("Mujeres","Hombres")
             , title="Genero", pt.bg = c("purple",  "lightgreen")
             , pch = 21)


V(net1)$estrato=as.character(Atributos2$Estrato[match(V(net1)$name,Atributos2$Ind)]) 
V(net1)$estrato 
V(net1)$color=V(net1)$estrato 
V(net1)$color=gsub("1","darkblue",V(net1)$color) 
V(net1)$color=gsub("2","darkblue",V(net1)$color) 
V(net1)$color=gsub("3","blue1",V(net1)$color) 
V(net1)$color=gsub("4","blue1",V(net1)$color) 
V(net1)$color=gsub("5","lightblue",V(net1)$color) 
V(net1)$color=gsub("6","lightblue",V(net1)$color) 
plot.igraph(net1,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)
title(main = "Red de actividades sociales (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("1 y 2","3 y 4","5 y 6")
             , title="Estratos Socioeconómicos", pt.bg = c("darkblue", "blue1", "lightblue")
             , pch = c(21,21,21))

V(net1)$pilo=as.character(Atributos2$pilopaga[match(V(net1)$name,Atributos2$Ind)]) 
V(net1)$color=V(net1)$pilo 
V(net1)$color=gsub("0","red",V(net1)$color) 
V(net1)$color=gsub("1","darkred",V(net1)$color) 
plot.igraph(net1,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)
title(main = "Red de actividades sociales (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("Si","No")
             , title="Beneficiario ser pilo paga", pt.bg = c("darkred",  "red")
             , pch = 21)

V(net1)$programa=as.character(Atributos2$programa[match(V(net1)$name,Atributos2$Ind)]) 
V(net1)$color=V(net1)$programa 
V(net1)$color=gsub("0","green",V(net1)$color) #Programa de Finanzas
V(net1)$color=gsub("1","blue",V(net1)$color) #Programa de economia
plot.igraph(net1,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)

title(main = "Red de actividades sociales (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("Finanzas y Comercio Internacional","Economía")
             , title="Programa Academico", pt.bg = c("green",  "blue")
             , pch = 21)



##Ahora trabajare con la red de actividades deportivas


network_3 <- as.matrix(base_3)
g_3 <- graph.adjacency(network_3)
(b_3 <- betweenness(g_3, directed = FALSE))
(c_3 <- closeness(g_3, mode = "out"))
(d_3 <- degree(g_3, mode = "out"))
red_3 <-as.network.matrix(network_3)
plot.network(red_3)
title(main = "Red de actividades deportivas")


m2=as.matrix(base_3)
net2=graph.adjacency(m2,mode="undirected",weighted=NULL,diag=FALSE)

#Importar los atributos de los individuos

V(net2)$promedio=as.character(Atributos2$nota3[match(V(net2)$name,Atributos2$Ind)]) # This code says to create a vertex attribute called "Sex" by extracting the value of the column "Sex" in the attributes file when the Bird ID number matches the vertex name.
V(net2)$promedio 
V(net2)$color=V(net2)$promedio 
V(net2)$color=gsub("1","red",V(net2)$color) 
V(net2)$color=gsub("2","yellow",V(net2)$color) 
V(net2)$color=gsub("3","green",V(net2)$color) 
plot.igraph(net2,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)
title(main = "Red de actividades deportivas (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("Bajo","Medio","Alto")
             , title="Desempeño académico", pt.bg = c("red", "yellow", "green")
             , pch = c(21,21,21))

V(net2)$Sex=as.character(Atributos2$Genero[match(V(net2)$name,Atributos2$Ind)]) 
#Crea el atributo genero haciendo match en las dos bases por el Ind
V(net2)$Sex # Este imprime el atributo
V(net2)$color=V(net2)$Sex #Asigna el atributo genero al color de los vertices
V(net2)$color=gsub("0","purple",V(net2)$color) #Mujeres seran moradas
V(net2)$color=gsub("1","lightgreen",V(net2)$color) #Hombres seran verdes
plot.igraph(net2,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)
title(main = "Red de actividades deportivas (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("Mujeres","Hombres")
             , title="Genero", pt.bg = c("purple",  "lightgreen")
             , pch = 21)


V(net2)$estrato=as.character(Atributos2$Estrato[match(V(net2)$name,Atributos2$Ind)]) 
V(net2)$estrato 
V(net2)$color=V(net2)$estrato 
V(net2)$color=gsub("1","darkblue",V(net2)$color) 
V(net2)$color=gsub("2","darkblue",V(net2)$color) 
V(net2)$color=gsub("3","blue1",V(net2)$color) 
V(net2)$color=gsub("4","blue1",V(net2)$color) 
V(net2)$color=gsub("5","lightblue",V(net2)$color) 
V(net2)$color=gsub("6","lightblue",V(net2)$color) 
plot.igraph(net2,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)
title(main = "Red de actividades sociales (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("1 y 2","3 y 4","5 y 6")
             , title="Estratos Socioeconómicos", pt.bg = c("darkblue", "blue1", "lightblue")
             , pch = c(21,21,21))

V(net2)$pilo=as.character(Atributos2$pilopaga[match(V(net2)$name,Atributos2$Ind)]) 
V(net2)$color=V(net2)$pilo 
V(net2)$color=gsub("0","red",V(net2)$color) 
V(net2)$color=gsub("1","darkred",V(net2)$color) 
plot.igraph(net2,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)
title(main = "Red de actividades sociales (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("Si","No")
             , title="Beneficiario ser pilo paga", pt.bg = c("darkred",  "red")
             , pch = 21)

V(net2)$programa=as.character(Atributos2$programa[match(V(net2)$name,Atributos2$Ind)]) 
V(net2)$color=V(net2)$programa 
V(net2)$color=gsub("0","green",V(net2)$color) #Programa de Finanzas
V(net2)$color=gsub("1","blue",V(net2)$color) #Programa de economia
plot.igraph(net2,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)

title(main = "Red de actividades sociales (min 1 x semana)")
l <- legend( "bottomright", inset = .02, cex = 1, bty = "n", legend = c("Finanzas y Comercio Internacional","Economía")
             , title="Programa Academico", pt.bg = c("green",  "blue")
             , pch = 21)



#Descripcion de las otras redes

network_4 <- as.matrix(base_4)
g_4 <- graph.adjacency(network_4)
(b_4 <- betweenness(g_4, directed = FALSE))
(c_4 <- closeness(g_4, mode = "out"))
(d_4 <- degree(g_4, mode = "out"))
red_4 <-as.network.matrix(network_4)
plot.network(red_4) 
title(main = "Red de consejos personales")

network_5 <- as.matrix(base_5)
g_5 <- graph.adjacency(network_5)
(b_5 <- betweenness(g_5, directed = FALSE))
(c_5 <- closeness(g_5, mode = "out"))
(d_5 <- degree(g_5, mode = "out"))
red_5 <-as.network.matrix(network_5)
plot.network(red_5) 
title(main = "Conocidos antes de entrar a la UR")

network_6 <- as.matrix(base_6)
g_6 <- graph.adjacency(network_6)
(b_6 <- betweenness(g_6, directed = FALSE))
(c_6 <- closeness(g_6, mode = "out"))
(d_6 <- degree(g_6, mode = "out"))
red_6 <-as.network.matrix(network_6)
plot.network(red_6) 
title(main = "Red de los considerados lideres")


