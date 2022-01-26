# TAREA 1
# Mayela Fosado

# Librerias para cargar

library(Biostrings)
library(parallel)
library(BiocGenerics)
library(S4Vectors)
library(stats4)
library(IRanges)
library(XVector)

# TOTAL DE NUCLEOTIDOS DNA ----

# Con Biostrings
secuencias <- readRNAStringSet("first.fasta") #cargar el archivo con la(s) secuencia(s)
secuencias

secuencias <- as.character(secuencias) #Para poder cambiar la letra es necesario pasarlo a caracter
secuencias <- chartr("U", "T", secuencias) #Cambia U por T
secuencias <- DNAStringSet(secuencias) #Para que este de nuevo en el formato de Biostrings
secuencias

alphabetFrequency(secuencias) #con la funcion nos da el total de nucleotidos en las secuencias

#Con R base

Nucleotidos <- function () {
  respuesta <- 1
  while(respuesta == 1){ # un while aqui para no volver a correr todo, si quieres intentar con otra secuencia
    Sequences <- readBStringSet("first.fasta") #cambiar el nombre del archivo de comillas, por el que se quiera utilizar
    Sequences
    #Cargar las secuencias con readBStringSet, para que pueda ser de DNA o RNA
    
    Sequences <- as.character(Sequences) #Convertir a caracter
    Sequences <- chartr("U", "T", Sequences) #Este si son RNA para convertirlos a DNA, si ya es DNA no hara cambios
    Sequences
    
    print(length(Sequences)) #total de secuencias para elegir una
    
    Sequence <- readline(prompt = "Elige el número de secuencia que quieres usar: ")
    Sequence <- as.numeric(Sequence) #asi puedes elegir la secuencia que tu quieras
    
    Sequence <- Sequences[Sequence] # se esta asignando el numero elegido a la secuencia que se contara sus nucleotidos
    
    #Crear objetos con cada nucleotido de DNA
    A <- 0
    C <- 0 
    G <- 0 
    T <- 0 
    
    Sequence_Length <- nchar (Sequence) # Obtener la longitud de la secuencia
    Sequence_Length 
    
    Seq <- strsplit (Sequence, split = NULL) # Dividir cada letra de la secuencia
    Seq
    
    #Utilizar el ciclo for para que cuente los nucleotidos
    
    for (i in 1 : Sequence_Length) { # for con el  tamaño de la secuencia 
      if (Seq [[1]][i] == "A" ) {A <- A + 1 # Si es una adenina sumara 1 a A
      }else if (Seq [[1]][i] == "C" ) {C <- C + 1 # Si es una citocina sumara 1 a C
      }else if (Seq [[1]][i] == "G" ) {G <- G + 1 # Si es una guanina sumara 1 a G
      }else if (Seq [[1]][i] == "T" ) {T <- T + 1 # Si es una timina sumara 1 a T
    }
  }
    print (paste ("A =", A, ", C =", C, ", G =", G, ", T =", T, "Total de nucleótidos=", A+T+G+C)) # Arroja los resultados
    respuesta <- readline(prompt = "¿Quieres probar con otra secuencia (Sí=1, No=0)  ") # Anotar la respuesta de si se quiere continuar con otra secuencia
    respuesta <- as.numeric(respuesta)
  }
}


Nucleotidos()

# Una disculpa, no supe como hacerle para todos y no estar poniendo numero por numero :c


# CADENA COMPLEMENTARIA DE DNA ----

# Con Biostrings

secuencias <- readRNAStringSet("first.fasta") #cargar el archivo con la(s) secuencia(s)
secuencias

secuencias <- as.character(secuencias) #Para poder cambiar la letra es necesario pasarlo a caracter
secuencias <- chartr("U", "T", secuencias) #Cambia U por T
secuencias <- DNAStringSet(secuencias) #Para que este de nuevo en el formato de Biostrings
secuencias

complement(secuencias) #funcion complement, para obtener la secuencia complementaria

# Con R base

