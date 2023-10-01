## FGV EAESP - 2S2023
## MPGC-TI - Big Data Analytics e Data Science - Aulas 5 e 6
## Prof. Eduardo de Rezende Francisco
## Data: Setembro e Outubro/2023 

## Exemplo de SNA - Social Network Analysis - Rede TWO MODE

## Tarefas Rede One

Preparando o ambiente:
  
  **OBS: Para usuarios de Mac, a lib rgl tem dependencias anteriores!**
  
  ```{r pressure, echo=FALSE}
# Extensões para Análise de Redes
#(devem ser previamente baixadas no CRAN do R)
if (!require("network")) install.packages("network")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("sna")) install.packages("sna")
if (!require("rgl")) install.packages("rgl")
if (!require("ggdendro")) install.packages("ggdendro")

library("ggdendro")
library(ggplot2)
library(network)
library(sna)
library(rgl)
```

```{r }
# Trabalha a partir de uma rede aleatória
setwd(".")
rede <- read.table(paste(getwd(), "Rede_One_Mode_Tarefa_Aulas_5_e_6.csv", sep="/"),header=TRUE,sep = ";", dec=",")
```
