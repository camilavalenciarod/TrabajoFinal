install.packages("igraph")
library(igraph)
install.packages("network")
library(network)

base_1 <- read.csv("C:/Users/camila.valencia/Desktop/Efectos Pares/red1.csv", sep=";")
base_2 <- read.csv("C:/Users/camila.valencia/Desktop/Efectos Pares/red2.csv", sep=";")
base_3 <- read.csv("C:/Users/camila.valencia/Desktop/Efectos Pares/red3.csv", sep=";")
base_4 <- read.csv("C:/Users/camila.valencia/Desktop/Efectos Pares/red4.csv", sep=";")
base_5 <- read.csv("C:/Users/camila.valencia/Desktop/Efectos Pares/red5.csv", sep=";")
base_6 <- read.csv("C:/Users/camila.valencia/Desktop/Efectos Pares/red6.csv", sep=";")

network_1 <- as.matrix(base_1)
g_1 <- graph.adjacency(network_1)
(b_1 <- betweenness(g_1, directed = FALSE))
(c_1 <- closeness(g_1, mode = "out"))
(d_1 <- degree(g_1, mode = "out"))
red_1 <-as.network.matrix(network_1)
plot.network(red_1)
title(main = "Red de estudio fuera de clase (min 1 x semana)")



network_2 <- as.matrix(base_2)
g_2 <- graph.adjacency(network_2)
(b_2 <- betweenness(g_2, directed = FALSE))
(c_2 <- closeness(g_2, mode = "out"))
(d_2 <- degree(g_2, mode = "out"))
red_2 <-as.network.matrix(network_2)
plot.network(red_2) 
title(main = "Red de planes sociales (min 1 x semana)")


network_3 <- as.matrix(base_3)
g_3 <- graph.adjacency(network_3)
(b_3 <- betweenness(g_3, directed = FALSE))
(c_3 <- closeness(g_3, mode = "out"))
(d_3 <- degree(g_3, mode = "out"))
red_3 <-as.network.matrix(network_3)
plot.network(red_3)
title(main = "Red de actividades deportivas")


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








