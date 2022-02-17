# Examen practico

micro <- read.csv(paste0("Red_amigos_micro.csv"), header=T, as.is=T)
View(micro)


# Quitamos datos con NA y datos que no nos sirven
micro <- micro[,-1]
micro <- micro[-2,]
micro <- micro[,-2]

# Convertir a matriz
micro <- as.matrix(micro)
class(micro)

library(igraph)

# Matriz de adyacencia
micro_red <- graph_from_adjacency_matrix(micro, mode = "directed")
micro_red
# 20 nodos y 162 conexiones


# 1. Graficar la red ----

# Red

par(bg= "black") #cambiar el fondo

V(micro_red)$size <- degree(micro_red, mode = "in")*3
V(micro_red)$color = "#96F7D2"
V(micro_red)$shape = "sphere"
E(micro_red)$color = "white"
plot(micro_red, edge.arrow.size = 0.15, edge.curved = 0.3, vertex.label.font = 15,
     vertex.label.color = "#F1F7E7", vertex.label.cex = 0.7)

# 2. Tres Personas con mas amigos

a_3 <- sort(degree(micro_red, mode = "in"), decreasing = T)[1:3]
a_3

# 3. Tres personas que consideran con mas amigos

ao_3 <- sort(degree(micro_red, mode = "out"), decreasing = T)[1:3]
ao_3

# 4. Tres personas mas importantes con centralidad ----

# De entrada

sort(degree(micro_red, mode = "in"), decreasing = T) [1:3] # Degree, con mas conexiones. En orden decresciente para que tome los primeros 10 con mas conexiones

sort(eccentricity(micro_red, mode = "in"), decreasing = F) [1:3] # Excentricidad.En orden ascendiente, ya que si tiene un menor valor, estara mas cerca del centro

# De salida

sort(degree(micro_red, mode = "out"), decreasing = T) [1:3] # Degree, con mas conexiones. En orden decresciente para que tome los primeros 10 con mas conexiones

sort(eccentricity(micro_red, mode = "out"), decreasing = F) [1:3] # Excentricidad.En orden descendiente.


# Con ambos de entrada y salida 

sort(betweenness(micro_red), decreasing = T) [1:3] # Betweenness. En orden decresciente, los que tienen caminos mas cortos

# 5. Clusterizar por dos metodos ----

uno <- cluster_walktrap(micro_red)
table(membership(uno)) # total de personas en cada cluster
membership(uno) # Indica a que cluster pertenece cada quien

# Plot del cluster
plot(uno, micro_red, edge.color = "white", vertex.label.color = "#F1F7E7", vertex.label.font = 15,vertex.label.cex = 0.7, edge.arrow.size = 0.15)
# Para mi este es el que se ajusta mas a la realidad, jajajaja

dos <- cluster_optimal(micro_red)
table(membership(dos)) # total de personas en cada cluster
membership(dos) # Indica a que cluster pertenece cada quien

# Plot del cluster
plot(dos, micro_red, edge.color = "white", vertex.label.color = "#F1F7E7", vertex.label.font = 15,vertex.label.cex = 0.7, edge.arrow.size = 0.15)

# 6. Calcule el diametro ---

diameter(micro_red) # calcular el diametro

# 7. Matriz de distancias y heatmap ----

m <- as.matrix(distances(micro_red)) # matriz de distancias
class(m)
m # matriz

par(bg= "#F9F3DF") #cambiar el fondo

heatmap(m) # Obtener el heatmap


