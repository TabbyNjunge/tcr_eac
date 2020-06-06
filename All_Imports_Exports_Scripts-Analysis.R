
setwd("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2")
getwd()

#install.packages("ggplot2")
#install.packages("gridExtra")


library(dplyr)
library(ggplot2)
library("gridExtra")


#################################################################################################################################################################
#####REGIONAL TRENDS

EAC_imports <- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_imported_by_East_African_Community_(EAC) .csv")
EAC_exports <- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_exported_by_East_African_Community_(EAC).csv")


#sources ITC calculations based on UN COMTRADE DATA;ITC Calculations based on Office Burundais des Recettes statistics jan 2013-jan 2014
#Unit:USdollar thousand

burundi_imports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_imported_by_Burundi .csv")
burundi_exports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_exported_by_Burundi .csv")
burundi_imports_exports <- merge(x=burundi_imports, y=burundi_exports,by="code", all = TRUE)
burundi_imports_exports <- burundi_imports_exports[!burundi_imports_exports$product_label.x=="All products",]
  
View(burundi_imports_exports)


#Data from COMTRADE Data and Kenya National Bureau of statistics
kenya_imports <-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_imported_by_Kenya.csv")
kenya_exports<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_exported_by_Kenya.csv")
kenya_imports_exports<- merge(x=kenya_imports, y=kenya_exports,by="code", all = TRUE)
kenya_imports_exports <- kenya_imports_exports[!kenya_imports_exports$product_label.x=="All products",]

View(kenya_imports_exports)

#Data from ITC calculations based on UN COMTRADE statistics#usdollar thousand
rwanda_imports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_imported_by_Rwanda .csv")
rwanda_exports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_exported_by_Rwanda .csv")
rwanda_imports_exports<- merge(x=rwanda_imports, y=rwanda_exports,by="code",all = TRUE)
rwanda_imports_exports <- rwanda_imports_exports[!rwanda_imports_exports$product_label.x=="All products",]
View(rwanda_imports_exports)


#data from ITC calculations based on UN  COMTRADE and ITC statistics#us dollar thousand
ssudan_imports<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_imported_by_South_Sudan .csv")
ssudan_exports<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_exported_by_South_Sudan .csv")
ssudan_imports_exports<- merge(x=ssudan_imports, y=ssudan_exports,by="code",all = TRUE)
ssudan_imports_exports <- ssudan_imports_exports[!ssudan_imports_exports$product_label.x=="All products",]

View(ssudan_imports_exports)

#data from ITC calcuations based on National Bureau of statistics since Jan 2018#us dollar thousand
tanzania_exports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_imported_by_Tanzania.csv")
tanzania_imports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_exported_by_Tanzania.csv")
tanzania_imports_exports<- merge(x=tanzania_imports, y=tanzania_exports,by="code",all = TRUE)
tanzania_imports_exports <- tanzania_imports_exports[!tanzania_imports_exports$product_label.x=="All products",]

View(tanzania_imports_exports)

#data from ITC calculations based on Uganda Bureau of statistics since Jan 2018#us dollar thousand
uganda_imports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_imported_by_Uganda .csv")
uganda_exports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_-_List_of_products_exported_by_Uganda .csv")
uganda_imports_exports<- merge(x=uganda_imports, y=uganda_exports,by="code",all = TRUE)
uganda_imports_exports <- uganda_imports_exports[!uganda_imports_exports$product_label.x=="All products",]

View(uganda_imports_exports)

##########################################################################################################################################################################
###################################AVERAGE imports and exports for past 5 years: 2014-2018 for each country AND TOP TEN imports and Exports

burundi_imports_exports$average_burundi_imports<- rowMeans(burundi_imports_exports[,16:20])
burundi_imports_exports$average_burundi_exports<- rowMeans(burundi_imports_exports[,35:39])
View(burundi_imports_exports)

top_burundi_imports <-burundi_imports_exports[order(-burundi_imports_exports$average_burundi_imports),][1:11,c(1:2,16:20, 40:41)]
top_burundi_exports <-burundi_imports_exports[order(-burundi_imports_exports$average_burundi_exports),][1:11,c(1:2,35:41)]

#burundi_merge<- merge(x = top_burundi_imports, y = top_burundi_exports, by = "code", all = TRUE) 
#write.csv(burundi_merge, file="burundi_merge.csv")

########### 
kenya_imports_exports$average_kenya_imports<- rowMeans(kenya_imports_exports[,16:20])
kenya_imports_exports$average_kenya_exports<- rowMeans(kenya_imports_exports[,35:39])
View(kenya_imports_exports)

