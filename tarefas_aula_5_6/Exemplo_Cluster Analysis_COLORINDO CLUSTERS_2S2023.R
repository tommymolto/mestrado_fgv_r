# Arquivo: EXEMPLO_CLUSTER ANALYSIS_COLORINDO CLUSTERS_2S2023.R

## FGV EAESP - 2S2023
## MPGC-TI - Big Data Analytics e Data Science - Aulas 5 e 6
## Prof. Eduardo de Rezende Francisco
## com contribuição de Rafael Tamanini (DPA)
## Data: Setembro e Outubro/2023

## Exemplos de Cluster Analysis

# Extensão para gráficos e para Análise de Agrupamentos
#install.packages("ggplot2")
library(ggplot2)
#install.packages("ggdendro")
library(ggdendro)
#install.packages("dendextend")
library(dendextend)

# Lê o arquivo com as informações dos Sanduíches
sanduiches <- read.table("c:/mpgc/Sanduiches.csv",header=TRUE,sep = ";", dec=",")
row.names(sanduiches) <- sanduiches$Sanduiches

# Retira a coluna de texto com os nomes dos sanduiches da tabela
sanduiches <- sanduiches[,2:11]

# Implementa o algoritmo hierárquico e apresenta o dendrograma
hc <- hclust(dist(sanduiches), "average")  # explorar com outros métodos de distância
p <- ggdendrogram(hc, rotate=FALSE)
print(p)
ggdendrogram(hc, rotate=TRUE)

hcdata <- dendro_data(hc)
ggdendrogram(hcdata, segments=TRUE,rotate=TRUE, size=2) + labs(title="Dendrograma dos Sanduíches")

# "Cortando" a árvore em 3 grupos
grupos <- cutree(hc,k=3)
grupos

# Colorindo o dendrograma

# Convertendo hclust para um dendrograma e atribuindo para a dend
dend <- as.dendrogram(hc)

dend <- dend %>%
  set("branches_k_color", k = 3) %>% #dividindo os ramos em 3 cortes
  set("branches_lwd", 0.7) %>% #largura das linhas do dendrograma
  set("labels_cex", 0.6) %>% #tamanho dos rotulos do dendrograma
  set("labels_colors", k = 3) %>% #definindo as 3 cores
  set("leaves_pch", 19) %>% #pontos do dendrograma (visual)
  set("leaves_cex", 0.5) #ajustando o tamanho dos pontos

# Convertendo o dendrograma em um objeto ggdend
ggd1 <- as.ggdend(dend)

ggplot(ggd1, horiz = TRUE)
