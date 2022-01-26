#tarea 0 --> Mayela Fosado

#Paso uno, cargar mis librerias 
library(Biostrings)
library(parallel)
library(BiocGenerics)
library(S4Vectors)
library(stats4)
library(IRanges)
library(XVector)

#Cargar las secuencias ----
secuencias <- readRNAStringSet("first.fasta")
secuencias 

#Contar Caracteres  ----

#Con R base
nchar(secuencias) 
#cuenta la cantidad de caracteres en cada uno

#Con libreria de R
width(secuencias)
#cuenta la cantidad de caracteres en cada uno

#Contar nucleotidos ----

DNAString("AGCT") -> sec 

#Con Biostrings
alphabetFrequency(sec, as.prob = T)

#Con R base, se me ocurre, lo mismo que la de complemento, pero asignar variables de cada nucleotido y si va saliendo uno, le sume, pero ya se me acabo el tiempo, lo hare bien la tarea 1 
#estado: con lag mental :c

#Secuencia complemento ----

#Con Biostrings

DNAString("AAAACCCGGT")-> secuencia

complement(secuencia)


#Con R base
#Secuencia que está en Rosalind 
#  AAAACCCGGT

complemento <- function (Secuencia) {
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
    } else if(substr(respuesta, start = 1, stop = 1) == "C"){uno <- "G"}else(print("nada")) 
    
    if(substr(respuesta, start = 2, stop = 2) == "A"){dos <- "T"
    }else if(substr(respuesta, start = 2, stop = 2) == "T"){dos <- "A"
    }else if(substr(respuesta, start = 2, stop = 2) == "G"){dos <- "C"
    }else if(substr(respuesta, start = 2, stop = 2) == "C"){dos <- "G"}else(print("nada"))  
    
    if(substr(respuesta, start = 3, stop = 3) == "A"){tres <- "T"
    }else if(substr(respuesta, start = 3, stop = 3) == "T"){tres <- "A"
    }else if(substr(respuesta, start = 3, stop = 3) == "G"){tres <- "C"
    }else if(substr(respuesta, start = 3, stop = 3) == "C"){tres <- "G"}else(print("nada")) 
    
    if(substr(respuesta, start = 4, stop = 4) == "A"){cuatro <- "T"
    }else if(substr(respuesta, start = 4, stop = 4) == "T"){cuatro <- "A"
    }else if(substr(respuesta, start = 4, stop = 4) == "G"){cuatro <- "C"
    }else if(substr(respuesta, start = 4, stop = 4) == "C"){cuatro <- "G"}else(print("nada")) 
    
    if(substr(respuesta, start = 5, stop = 5) == "A"){cinco <- "T"
    }else if(substr(respuesta, start = 5, stop = 5) == "T"){cinco <- "A"
    }else if(substr(respuesta, start = 5, stop = 5) == "G"){cinco <- "C"
    }else if(substr(respuesta, start = 5, stop = 5) == "C"){cinco <- "G"}else(print("nada"))
    
    if(substr(respuesta, start = 6, stop = 6) == "A"){seis <- "T"
    }else if(substr(respuesta, start = 6, stop = 6) == "T"){seis <- "A"
    }else if(substr(respuesta, start = 6, stop = 6) == "G"){seis <- "C"
    }else if(substr(respuesta, start = 6, stop = 6) == "C"){seis <- "G"}else(print("nada")) 
    
    if(substr(respuesta, start = 7, stop = 7) == "A"){siete <- "T"
    }else if(substr(respuesta, start = 7, stop = 7) == "T"){siete <- "A"
    }else if(substr(respuesta, start = 7, stop = 7) == "G"){siete <- "C"
    }else if(substr(respuesta, start = 7, stop = 7) == "C"){siete <- "G"}else(print("nada")) 
    
    if(substr(respuesta, start = 8, stop = 8) == "A"){ocho <- "T"
    }else if(substr(respuesta, start = 8, stop = 8) == "T"){ocho <- "A"
    }else if(substr(respuesta, start = 8, stop = 8) == "G"){ocho <- "C"
    }else if(substr(respuesta, start = 8, stop = 8) == "C"){ocho <- "G"}else(print("nada")) 
    
    if(substr(respuesta, start = 9, stop = 9) == "A"){nueve <- "T"
    }else if(substr(respuesta, start = 9, stop = 9) == "T"){nueve <- "A"
    }else if(substr(respuesta, start = 9, stop = 9) == "G"){nueve <- "C"
    }else if(substr(respuesta, start = 9, stop = 9) == "C"){nueve <- "G"}else(print("nada")) 
    
    if(substr(respuesta, start = 10, stop = 10) == "A"){diez <- "T"
    }else if(substr(respuesta, start = 10, stop = 10) == "T"){diez <- "A"
    }else if(substr(respuesta, start = 10, stop = 10) == "G"){diez <- "C"
    }else if(substr(respuesta, start = 10, stop = 10) == "C"){diez <- "G"}else(print("nada")) 
    
    print(paste("Secuencia complementaria:", paste0(uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve, diez)))
    respuesta <- readline(prompt = "¿Quieres probar con otra secuencia (Sí=1, No=0)  ")
    respuesta <- as.numeric(respuesta)
  }
}
#la hice así, le hace falta ser mas robusta, para que pueda de varias secuencias, pero no me salió, y para que sea de cualquier numero de nucleotidos



#usando la que mandaste, spoiler... sale mal, (por ahora)
#Extra...
#Secuencia de RNA a DNA ----

#Con R base

#Con Biostrings
translate(secuencias)


#Intento fallido con secuencia concatenada

#Contar nucleotidos 
tra <- function (Secuencias) {

    secuencias <- readRNAStringSet("first.fasta")
    #aqui va el archivo
  
    if(substr(secuencias[1], start = 1, stop = 1) == "U"){secuencias <- "T"
    }else(print(paste0(secuencias))) 
    
    if(substr(respuesta, start = 2, stop = 2) == "A"){dos <- "T"
    }else if(substr(respuesta, start = 2, stop = 2) == "T"){dos <- "A"
    }else if(substr(respuesta, start = 2, stop = 2) == "G"){dos <- "C"
    }else if(substr(respuesta, start = 2, stop = 2) == "C"){dos <- "G"}else(print("nada"))  
    
    if(substr(respuesta, start = 3, stop = 3) == "A"){tres <- "T"
    }else if(substr(respuesta, start = 3, stop = 3) == "T"){tres <- "A"
    }else if(substr(respuesta, start = 3, stop = 3) == "G"){tres <- "C"
    }else if(substr(respuesta, start = 3, stop = 3) == "C"){tres <- "G"}else(print("nada")) 
    print(paste("Aminoácido:", aminoacid, "y", "Secuencia complementaria:", paste0(uno, dos, tres)))
    respuesta <- readline(prompt = "¿Quieres probar con otra secuencia (Sí=1, No=0)  ")
    respuesta <- as.numeric(respuesta)
  }
}

secuencias[1]


for(i in length(secuencias)){
  
  
 