top_kenya_imports <-kenya_imports_exports[order(-kenya_imports_exports$average_kenya_imports),][1:11,]
top_kenya_exports<-kenya_imports_exports[order(-kenya_imports_exports$average_kenya_exports),][1:11,]

##########
rwanda_imports_exports$average_rwanda_imports<- rowMeans(rwanda_imports_exports[,16:20])
rwanda_imports_exports$average_rwanda_exports<- rowMeans(rwanda_imports_exports[,35:39])
View(rwanda_imports_exports)

top_rwanda_imports <-rwanda_imports_exports[order(-rwanda_imports_exports$average_rwanda_imports),][1:11,]
top_rwanda_exports<-rwanda_imports_exports[order(-rwanda_imports_exports$average_rwanda_exports),][1:11,]

##########
ssudan_imports_exports$average_ssudan_imports<- rowMeans(ssudan_imports_exports[,16:20],na.rm = TRUE)#omits NAs in data sets
ssudan_imports_exports$average_ssudan_exports<- rowMeans(ssudan_imports_exports[,35:39],na.rm = TRUE)#omits NAs in data sets
View(ssudan_imports_exports)

top_ssudan_imports <-ssudan_imports_exports[order(-ssudan_imports_exports$average_ssudan_imports),][1:11,]
top_ssudan_exports<-ssudan_imports_exports[order(-ssudan_imports_exports$average_ssudan_exports),][1:11,]

##########
tanzania_imports_exports$average_tanzania_imports<- rowMeans(tanzania_imports_exports[,35:39])
tanzania_imports_exports$average_tanzania_exports<- rowMeans(tanzania_imports_exports[,16:20])
View(tanzania_imports_exports)

top_tanzania_imports <-tanzania_imports_exports[order(-tanzania_imports_exports$average_tanzania_imports),][1:11,]
top_tanzania_exports<-tanzania_imports_exports[order(-tanzania_imports_exports$average_tanzania_exports),][1:11,]

##########
uganda_imports_exports$average_uganda_imports<- rowMeans(uganda_imports_exports[,35:39])
uganda_imports_exports$average_uganda_exports<- rowMeans(uganda_imports_exports[,16:20])
View(uganda_imports_exports)

top_uganda_imports <-uganda_imports_exports[order(-uganda_imports_exports$average_uganda_imports),][1:11,]
top_uganda_exports<-uganda_imports_exports[order(-uganda_imports_exports$average_uganda_exports),][1:11,]
######################################################################################################################################################################

################################################################################################


myList <- list(top_uganda_exports = top_uganda_exports, 
               top_uganda_imports = top_uganda_imports,
               top_rwanda_exports = top_rwanda_exports,
               top_rwanda_imports = top_rwanda_imports,
               top_burundi_exports=top_burundi_exports,
               top_burundi_imports = top_burundi_imports,
               top_tanzania_exports=top_tanzania_exports,
               top_tanzania_imports=top_tanzania_imports,
               top_ssudan_exports =top_ssudan_exports,
               top_ssudan_imports=top_ssudan_imports,
               top_kenya_exports=top_kenya_exports,
               top_kenya_imports=top_kenya_imports)
mapply(write.csv,row.names=FALSE, myList, file=paste0(names(myList), ".csv"))

#######################################################################################################################################################
###########Create BARGRAPHS in R for TOP imports and Exports


###g<-ggplot(top_burundi_exports, aes(code, average_burundi_exports))+geom_point(color="firebrick")

b_exports<-ggplot(top_burundi_exports, aes(x= reorder(product_label.x,-average_burundi_exports),y=average_burundi_exports))+geom_col(color="firebrick") +
scale_y_continuous(name=top_burundi_exports,labels=scales::comma)+## have in 1000's instead of exponential
theme(axis.text.x = element_text(angle = 60, size = 8))+
  labs(title = "burundi top exports",x="product label",y="value in 1000s USD")

b_imports<-ggplot(top_burundi_imports, aes(x= reorder(product_label.x,- average_burundi_imports), y= average_burundi_imports))+geom_col(color="firebrick") +
  scale_y_continuous(name=top_burundi_imports,labels=scales::comma)+
  theme(axis.text.x = element_text(angle = 60, size = 8))+
  labs(title = "burundi top imports",x="product label",y="value in 1000s USD")