Secuencia_complemento <- function (Secuencia) {
  respuesta <- 1
  
  while(respuesta == 1){
    respuesta <- readline(prompt = "Ingresa una secuencia de 10 nucleótidos de DNA: ")
    uno <- 0
    dos <- 0
    tres <- 0
    cuatro <- 0
    cinco <- 0
    seis <- 0
    siete <- 0
    ocho <- 0
    nueve <- 0
    diez <- 0
    
    if(substr(respuesta, start = 1, stop = 1) == "A"){uno <- "T"
    }else if(substr(respuesta, start = 1, stop = 1) == "T"){uno <- "A"
    }else if(substr(respuesta, start = 1, stop = 1) == "G"){uno <- "C"
    }else if(substr(respuesta, start = 1, stop = 1) == "C"){uno <- "G"}
    
    if(substr(respuesta, start = 2, stop = 2) == "A"){dos <- "T"
    }else if(substr(respuesta, start = 2, stop = 2) == "T"){dos <- "A"
    }else if(substr(respuesta, start = 2, stop = 2) == "G"){dos <- "C"
    }else if(substr(respuesta, start = 2, stop = 2) == "C"){dos <- "G"} 
    
    if(substr(respuesta, start = 3, stop = 3) == "A"){tres <- "T"
    }else if(substr(respuesta, start = 3, stop = 3) == "T"){tres <- "A"
    }else if(substr(respuesta, start = 3, stop = 3) == "G"){tres <- "C"
    }else if(substr(respuesta, start = 3, stop = 3) == "C"){tres <- "G"}
    
    if(substr(respuesta, start = 4, stop = 4) == "A"){cuatro <- "T"
    }else if(substr(respuesta, start = 4, stop = 4) == "T"){cuatro <- "A"
    }else if(substr(respuesta, start = 4, stop = 4) == "G"){cuatro <- "C"
    }else if(substr(respuesta, start = 4, stop = 4) == "C"){cuatro <- "G"}
    
    if(substr(respuesta, start = 5, stop = 5) == "A"){cinco <- "T"
    }else if(substr(respuesta, start = 5, stop = 5) == "T"){cinco <- "A"
    }else if(substr(respuesta, start = 5, stop = 5) == "G"){cinco <- "C"
    }else if(substr(respuesta, start = 5, stop = 5) == "C"){cinco <- "G"}
    
    if(substr(respuesta, start = 6, stop = 6) == "A"){seis <- "T"
    }else if(substr(respuesta, start = 6, stop = 6) == "T"){seis <- "A"
    }else if(substr(respuesta, start = 6, stop = 6) == "G"){seis <- "C"
    }else if(substr(respuesta, start = 6, stop = 6) == "C"){seis <- "G"}
    
    if(substr(respuesta, start = 7, stop = 7) == "A"){siete <- "T"
    }else if(substr(respuesta, start = 7, stop = 7) == "T"){siete <- "A"
    }else if(substr(respuesta, start = 7, stop = 7) == "G"){siete <- "C"
    }else if(substr(respuesta, start = 7, stop = 7) == "C"){siete <- "G"} 
    
    if(substr(respuesta, start = 8, stop = 8) == "A"){ocho <- "T"
    }else if(substr(respuesta, start = 8, stop = 8) == "T"){ocho <- "A"
    }else if(substr(respuesta, start = 8, stop = 8) == "G"){ocho <- "C"
    }else if(substr(respuesta, start = 8, stop = 8) == "C"){ocho <- "G"}
    
    if(substr(respuesta, start = 9, stop = 9) == "A"){nueve <- "T"
    }else if(substr(respuesta, start = 9, stop = 9) == "T"){nueve <- "A"
    }else if(substr(respuesta, start = 9, stop = 9) == "G"){nueve <- "C"
    }else if(substr(respuesta, start = 9, stop = 9) == "C"){nueve <- "G"} 
    
    if(substr(respuesta, start = 10, stop = 10) == "A"){diez <- "T"
    }else if(substr(respuesta, start = 10, stop = 10) == "T"){diez <- "A"
    }else if(substr(respuesta, start = 10, stop = 10) == "G"){diez <- "C"
    }else if(substr(respuesta, start = 10, stop = 10) == "C"){diez <- "G"} 
    
    print(paste("Secuencia complementaria:", paste0(uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve, diez)))
    respuesta <- readline(prompt = "¿Quieres probar con otra secuencia (Sí=1, No=0)  ")
    respuesta <- as.numeric(respuesta)
  }
}

Secuencia_complemento()


# TOTAL DE C Y G ----

# Con Biostrings
Sequences <- readBStringSet("first.fasta") #cambiar el nombre del archivo de comillas, por el que se quiera utilizar
Sequences
GC <- (letterFrequency (Sequences, letters = "GC", as.prob = TRUE))*100 #este arroja la frecuencia de las letras,
#en este caso pedimos que arroje las de GC y las multiplique por 100, para tener el porcentaje
GC

