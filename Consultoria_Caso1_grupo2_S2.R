### Generación de la base de datos para el análisis Longitudinal 

## Cargando la nueva base de datos por cada hoja y además cargando la lista de Plantas que se va a obtener de cada una de las bases de datos.

datos_long_0 <- read_excel("C:/Users/andre/OneDrive/Escritorio/Andrés 2024/2024-1/Consultoría/Caso 1/Info original/MATRIZ DE DATOS FINAL_V1_AG.xlsx", sheet = "Dia 0",col_names=T,range=cell_cols("A:L"))

datos_long_15 <- read_excel("C:/Users/andre/OneDrive/Escritorio/Andrés 2024/2024-1/Consultoría/Caso 1/Info original/MATRIZ DE DATOS FINAL_V1_AG.xlsx", sheet = "Dia 15",col_names=T,range=cell_cols("A:L"))

datos_long_45 <- read_excel("C:/Users/andre/OneDrive/Escritorio/Andrés 2024/2024-1/Consultoría/Caso 1/Info original/MATRIZ DE DATOS FINAL_V1_AG.xlsx", sheet = "Dia 45",col_names=T,range=cell_cols("A:L"))

datos_long_60 <- read_excel("C:/Users/andre/OneDrive/Escritorio/Andrés 2024/2024-1/Consultoría/Caso 1/Info original/MATRIZ DE DATOS FINAL_V1_AG.xlsx", sheet = "Dia 60",col_names=T,range=cell_cols("A:L"))

datos_long_90 <- read_excel("C:/Users/andre/OneDrive/Escritorio/Andrés 2024/2024-1/Consultoría/Caso 1/Info original/MATRIZ DE DATOS FINAL_V1_AG.xlsx", sheet = "Dia 90",col_names=T,range=cell_cols("A:L"))

datos_long_105 <- read_excel("C:/Users/andre/OneDrive/Escritorio/Andrés 2024/2024-1/Consultoría/Caso 1/Info original/MATRIZ DE DATOS FINAL_V1_AG.xlsx", sheet = "Dia 105",col_names=T,range=cell_cols("A:L"))

datos_long_120 <- read_excel("C:/Users/andre/OneDrive/Escritorio/Andrés 2024/2024-1/Consultoría/Caso 1/Info original/MATRIZ DE DATOS FINAL_V1_AG.xlsx", sheet = "Dia 120",col_names=T,range=cell_cols("A:R"))

datos_long_ID<- read_excel("C:/Users/andre/OneDrive/Escritorio/Andrés 2024/2024-1/Consultoría/Caso 1/Info original/MATRIZ DE DATOS FINAL_V1_AG.xlsx", sheet = "ID",col_names=T,range=cell_cols("A:B"))[1:90,]

### Altura de la planta