##############
k_exports<-ggplot(top_kenya_exports, aes(x=reorder(product_label.x,-average_kenya_exports),y=average_kenya_exports))+geom_col(color="firebrick") +
  scale_y_continuous(name=top_kenya_exports,labels=scales::comma)+
  theme(axis.text.x = element_text(angle = 60, size = 8))+
  labs(title = "kenya top exports",x="product label",y="value in 1000s USD")

k_imports<-ggplot(top_kenya_imports, aes(x=reorder(product_label.x,-average_kenya_imports),y= average_kenya_imports))+geom_col(color="firebrick") +
  scale_y_continuous(name=top_kenya_imports,labels=scales::comma)+
  theme(axis.text.x = element_text(angle = 60, size = 8))+
  labs(title = "kenya top imports",x="product label",y="value in 1000s USD")

##############
r_exports<-ggplot(top_rwanda_exports, aes(x=reorder(product_label.x,-average_rwanda_exports),y= average_rwanda_exports))+geom_col(color="firebrick") +
  scale_y_continuous(name=top_rwanda_exports,labels=scales::comma)+
  theme(axis.text.x = element_text(angle = 60, size = 8))+
  labs(title = "rwanda top exports",x="product label",y="value in 1000s USD")

r_imports<-ggplot(top_rwanda_imports, aes(x=reorder(product_label.x,-average_rwanda_imports),y= average_rwanda_imports))+geom_col(color="firebrick") +
  scale_y_continuous(name=top_rwanda_imports,labels=scales::comma)+
  theme(axis.text.x = element_text(angle = 60, size = 8))+
  labs(title = "rwanda top imports",x="product label",y="value in 1000s USD")

##############
ss_exports<-ggplot(top_ssudan_exports, aes(x=reorder(product_label.x,-average_ssudan_exports),y=average_ssudan_exports))+geom_col(color="firebrick") +
  scale_y_continuous(name=top_ssudan_exports,labels=scales::comma)+
  theme(axis.text.x = element_text(angle = 60, size = 8))+
  labs(title = "southsudan top exports",x="product label",y="value in 1000s USD")

ss_imports<-ggplot(top_ssudan_imports, aes(x=reorder(product_label.x,-average_ssudan_imports),y= average_ssudan_imports))+geom_col(color="firebrick") +
  scale_y_continuous(name=top_ssudan_imports,labels=scales::comma)+
  theme(axis.text.x = element_text(angle = 60, size = 8))+
  labs(title = "southsudan top imports",x="product label",y="value in 1000s USD")

##############
t_exports<-ggplot(top_tanzania_exports, aes(x=reorder(product_label.x,-average_tanzania_exports),y= average_tanzania_exports))+geom_col(color="firebrick") +
  scale_y_continuous(name=top_tanzania_exports,labels=scales::comma)+
  theme(axis.text.x = element_text(angle = 60, size = 8))+
  labs(title = "tanzania top exports",x="product label",y="value in 1000s USD")

t_imports<-ggplot(top_tanzania_imports, aes(x=reorder(product_label.x,-average_tanzania_imports),y=average_tanzania_imports))+geom_col(color="firebrick") +
  scale_y_continuous(name=top_tanzania_imports,labels=scales::comma)+
  theme(axis.text.x = element_text(angle = 60, size = 8))+
  labs(title = "tanzania top imports",x="product label",y="value in 1000s USD")

##############
u_exports<-ggplot(top_uganda_exports, aes(x=reorder(product_label.x,-average_uganda_exports),y= average_uganda_exports))+geom_col(color="firebrick") +
  scale_y_continuous(name=top_uganda_exports,labels=scales::comma)+
  theme(axis.text.x = element_text(angle = 60, size = 8))+
  labs(title = "uganda top exports",x="product label",y="value in 1000s USD")

u_imports<-ggplot(top_uganda_imports, aes(x=reorder(product_label.x,-average_uganda_imports),y=average_uganda_imports))+geom_col(color="firebrick") +
  scale_y_continuous(name=top_tanzania_imports,labels=scales::comma)+
  theme(axis.text.x = element_text(angle = 60, size = 8))+
  labs(title = "uganda top imports",x="product label",y="value in 1000s USD")

grid.arrange(b_imports,k_imports,r_imports,ss_imports,t_imports,u_imports)

gridExtra::marrangeGrob(b_imports,k_imports,nrow = 2,ncol = 1)

##ALL PLOTS
###Imports

library(gridExtra)
plot_imports<-grid.arrange(b_imports,k_imports,r_imports,ss_imports,t_imports,u_imports, ncol=6)


plot_exports<-grid.arrange(b_exports,k_exports,r_exports,ss_exports,t_exports,u_exports,ncol=6)
                    





