# Con R base

GC_porcentaje <- function( ) {
  respuesta <- 1
  while(respuesta == 1){ # un while aqui para no volver a correr todo, si quieres intentar con otra secuencia

Sequences <- readBStringSet("first.fasta") #cambiar el nombre del archivo de comillas, por el que se quiera utilizar
Sequences
#Cargar las secuencias con readBStringSet, para que pueda ser de DNA o RNA

Sequences <- as.character(Sequences) #Convertir a caracter

print(length(Sequences)) #total de secuencias para elegir una

Sequence <- readline(prompt = "Elige el numero de secuencia que quieres usar: ")
Sequence <- as.numeric(Sequence) #asi puedes elegir la secuencia que tu quieras

Sequence <- Sequences[Sequence] # se esta asignando el numero elegido a la secuencia que se contara sus nucleotidos

Sequence <- strsplit (Sequence, split = NULL) # Para separar los caracteres

Sequence <- unlist(Sequence) # quita el formato de lista

Results <- table(Sequence) # te arroja la cantidad de que hay de cada nucleotido (util para el primer ejercicio)
Results

citosina <- Results[2] / length(Sequence) *100 #Calcula el porcentaje de citosina

guanina <- Results[3] / length(Sequence) *100 # Calcula el porcentaje de guanina

print(paste("Total GC% :", sum(citosina, guanina))) #Resultados

respuesta <- readline(prompt = "¿Quieres probar con otra secuencia (Sí=1, No=0)  ") # Anotar la respuesta de si se quiere continuar con otra secuencia
respuesta <- as.numeric(respuesta)
  }
}

GC_porcentaje()

# MASA PROTEINA ----

#Con R base
Masa_proteina <- function(){
  
Sequences <- readRNAStringSet("first.fasta") #cambiar el nombre del archivo de comillas, por el que se quiera utilizar
Sequences
Aminoacids <- translate(Sequences) #traducir de RNA a proteina

Aminoacids <- as.character(Aminoacids) #convertir a caracter
Aminoacids

print(length(Aminoacids)) #total de secuencias para elegir una

Aminoacid <- readline(prompt = "Elige el numero de secuencia que quieres usar: ")
Aminoacid <- as.numeric(Aminoacid) #asi puedes elegir la secuencia que tu quieras

Aminoacid1 <- Aminoacids[Aminoacid] # se esta asignando el numero elegido a la secuencia que se contara sus nucleotidos

Aminoacid_Length <- nchar (Aminoacid1) # Obtener la longitud de la secuencia
Aminoacid_Length 

aa <- strsplit (Aminoacid1, split = NULL) # Dividir cada letra de la secuencia
aa

#Crear objeto para que guarde la masa
masa_proteina <- 0

#Utilizar el ciclo for para que cuente los aminoacidos y sacar su masa

for (i in 1:Aminoacid_Length) { # for con el  tamaño de la secuencia 
  if (aa [[1]][i] == "G" ) {masa_proteina <- masa_proteina + 57.02 # Si es glicina suma 57.02
  }else if (aa [[1]][i] == "A" ) {masa_proteina <- masa_proteina + 71.04 # Si es alanina suma 71.04
  }else if (aa [[1]][i] == "S" ) {masa_proteina <- masa_proteina + 87.03 # Si es serina suma 87.03
  }else if (aa [[1]][i] == "P" ) {masa_proteina <- masa_proteina + 97.05 # Si es prolina suma 97.05
  }else if (aa [[1]][i] == "V" ) {masa_proteina <- masa_proteina + 99.07 # Si es valina suma 99.07
  }else if (aa [[1]][i] == "T" ) {masa_proteina <- masa_proteina + 101.05 # Si es treonina suma 101.05
  }else if (aa [[1]][i] == "C" ) {masa_proteina <- masa_proteina + 103.01 # Si es cisteina suma 103.01
  }else if (aa [[1]][i] == "I" ) {masa_proteina <- masa_proteina + 103.08 # Si es isoleucina suma 103.08
  }else if (aa [[1]][i] == "L" ) {masa_proteina <- masa_proteina + 103.08 # Si es leuncina suma 103.08
  }else if (aa [[1]][i] == "N" ) {masa_proteina <- masa_proteina + 114.04 # Si es asparagina suma 114.04
  }else if (aa [[1]][i] == "D" ) {masa_proteina <- masa_proteina + 115.03 # Si es aspartato suma 115.03
  }else if (aa [[1]][i] == "Q" ) {masa_proteina <- masa_proteina + 128.06 # Si es glutamina suma 128.06
  }else if (aa [[1]][i] == "K" ) {masa_proteina <- masa_proteina + 128.09 # Si es lisina suma 128.09
  }else if (aa [[1]][i] == "E" ) {masa_proteina <- masa_proteina + 129.04 # Si es glutamato suma 129.04
  }else if (aa [[1]][i] == "M" ) {masa_proteina <- masa_proteina + 131.04 # Si es metionina suma 131.04
  }else if (aa [[1]][i] == "H" ) {masa_proteina <- masa_proteina + 137.06 # Si es histidina suma 137.06
  }else if (aa [[1]][i] == "F" ) {masa_proteina <- masa_proteina + 147.07 # Si es fenilalanina suma 147.07
  }else if (aa [[1]][i] == "R" ) {masa_proteina <- masa_proteina + 156.10 # Si es arginina suma 156.10
  }else if (aa [[1]][i] == "Y" ) {masa_proteina <- masa_proteina + 163.06 # Si es tirosina suma 163.06
  }else if (aa [[1]][i] == "W" ) {masa_proteina <- masa_proteina + 186.06 # Si es triptofano suma 186.06
  }
return(print( paste("Masa Proteína: ", masa_proteina)))
  #
 }

}

