###########################################################
## MÉTODOS COMPUTACIONALES PARRA LAS POLÍTICAS PÚBLICAS: ##
######### EQUIDAD Y ARBOLADO URBANO EN BOGOTÁ D.C #########
###########################################################
# Fecha: 25 de mayo de 2022
# Autora: Allison Del Río Bahamón

# Índice
# 1.  Datos Bogotá
# 1.1   Arbolado
# 2.  Visualización espacial de los datos
# 2.1   Densidad arborización por localidad
# 2.1.1   Densidad arborización por localidad y año
# 2.1.2   Árboles por habitante por localidad

#Por favor modificar la siguiente línea para indicar el directorio que corresponda:
setwd('C:/Users/allis/Downloads/ali.code_R/Datain')
path <- 'C:/Users/allis/Downloads/ali.code_R/'

# Importar librerias

install.packages('dplyr')
install.packages('sf')

library(dplyr)
library(sf)


#1

#1.1

#Subir base de datos del arbolado urbano
df_arbolado <- read.csv('arboladourbano.csv')
df_arbolado

#2

#2.1

#Subir poligonos de localidades de Bogotá
Bogota <- read_sf(paste0(path, 'Localidades'))
#Bogota <- read_sf('C:/Users/allis/Downloads/ali.code_R/Localidades')
Bogota$LocCodigo <- as.numeric(Bogota$LocCodigo)
#Revisión del mapa resultante
plot(Bogota$geometry)

#Creación de paleta de color para los gráficos
library(RColorBrewer)
col <- brewer.pal(9, "Greens")
pal <- colorRampPalette(col)

#Agrupo los datos de arbolado por localidad
arbolado <- df_arbolado %>% group_by(Codigo_Loc) %>% summarize( n_arboles = n())
arbolado_sf <- inner_join(Bogota, arbolado, by = c('LocCodigo' = 'Codigo_Loc'))
#Gráfico espacial
plot(arbolado_sf[,8], main="Arbolado por localidad", pal = pal)

#2.1.1

#Selección del año de la fecha
df_arbolado$Fecha_Actu <- as.Date(df_arbolado$Fecha_Actu, format = "%Y/%m/%d")
df_arbolado$Fecha_Actu <- format(df_arbolado$Fecha_Actu, format="%Y")

#Plantaciones por año 2020, 2021 y 2022

arbolado_2020 <- df_arbolado %>% group_by(Codigo_Loc) %>% summarize(Codigo_Arb =sum(Fecha_Actu == "2020"))
arbolado_2020_sf <- inner_join(Bogota, arbolado_2020, by = c('LocCodigo' = 'Codigo_Loc'))
#Gráfico espacial 2020
plot(arbolado_2020_sf[,8], main="Plantaciones de árboles por localidad - 2020", pal = pal)

arbolado_2021 <- df_arbolado %>% group_by(Codigo_Loc) %>% summarize(Codigo_Arb =sum(Fecha_Actu == "2021"))
arbolado_2021_sf <- inner_join(Bogota, arbolado_2021, by = c('LocCodigo' = 'Codigo_Loc'))
#Gráfico espacial 2021
plot(arbolado_2021_sf[,8], main="Plantaciones de árboles por localidad - 2021", pal = pal)

arbolado_2022 <- df_arbolado %>% group_by(Codigo_Loc) %>% summarize(Codigo_Arb =sum(Fecha_Actu == "2022"))
arbolado_2022_sf <- inner_join(Bogota, arbolado_2022, by = c('LocCodigo' = 'Codigo_Loc'))
#Gráfico espacial 2022
plot(arbolado_2022_sf[,8], main="Plantaciones de árboles por localidad - 2022", pal = pal)

#2.1.2

#Subir habitantes por localidades de Bogotá
habitantes <- readxl::read_excel('bogota_habitantes_2018-24.xlsx', 
                                 sheet = '1.1')

#Selección datos habitantes para 2022
habitantes <- habitantes %>% group_by(`Código localidad`) %>% summarize( poblacion = sum(`2022`))

#Calculo de arbolado por habitantes
arbolado_localidad_df = inner_join(arbolado_sf, habitantes, by = c('LocCodigo' = 'Código localidad'))
arbolado_localidad_df$densidad = arbolado_localidad_df$n_arboles/arbolado_localidad_df$poblacion*1000
#Gráfico espacial 2022
plot(arbolado_localidad_df[,10], main="Arborización per capita (cada 1000 habitantes) por localidad", pal = pal)
