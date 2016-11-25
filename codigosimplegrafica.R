m3=as.matrix(base_3)
net3=graph.adjacency(m3,mode="undirected",weighted=NULL,diag=FALSE)


#Importar los atributos de los individuos

##Crea la red sin distinguir los atributos
V(net3)$Sex=as.character(Atributos2$Genero[match(V(net3)$name,Atributos2$Ind)]) 
#Crea el atributo genero haciendo match en las dos bases por el Ind
V(net3)$Sex # Este imprime el atributo
V(net3)$color=V(net3)$Sex #Asigna el atributo genero al color de los vertices
V(net3)$color=gsub("0","red",V(net3)$color) #Mujeres seran moradas
V(net3)$color=gsub("1","red",V(net3)$color) #Hombres seran verdes
plot.igraph(net3,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)
title(main = "Red de compañeros cercanos")


m4=as.matrix(base_6)
net4=graph.adjacency(m4,mode="undirected",weighted=NULL,diag=FALSE)
##Crea la red sin distinguir los atributos
V(net4)$Sex=as.character(Atributos2$Genero[match(V(net4)$name,Atributos2$Ind)]) 
#Crea el atributo genero haciendo match en las dos bases por el Ind
V(net4)$Sex # Este imprime el atributo
V(net4)$color=V(net4)$Sex #Asigna el atributo genero al color de los vertices
V(net4)$color=gsub("0","red",V(net4)$color) #Mujeres seran moradas
V(net4)$color=gsub("1","red",V(net4)$color) #Hombres seran verdes
plot.igraph(net4,vertex.label=NA,layout=layout.fruchterman.reingold, vertex.size=3)
title(main = "Estudiantes considerados lideres")