Masa_proteina()

#AAAAAAH, no sé porqué da solo lo del primerooo

#G + A + S + P + V + T + C + I + L + N + D + Q + K + E + M + F + R + Y + W

#G, A, S, P, V, T, C, I, L, N, D, Q, K, E, M, F, R, Y, W




   #Estos fueron intentos fallidos tratando de probar con todas las secuencias juntas u otro metodo para la cadena complementaria y la masa de proteinas
  
# INTENTOS FALLIDOS ----

Sequences <- readRNAStringSet("first.fasta")
Sequences
readBStringSet("first.fasta")


Sequences <- as.character(Sequences)
Sequences <- chartr("U", "T", Sequences)
Sequences
length(Sequences)

sequences <- NULL
for (i in length(Sequences)) {
  
  sequences[[i]] <- Sequences[[i]]
  print(paste(sequences[[i]]))
}







Complementaria <- function () {
  respuesta <- 1
  while(respuesta == 1){ # un while aqui para no volver a correr todo, si quieres intentar con otra secuencia
    Sequences <- readBStringSet("first.fasta") #cambiar el nombre del archivo de comillas, por el que se quiera utilizar
    Sequences
    #Cargar las secuencias con readBStringSet, para que pueda ser de DNA o RNA
    
    Sequences <- as.character(Sequences) #Convertir a caracter
    Sequences <- chartr("U", "T", Sequences) #Este si son RNA para convertirlos a DNA, si ya es DNA no hara cambios
    Sequences
    
    print( length(Sequences)) #total de secuencias para elegir una
    
    Sequence <- readline(prompt = "Elige el numero de secuencia que quieres usar: ")
    Sequence <- as.numeric(Sequence) #asi puedes elegir la secuencia que tu quieras
    
    Sequence <- Sequences[Sequence] # se esta asignando el numero elegido a la secuencia que se contara sus nucleotidos
    
    Sequence_Length <- nchar (Sequence) # Obtener la longitud de la secuencia
    Sequence_Length 
    
    Seq <- strsplit (Sequences, split = NULL) # Split the sequence into individual factors
    Seq
    
    A <- 0
    T <- 0
    G <- 0
    C <- 0
    
    #Utilizar el ciclo for para que cuente los nucleotidos
    
    for (i in 1 : Sequence_Length) { # for con el  tamaño de la secuencia 
      if (Seq [[1]][i] == "A" ) {A <- "T" # Si es una adenina sumara 1 a A
      }
      else if (Seq [[1]][i] == "C" ) {C <- "G" # Si es una citocina sumara 1 a C
      }
      else if (Seq [[1]][i] == "G" ) {G <- "C"  # Si es una guanina sumara 1 a G
      }
      else if (Seq [[1]][i] == "T" ) {T <- "A"  # Si es una timina sumara 1 a T
      }
    }
    print (paste ("Secuencia complementaria:", A,T,G,C)) # Arroja los resultados
    respuesta <- readline(prompt = "¿Quieres probar con otra secuencia (Sí=1, No=0)  ") # Anotar la respuesta de si se quiere continuar con otra secuencia
    respuesta <- as.numeric(respuesta)
  }
}


