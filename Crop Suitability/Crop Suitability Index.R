setwd("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Crop Suitability")

#install.packages("purr")
#install.packages("reshape2")
library(dplyr)
library(ggplot2)
library("gridExtra")
library("reshape2")
library(tidyverse)

####cereals Raindfed low Input 2020s A2 without CO2 fertilisation
highinputrain2020s<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Crop Suitability/highinputrainfed2020s.csv")

colnames(highinputrain2020s)[2:6] <- paste("highinputrain2020s", colnames(highinputrain2020s[,c(2:6)]), sep = "_")

a<-highinputrain2020s[highinputrain2020s$Country %in% c("Switzerland","Germany","Australia","Netherlands","Denmark","Canada","United Kingdom","United States of America","Belgium","France","Argentina","Russian Federation","Thailand","China","Ukraine","India","Zambia","Kenya","Pakistan","Rwanda", "United Republic of Tanzania","Uganda","South Sudan", "Burundi"),]

#####cereals Raindfed low Input 2020s  A2 without CO2 fertilisation
lowinputrain2020s<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Crop Suitability/lowinputrainfed2020s.csv")

colnames(lowinputrain2020s)[2:6] <- paste("lowinputrain2020s", colnames(lowinputrain2020s[,c(2:6)]), sep = "_")

b<-lowinputrain2020s[lowinputrain2020s$Country %in% c("Switzerland","Germany","Australia","Netherlands","Denmark","Canada","United Kingdom","United States of America","Belgium","France","Argentina","Russian Federation","Thailand","China","Ukraine","India","Zambia","Kenya","Pakistan","Rwanda", "United Republic of Tanzania","Uganda","South Sudan", "Burundi"),]

#####cereals Rainfed high Input 2050s  A2 without CO2 fertilisation

highinputrain2050s<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Crop Suitability/highinputrainfed2050s.csv")

colnames(highinputrain2050s)[2:6] <- paste("highinputrain2050s", colnames(highinputrain2050s[,c(2:6)]), sep = "_")

c<-highinputrain2050s[highinputrain2050s$Country %in% c("Switzerland","Germany","Australia","Netherlands","Denmark","Canada","United Kingdom","United States of America","Belgium","France","Argentina","Russian Federation","Thailand","China","Ukraine","India","Zambia","Kenya","Pakistan","Rwanda", "United Republic of Tanzania","Uganda","South Sudan", "Burundi"),]

#####cereals Rainfed high Input 2050s  A2 without CO2 fertilisation

lowinptrain2050s<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Crop Suitability/lowinputrainfed2050s.csv")

colnames(lowinptrain2050s)[2:6] <- paste("lowinptrain2050s", colnames(lowinptrain2050s[,c(2:6)]), sep = "_")

d<-lowinptrain2050s[lowinptrain2050s$Country %in% c("Switzerland","Germany","Australia","Netherlands","Denmark","Canada","United Kingdom","United States of America","Belgium","France","Argentina","Russian Federation","Thailand","China","Ukraine","India","Zambia","Kenya","Pakistan","Rwanda", "United Republic of Tanzania","Uganda","South Sudan", "Burundi"),]


####cereals Rainfed high Input 2080s  A2 without CO2 fertilisation

highinputrain2080s<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Crop Suitability/highinputrainfed2080s.csv")
colnames(highinputrain2080s)[2:6] <- paste("highinputrain2080s", colnames(highinputrain2080s[,c(2:6)]), sep = "_")
e<-highinputrain2080s[highinputrain2080s$Country %in% c("Switzerland","Germany","Australia","Netherlands","Denmark","Canada","United Kingdom","United States of America","Belgium","France","Argentina","Russian Federation","Thailand","China","Ukraine","India","Zambia","Kenya","Pakistan","Rwanda", "United Republic of Tanzania","Uganda","South Sudan", "Burundi"),]

colnames(highinputrain2080s)[2:6] <- paste("highinputrain2080s", colnames(highinputrain2080s[,c(2:6)]), sep = "_")

####cereals Rainfed low Input 2080s A2 without CO2 fertilisation-CSIRO

lowinputrain2080<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Crop Suitability/lowinputrainfed2080s.csv")

colnames(lowinputrain2080)[2:6] <- paste("lowinputrain2080", colnames(lowinputrain2080[,c(2:6)]), sep = "_")
f<-lowinputrain2080[lowinputrain2080$Country %in% c("Switzerland","Germany","Australia","Netherlands","Denmark","Canada","United Kingdom","United States of America","Belgium","France","Argentina","Russian Federation","Thailand","China","Ukraine","India","Zambia","Kenya","Pakistan","Rwanda", "United Republic of Tanzania","Uganda","South Sudan", "Burundi"),]


all_scenarios <-list(a,b,c,d,e,f) %>%
  reduce(full_join, by ="Country")

write.csv(all_scenarios,"all_scenarios.csv")