## En este chunk se obtendran los valores para cada variable y para cada una de las plantas monitoreadas a lo largo del tiempo, además se crea la base de datos para realizar el análisis longitudinal de la variable altura.
Altura_long<-cbind(
  merge(datos_long_0[,c("Altura de la planta (cm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T),
  merge(datos_long_15[,c("Altura de la planta (cm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"Altura de la planta (cm)",
  merge(datos_long_45[,c("Altura de la planta (cm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"Altura de la planta (cm)",
  merge(datos_long_60[,c("Altura de la planta (cm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"Altura de la planta (cm)",
  merge(datos_long_90[,c("Altura de la planta (cm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"Altura de la planta (cm)",
  merge(datos_long_105[,c("Altura de la planta (cm)","ID")],datos_long_ID[,"ID"],by="ID",all.y=T)$"Altura de la planta (cm)",
  merge(datos_long_120[,c("Altura de la planta (cm)","ID")],datos_long_ID[,"ID"],by="ID",all.y =T )$"Altura de la planta (cm)"
)
colnames(Altura_long)<-c("ID","Altura0","Altura15","Altura45","Altura60",
                         "Altura90","Altura105","Altura120")
## Imputación
Altura_long[2,6]<-23.75
Altura_long[2,7]<-24.5
Altura_long[2,8]<-25.2

Altura_long[28,6]<-29.5
Altura_long[28,7]<-32.13
Altura_long[28,8]<-34.4

Altura_long[36,6]<-37
Altura_long[36,7]<-37.75
Altura_long[36,8]<-38.6

### Diametro del tallo

DiamTallo_long<-cbind(
  merge(datos_long_0[,c("diametro de tallo (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T),
  merge(datos_long_15[,c("diametro de tallo (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"diametro de tallo (mm)",
  merge(datos_long_45[,c("diametro de tallo (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"diametro de tallo (mm)",
  merge(datos_long_60[,c("diametro de tallo (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"diametro de tallo (mm)",
  merge(datos_long_90[,c("diametro de tallo (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"diametro de tallo (mm)",
  merge(datos_long_105[,c("diametro de tallo (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y=T)$"diametro de tallo (mm)",
  merge(datos_long_120[,c("diametro de tallo (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y =T )$"diametro de tallo (mm)"
)
colnames(DiamTallo_long)<-c("ID","DiamTallo0","DiamTallo15","DiamTallo45","DiamTallo60","DiamTallo90","DiamTallo105","DiamTallo120")
## Imputación
DiamTallo_long[2,6]<-3.47
DiamTallo_long[2,7]<-4.15
DiamTallo_long[2,8]<-4.76

DiamTallo_long[28,6]<-3.66
DiamTallo_long[28,7]<-3.95
DiamTallo_long[28,8]<-4.98

DiamTallo_long[36,6]<-4.18
DiamTallo_long[36,7]<-4.63
DiamTallo_long[36,8]<-5.30


### Número de hojas.

NumHojas_long<-cbind(
  merge(datos_long_0[,c("numero de hojas","ID")],datos_long_ID[,"ID"],by="ID",all.y = T),
  merge(datos_long_15[,c("numero de hojas","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"numero de hojas",
  merge(datos_long_45[,c("numero de hojas","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"numero de hojas",
  merge(datos_long_60[,c("numero de hojas","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"numero de hojas",
  merge(datos_long_90[,c("numero de hojas","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"numero de hojas",
  merge(datos_long_105[,c("numero de hojas","ID")],datos_long_ID[,"ID"],by="ID",all.y=T)$"numero de hojas",
  merge(datos_long_120[,c("numero de hojas","ID")],datos_long_ID[,"ID"],by="ID",all.y =T )$"numero de hojas"
)
colnames(NumHojas_long)<-c("ID","NumHojas0","NumHojas15","NumHojas45","NumHojas60","NumHojas90","NumHojas105","NumHojas120")
## Imputación
NumHojas_long[2,6]<-29
NumHojas_long[2,7]<-26
NumHojas_long[2,8]<-30

NumHojas_long[28,6]<-28
NumHojas_long[28,7]<-29
NumHojas_long[28,8]<-32

NumHojas_long[36,6]<-18
NumHojas_long[36,7]<-22
NumHojas_long[36,8]<-26

### Diametro raíz.

DiamRaiz_long<-cbind(
  merge(datos_long_0[,c("diametro del cuello de la raiz (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T),
  merge(datos_long_15[,c("diametro del cuello de la raiz (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"diametro del cuello de la raiz (mm)",
  merge(datos_long_45[,c("diametro del cuello de la raiz (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"diametro del cuello de la raiz (mm)",
  merge(datos_long_60[,c("diametro del cuello de la raiz (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"diametro del cuello de la raiz (mm)",
  merge(datos_long_90[,c("diametro del cuello de la raiz (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y = T)$"diametro del cuello de la raiz (mm)",
  merge(datos_long_105[,c("diametro del cuello de la raiz (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y=T)$"diametro del cuello de la raiz (mm)",
  merge(datos_long_120[,c("diametro del cuello de la raiz (mm)","ID")],datos_long_ID[,"ID"],by="ID",all.y =T )$"diametro del cuello de la raiz (mm)"
)
colnames(DiamRaiz_long)<-c("ID","DiamRaiz0","DiamRaiz15","DiamRaiz45","DiamRaiz60",
                           "DiamRaiz90","DiamRaiz105","DiamRaiz120")
## Imputación
DiamRaiz_long[2,6]<-11.23
DiamRaiz_long[2,7]<-12.79
DiamRaiz_long[2,8]<-14.5

DiamRaiz_long[28,6]<-9.51
DiamRaiz_long[28,7]<-11.42
DiamRaiz_long[28,8]<-12.9

DiamRaiz_long[36,6]<-10.55
DiamRaiz_long[36,7]<-11.83
DiamRaiz_long[36,8]<-13.4

### Consolidación
## Aqui cambie el id de los nombres (códigos) a numeros del 1 al 90.
Datos2_long<-as.data.frame(cbind("ID"=rep(c(1:90),7),"Name"=rep(Altura_long$ID,7),"Tiempo"=c(rep(1,90),rep(2,90),rep(3,90),rep(4,90),rep(5,90),rep(6,90),rep(7,90)),"Altura"=c(Altura_long$Altura0,Altura_long$Altura15,Altura_long$Altura45,Altura_long$Altura60,Altura_long$Altura90,Altura_long$Altura105,Altura_long$Altura120),"DiamTallo"=c(DiamTallo_long$DiamTallo0,DiamTallo_long$DiamTallo15,DiamTallo_long$DiamTallo45,DiamTallo_long$DiamTallo60,DiamTallo_long$DiamTallo90,DiamTallo_long$DiamTallo105,DiamTallo_long$DiamTallo120),"NumHojas"=c(NumHojas_long$NumHojas0,NumHojas_long$NumHojas15,NumHojas_long$NumHojas45,NumHojas_long$NumHojas60,NumHojas_long$NumHojas90,NumHojas_long$NumHojas105,NumHojas_long$NumHojas120),"DiamRaiz"=c(DiamRaiz_long$DiamRaiz0,DiamRaiz_long$DiamRaiz15,DiamRaiz_long$DiamRaiz45,DiamRaiz_long$DiamRaiz60,DiamRaiz_long$DiamRaiz90,DiamRaiz_long$DiamRaiz105,DiamRaiz_long$DiamRaiz120)))
## Guardando la bse de datos 
write_xlsx(as.data.frame(Datos2_long), "C:/Users/andre/OneDrive/Escritorio/Andrés 2024/2024-1/Consultoría/Caso 1/Info original/Tabla_Longitudinal.xlsx")