Complementaria()



masa_uno <- function (Masa) {
  respuesta <- 1
  
  while(respuesta == 1){
    respuesta <- readline(prompt = "Ingresa una secuencia de 3 aminoácidos: ")
    as.numeric(respuesta) -> respuesta
    uno <- 0
    dos <- 0
    tres <- 0

if(substr(respuesta, start = 1, stop = 1) == "G"){G <- G + 57.02
}else if(substr(respuesta, start = 1, stop = 1) == "A"){uno <- uno + 71.04
}else if(substr(respuesta, start = 1, stop = 1) == "S"){uno <- uno + 87.03
}else if(substr(respuesta, start = 1, stop = 1) == "P"){uno <- uno + 97.05
}else if(substr(respuesta, start = 1, stop = 1) == "V"){uno <- uno + 99.07
}else if(substr(respuesta, start = 1, stop = 1) == "T"){uno <- T + 101.05
}else if(substr(respuesta, start = 1, stop = 1) == "C"){uno <- C + 103.01
}else if(substr(respuesta, start = 1, stop = 1) == "I"){uno <- I + 103.08
}else if(substr(respuesta, start = 1, stop = 1) == "L"){uno <- L + 103.08
}else if(substr(respuesta, start = 1, stop = 1) == "I"){uno <- I + 103.08
}else if(substr(respuesta, start = 1, stop = 1) == "I"){uno <- I + 103.08
}else if(substr(respuesta, start = 1, stop = 1) == "I"){uno <- I + 103.08
}else if(substr(respuesta, start = 1, stop = 1) == "I"){uno <- I + 103.08
}else if(substr(respuesta, start = 1, stop = 1) == "I"){uno <- I + 103.08
}else if(substr(respuesta, start = 1, stop = 1) == "I"){uno <- I + 103.08
}else if(substr(respuesta, start = 1, stop = 1) == "I"){uno <- I + 103.08
}else if(substr(respuesta, start = 1, stop = 1) == "I"){uno <- I + 103.08
}else if(substr(respuesta, start = 1, stop = 1) == "I"){uno <- I + 103.08
}else if(substr(respuesta, start = 1, stop = 1) == "I"){uno <- I + 103.08
}else if(substr(respuesta, start = 1, stop = 1) == "S"){uno <- S + 87.03
}else if(substr(respuesta, start = 1, stop = 1) == "S"){uno <- S + 87.03
} else if(substr(respuesta, start = 1, stop = 1) == "C"){uno <- "G"
}else(print("nada")) 

if(substr(respuesta, start = 2, stop = 2) == "G"){dos <- G + 57.02
}else if(substr(respuesta, start = 2, stop = 2) == "A"){dos <- A + 71.04
}else if(substr(respuesta, start = 2, stop = 2) == "S"){dos <- S + 87.03
}else if(substr(respuesta, start = 2, stop = 2) == "P"){dos <- P + 97.05
}else if(substr(respuesta, start = 2, stop = 2) == "V"){dos <- V + 99.07
}else if(substr(respuesta, start = 2, stop = 2) == "T"){dos <- T + 101.05
}else if(substr(respuesta, start = 2, stop = 2) == "C"){dos <- C + 103.01
}else if(substr(respuesta, start = 2, stop = 2) == "I"){dos <- I + 103.08
}else if(substr(respuesta, start = 2, stop = 2) == "L"){dos <- L + 103.08
}else if(substr(respuesta, start = 2, stop = 2) == "S"){dos <- S + 87.03
}else if(substr(respuesta, start = 2, stop = 2) == "S"){dos <- S + 87.03
}else if(substr(respuesta, start = 2, stop = 2) == "S"){dos <- S + 87.03
}else if(substr(respuesta, start = 2, stop = 2) == "S"){dos <- S + 87.03
}else if(substr(respuesta, start = 2, stop = 2) == "S"){dos <- S + 87.03
}else if(substr(respuesta, start = 2, stop = 2) == "S"){dos <- S + 87.03
}else if(substr(respuesta, start = 2, stop = 2) == "S"){dos <- S + 87.03
}else if(substr(respuesta, start = 2, stop = 2) == "S"){dos <- S + 87.03
}else if(substr(respuesta, start = 2, stop = 2) == "S"){dos <- S + 87.03
}else if(substr(respuesta, start = 2, stop = 2) == "S"){dos <- S + 87.03
}else if(substr(respuesta, start = 2, stop = 2) == "C"){dos <- "G"
}else(print("nada"))  

if(substr(respuesta, start = 3, stop = 3) == "G"){tres <- G + 57.02
}else if(substr(respuesta, start = 3, stop = 3) == "A"){tres <- A + 71.04
}else if(substr(respuesta, start = 3, stop = 3) == "P"){tres <- P + 97.05
}else if(substr(respuesta, start = 3, stop = 3) == "V"){tres <- V + 99.07
}else if(substr(respuesta, start = 3, stop = 3) == "T"){tres <- T + 101.05
}else if(substr(respuesta, start = 3, stop = 3) == "C"){tres <- C + 103.01
}else if(substr(respuesta, start = 3, stop = 3) == "I"){tres <- I + 103.08
}else if(substr(respuesta, start = 3, stop = 3) == "L"){tres <- L + 103.08
}else if(substr(respuesta, start = 3, stop = 3) == "I"){tres <- I + 103.08
}else if(substr(respuesta, start = 3, stop = 3) == "I"){tres <- I + 103.08
}else if(substr(respuesta, start = 3, stop = 3) == "I"){tres <- I + 103.08
}else if(substr(respuesta, start = 3, stop = 3) == "I"){tres <- I + 103.08
}else if(substr(respuesta, start = 3, stop = 3) == "I"){tres <- I + 103.08
}else if(substr(respuesta, start = 3, stop = 3) == "C"){tres <- "G"
}else(print("nada")) 

print(paste("Secuencia complementaria:", paste0(uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve, diez)))
respuesta <- readline(prompt = "¿Quieres probar con otra secuencia (Sí=1, No=0)  ")
respuesta <- as.numeric(respuesta)
  }
}


