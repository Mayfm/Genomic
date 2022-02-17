library(igraph)
library(igraphdata)

data("karate")
karate

# 1. Personas mas conectadas

a_3 <- sort(degree(karate), decreasing = T)[1:3]
a_3


# 2. Grafica de distribucion de conectividades ----

par(bg = "black") #cambiar el fondo

# Distribucion de conectividades
plot(degree.distribution(karate), col = "#79B4B7", family = "mono", # degree.distribution, calcula la distribucion del degree
     col.main = "#F6E6E4", # color del titulo
     col.lab = "#F3F1F5", # color de las etiquetas
     fg = "#F1F7E7", col.axis = "#F1F7E7", main = "Distribución conectividades" ) # color de los ejes, y cuadro de la grafica

# 3. Diametro ----

diameter(karate)

# 4. Coeficiente de clusterizacion 3 personas mas conectadas ----

a <- names(sort(degree(karate), decreasing = T)[1:3])
a

aa <- names(karate[1])

positions <- which(aa %in% a) # extraemos las posiciones
positions

coff <- transitivity(karate, type="local")[c(positions)]
coff

# Agregarle los nombres
names(coff) <- a
coff


# 5. Nodos con coeficiente de clusterizacion 1 ----

coff_1 <- transitivity(karate, type="local")
names(coff_1) <- aa

# Comprobar los que tienen coeficiente de 1
names(which(coff_1 == 1)) 


# 6. Porcentaje de conexiones respecto al total ----

# Obtener el total de conexiones que se pueden formar

total_nodos <- (gorder (karate) * (gorder (karate) - 1)) / 2
total_nodos

# Total de conexiones de todo

total_degree <- sum(degree(karate))
total_degree

# Sacar el porcentaje

(total_degree/total_nodos)*100

# 7. Promedio de conectividades ----

mean (degree (karate))  # promedio de las conectividades

# 8. Personas mas importantes ----

sort(degree(karate), decreasing = T) [1:3] # Degree, con mas conexiones. En orden decresciente para que tome los primeros 10 con mas conexiones

sort(eccentricity(karate), decreasing = F) [1:3] # Excentricidad.En orden ascendiente, ya que si tiene un menor valor, estara mas cerca del centro

sort(betweenness(karate), decreasing = T) [1:3] # Betweenness. En orden decresciente, los que tienen caminos mas cortos


# 9. Trayectoria entre personas mas alejadas ----

trayectoria <- shortest.paths(karate) 
tabla_trayectoria <- table(trayectoria) # te da en formato de tabla los valores de la trayectoria
max(tabla_trayectoria) # la trayectoria mas larga


# 10. Clusteriza con 4 metodos distintos ----

par(bg = "black") #cambiar el fondo


uno <- cluster_walktrap(karate)
table(membership(uno)) # total de personas en cada cluster

# Plot del cluster
plot(uno, karate, edge.color = "white", vertex.label.color = "#F1F7E7", vertex.label.font = 15,vertex.label.cex = 0.7, edge.arrow.size = 0.15)
# Para mi este es el que se ajusta mas a la realidad, jajajaja

dos <- cluster_optimal(karate)
table(membership(dos)) # total de personas en cada cluster

# Plot del cluster
plot(dos, karate, edge.color = "white", vertex.label.color = "#F1F7E7", vertex.label.font = 15,vertex.label.cex = 0.7, edge.arrow.size = 0.15)

tres <- cluster_fast_greedy(karate)
table(membership(tres)) # total de personas en cada cluster

# Plot del cluster
plot(tres, karate, edge.color = "white", vertex.label.color = "#F1F7E7", vertex.label.font = 15,vertex.label.cex = 0.7, edge.arrow.size = 0.15)

cuatro <- cluster_fast_greedy(karate)
table(membership(cuatro)) # total de personas en cada cluster

# Plot del cluster
plot(cuatro, karate, edge.color = "white", vertex.label.color = "#F1F7E7", vertex.label.font = 15,vertex.label.cex = 0.7, edge.arrow.size = 0.15)

# Discusion: Con casi todos se forman 2 de los metodos se forman 3 clusters y con 2; 4, aunque en uno es muy pequeño el cluster.
# En todos se puede ver un grupo pequeño, donde esta 11, 6, 7, 5, 17
# Y los clusters rojos y verdes, como estan muy marcados en los diferentes clusters, creo que son los grupos en los que se dividieron