masa_uno <- function (Masa) {
  
Sequences <- readRNAStringSet("first.fasta") #cambiar el nombre del archivo de comillas, por el que se quiera utilizar
Sequences
Aminoacids <- translate(Sequences) #traducir de RNA a proteina

Aminoacids <- as.character(Aminoacids) #convertir a caracter
Aminoacids

print(length(Aminoacids)) #total de secuencias para elegir una

Aminoacid <- readline(prompt = "Elige el numero de secuencia que quieres usar: ")
Aminoacid <- as.numeric(Aminoacid) #asi puedes elegir la secuencia que tu quieras

Aminoacid1 <- Aminoacids[Aminoacid] # se esta asignando el numero elegido a la secuencia que se contara sus nucleotidos

Aminoacid_Length <- nchar (Aminoacid1) # Obtener la longitud de la secuencia
Aminoacid_Length 

aa <- strsplit (Aminoacid1, split = NULL) # Dividir cada letra de la secuencia
aa

#Crear objeto para que guarde la masa
masa_proteina <- 0


#Utilizar el ciclo for para que cuente los aminoacidos y sacar su masa

for (i in 1 : Aminoacid_Length) { # for con el  tamaño de la secuencia 
  
  if (substr(aa, start = 1, stop = 1) == "G" ) {masa_proteina <- masa_proteina + 57.02 # Si es glicina suma 57.02
  }else if (substr(aa, start = 1, stop = 1) == "A" ) {masa_proteina <- masa_proteina + 71.04 # Si es alanina suma 71.04
  }else if (substr(aa, start = 1, stop = 1) == "S" ) {masa_proteina <- masa_proteina + 87.03 # Si es serina suma 87.03
  }else if (substr(aa, start = 1, stop = 1) == "P" ) {masa_proteina <- masa_proteina + 97.05 # Si es prolina suma 97.05
  }else if (substr(aa, start = 1, stop = 1) == "V" ) {masa_proteina <- masa_proteina + 99.07 # Si es valina suma 99.07
  }else if (substr(aa, start = 1, stop = 1) == "T" ) {masa_proteina <- masa_proteina + 101.05 # Si es treonina suma 101.05
  }else if (substr(aa, start = 1, stop = 1) == "C" ) {masa_proteina <- masa_proteina + 103.01 # Si es cisteina suma 103.01
  }else if (substr(aa, start = 1, stop = 1) == "I" ) {masa_proteina <- masa_proteina + 103.08 # Si es isoleucina suma 103.08
  }else if (substr(aa, start = 1, stop = 1) == "L" ) {masa_proteina <- masa_proteina + 103.08 # Si es leuncina suma 103.08
  }else if (substr(aa, start = 1, stop = 1) == "N" ) {masa_proteina <- masa_proteina + 114.04 # Si es asparagina suma 114.04
  }else if (substr(aa, start = 1, stop = 1) == "D" ) {masa_proteina <- masa_proteina + 115.03 # Si es aspartato suma 115.03
  }else if (substr(aa, start = 1, stop = 1) == "Q" ) {masa_proteina <- masa_proteina + 128.06 # Si es glutamina suma 128.06
  }else if (substr(aa, start = 1, stop = 1) == "K" ) {masa_proteina <- masa_proteina + 128.09 # Si es lisina suma 128.09
  }else if (substr(aa, start = 1, stop = 1) == "E" ) {masa_proteina <- masa_proteina + 129.04 # Si es glutamato suma 129.04
  }else if (substr(aa, start = 1, stop = 1) == "M" ) {masa_proteina <- masa_proteina + 131.04 # Si es metionina suma 131.04
  }else if (substr(aa, start = 1, stop = 1) == "H" ) {masa_proteina <- masa_proteina + 137.06 # Si es histidina suma 137.06
  }else if (substr(aa, start = 1, stop = 1) == "F" ) {masa_proteina <- masa_proteina + 147.07 # Si es fenilalanina suma 147.07
  }else if (substr(aa, start = 1, stop = 1) == "R" ) {masa_proteina <- masa_proteina + 156.10 # Si es arginina suma 156.10
  }else if (substr(aa, start = 1, stop = 1) == "Y" ) {masa_proteina <- masa_proteina + 163.06 # Si es tirosina suma 163.06
  }else if (substr(aa, start = 1, stop = 1) == "W" ) {masa_proteina <- masa_proteina + 186.06 # Si es triptofano suma 186.06
  }
  
  if (substr(aa, start = 2, stop = 2) == "G" ) {masa_proteina <- masa_proteina + 57.02 # Si es glicina suma 57.02
  }else if (substr(aa, start = 2, stop = 2) == "A" ) {masa_proteina <- masa_proteina + 71.04 # Si es alanina suma 71.04
  }else if (substr(aa, start = 2, stop = 2) == "S" ) {masa_proteina <- masa_proteina + 87.03 # Si es serina suma 87.03
  }else if (substr(aa, start = 2, stop = 2) == "P" ) {masa_proteina <- masa_proteina + 97.05 # Si es prolina suma 97.05
  }else if (substr(aa, start = 2, stop = 2) == "V" ) {masa_proteina <- masa_proteina + 99.07 # Si es valina suma 99.07
  }else if (substr(aa, start = 2, stop = 2) == "T" ) {masa_proteina <- masa_proteina + 101.05 # Si es treonina suma 101.05
  }else if (substr(aa, start = 2, stop = 2) == "C" ) {masa_proteina <- masa_proteina + 103.01 # Si es cisteina suma 103.01
  }else if (substr(aa, start = 2, stop = 2) == "I" ) {masa_proteina <- masa_proteina + 103.08 # Si es isoleucina suma 103.08
  }else if (substr(aa, start = 2, stop = 2) == "L" ) {masa_proteina <- masa_proteina + 103.08 # Si es leuncina suma 103.08
  }else if (substr(aa, start = 2, stop = 2) == "N" ) {masa_proteina <- masa_proteina + 114.04 # Si es asparagina suma 114.04
  }else if (substr(aa, start = 2, stop = 2) == "D" ) {masa_proteina <- masa_proteina + 115.03 # Si es aspartato suma 115.03
  }else if (substr(aa, start = 2, stop = 2) == "Q" ) {masa_proteina <- masa_proteina + 128.06 # Si es glutamina suma 128.06
  }else if (substr(aa, start = 2, stop = 2) == "K" ) {masa_proteina <- masa_proteina + 128.09 # Si es lisina suma 128.09
  }else if (substr(aa, start = 2, stop = 2) == "E" ) {masa_proteina <- masa_proteina + 129.04 # Si es glutamato suma 129.04
  }else if (substr(aa, start = 2, stop = 2) == "M" ) {masa_proteina <- masa_proteina + 131.04 # Si es metionina suma 131.04
  }else if (substr(aa, start = 2, stop = 2) == "H" ) {masa_proteina <- masa_proteina + 137.06 # Si es histidina suma 137.06
  }else if (substr(aa, start = 2, stop = 2) == "F" ) {masa_proteina <- masa_proteina + 147.07 # Si es fenilalanina suma 147.07
  }else if (substr(aa, start = 2, stop = 2) == "R" ) {masa_proteina <- masa_proteina + 156.10 # Si es arginina suma 156.10
  }else if (substr(aa, start = 2, stop = 2) == "Y" ) {masa_proteina <- masa_proteina + 163.06 # Si es tirosina suma 163.06
  }else if (substr(aa, start = 2, stop = 2) == "W" ) {masa_proteina <- masa_proteina + 186.06 # Si es triptofano suma 186.06
  }
  
  if (substr(aa, start = 3, stop = 3) == "G" ) {masa_proteina <- masa_proteina + 57.02 # Si es glicina suma 57.02
  }else if (substr(aa, start = 3, stop = 3) == "A" ) {masa_proteina <- masa_proteina + 71.04 # Si es alanina suma 71.04
  }else if (substr(aa, start = 3, stop = 3) == "S" ) {masa_proteina <- masa_proteina + 87.03 # Si es serina suma 87.03
  }else if (substr(aa, start = 3, stop = 3) == "P" ) {masa_proteina <- masa_proteina + 97.05 # Si es prolina suma 97.05
  }else if (substr(aa, start = 3, stop = 3) == "V" ) {masa_proteina <- masa_proteina + 99.07 # Si es valina suma 99.07
  }else if (substr(aa, start = 3, stop = 3) == "T" ) {masa_proteina <- masa_proteina + 101.05 # Si es treonina suma 101.05
  }else if (substr(aa, start = 3, stop = 3) == "C" ) {masa_proteina <- masa_proteina + 103.01 # Si es cisteina suma 103.01
  }else if (substr(aa, start = 3, stop = 3) == "I" ) {masa_proteina <- masa_proteina + 103.08 # Si es isoleucina suma 103.08
  }else if (substr(aa, start = 3, stop = 3) == "L" ) {masa_proteina <- masa_proteina + 103.08 # Si es leuncina suma 103.08
  }else if (substr(aa, start = 3, stop = 3) == "N" ) {masa_proteina <- masa_proteina + 114.04 # Si es asparagina suma 114.04
  }else if (substr(aa, start = 3, stop = 3) == "D" ) {masa_proteina <- masa_proteina + 115.03 # Si es aspartato suma 115.03
  }else if (substr(aa, start = 3, stop = 3) == "Q" ) {masa_proteina <- masa_proteina + 128.06 # Si es glutamina suma 128.06
  }else if (substr(aa, start = 3, stop = 3) == "K" ) {masa_proteina <- masa_proteina + 128.09 # Si es lisina suma 128.09
  }else if (substr(aa, start = 3, stop = 3) == "E" ) {masa_proteina <- masa_proteina + 129.04 # Si es glutamato suma 129.04
  }else if (substr(aa, start = 3, stop = 3) == "M" ) {masa_proteina <- masa_proteina + 131.04 # Si es metionina suma 131.04
  }else if (substr(aa, start = 3, stop = 3) == "H" ) {masa_proteina <- masa_proteina + 137.06 # Si es histidina suma 137.06
  }else if (substr(aa, start = 3, stop = 3) == "F" ) {masa_proteina <- masa_proteina + 147.07 # Si es fenilalanina suma 147.07
  }else if (substr(aa, start = 3, stop = 3) == "R" ) {masa_proteina <- masa_proteina + 156.10 # Si es arginina suma 156.10
  }else if (substr(aa, start = 3, stop = 3) == "Y" ) {masa_proteina <- masa_proteina + 163.06 # Si es tirosina suma 163.06
  }else if (substr(aa, start = 3, stop = 3) == "W" ) {masa_proteina <- masa_proteina + 186.06 # Si es triptofano suma 186.06
  }
  
  return(print( paste("Masa Proteína: ", masa_proteina)))
  #
}

}

masa_uno()
