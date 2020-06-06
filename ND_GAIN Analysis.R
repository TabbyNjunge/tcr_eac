setwd("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/ND_GAIN_Downloads")
#install.packages("tidyverse")
#install.packages("purr")
#install.packages("reshape2")
library(dplyr)
library(ggplot2)
library("gridExtra")
library("reshape2")
library(tidyverse)

 
#######VULNERABILITY SCORES       
nd_gain<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/ND_GAIN_Downloads/resources/gain/gain.csv") 
vulnerability_infra<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/ND_GAIN_Downloads/resources/vulnerability/infrastructure.csv")
vulnerability_health<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/ND_GAIN_Downloads/resources/vulnerability/health.csv")
vulnerability_agric <- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/ND_GAIN_Downloads/resources/vulnerability/food.csv")
vulnerability_water<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/ND_GAIN_Downloads/resources/vulnerability/water.csv")
summary_nd_gain<-summary(nd_gain)
write.csv(summary_nd_gain,"nd_gain_summary.csv")



#######FILTER FOR EXPORTING COUNTRIES AND EAC COUNTRIES
nd_gain_final<- nd_gain[nd_gain$ISO3 %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI","SWE"), c("ISO3","Name","X2017") ]
vulnerability_infra_final <- vulnerability_infra[vulnerability_infra$ISO3 %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI","SWE"), c("ISO3","Name","X2017"),]
vulnerability_health_final<- vulnerability_health[vulnerability_health$ISO3 %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI","SWE"), c("ISO3","Name","X2017"), ]
vulnerability_agric_final<- vulnerability_agric[vulnerability_agric$ISO3 %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI","SWE"), c("ISO3","Name","X2017"), ]
vulnerability_water_final<- vulnerability_water[vulnerability_water$ISO3 %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI","SWE"), c("ISO3","Name","X2017"), ]


#########ADAPTIVE CAPACITY SCORES  FOR TOP FIVE EXPOSRTING COUNTRIES
capacity<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/ND_GAIN_Downloads/resources/vulnerability/capacity.csv")
capacity_final<- capacity[capacity$ISO3 %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI","SWE"), c("ISO3","Name","X2017") ]

####READINESS SCORES FOR EXPORTING AND IMPORTING COUNTRIES
readiness <- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/ND_GAIN_Downloads/resources/readiness/readiness.csv")
readiness_economic <- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/ND_GAIN_Downloads/resources/readiness/economic.csv")
readiness_social<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/ND_GAIN_Downloads/resources/readiness/social.csv")
readiness_governance<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/ND_GAIN_Downloads/resources/readiness/governance.csv")

readiness_overall <- readiness[readiness$ISO3 %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI","SWE"), c("ISO3","Name","X2017"), ]
readiness_economic <-readiness_economic[readiness_economic$ISO3 %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI","SWE"), c("ISO3","Name","X2017"), ]
readiness_governance<-readiness_governance[readiness$ISO3 %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI","SWE"), c("ISO3","Name","X2017"), ]
readiness_social<- readiness_social[readiness_social$ISO3 %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI","SWE"), c("ISO3","Name","X2017"), ]
readiness_final<- list(readiness_overall, readiness_economic,readiness_governance,readiness_social)%>% 
   reduce(full_join,by="ISO3")
readiness_importing<- readiness_final[readiness_final$ISO3 %in% c("KEN","SSD","UGA","RWA","TZA","BDI"),c(2,3,5,7,9)]
colnames(readiness_importing)[2:5]<-c("overall","economic","governance","social")
write.csv(readiness_importing, "readiness_importing.csv")


########TRANSNATIONAL CLIMATE SCORES FOR TOP FIVE EXPOSRTING COUNTRIES
tci<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/TCI Scores/TCI_Scores.csv")
tci_final<- tci[tci$ISO3 %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI","SWE"), ]
summary_tci<-summary(tci)
write.csv(summary_tci,"summary.tci.csv")


#########ALL COUNTRIES SCORES  FOR TOP FIVE EXPOSRTING COUNTRIES
all_countries <-list(nd_gain_final,vulnerability_agric_final,vulnerability_health_final,vulnerability_infra_final,vulnerability_water_final,capacity_final,tci_final) %>%
  reduce(full_join, by ="ISO3")

all_final<-all_countries[,c(1:3,5,7,9,11,13,15)]
colnames(all_final)[3:8]<-c("nd_gain_final","vulnerability_agric_final","vulnerability_health_final","vulnerability_infra_final","vulnerability_water_final","capacity_final")

write.csv(all_final,"allfinalvulnerabilities.csv")

#########RELATIONSHIP BETWEEN vULNERABILITIES OF EXPORTING cOUNTRY AND eac country
###KENYA PHARMS
hhicr5vul_ke_pharm<- hhicr5_ke_pharms[1:5,]

ke_pharm_vul<- all_final[all_final$ISO3 %in% c("BEL","CHN","DEU","IND","GBR"),]
colnames(ke_pharm_vul)[2]<-"Exporters"
ke_vul_pharm_final<-merge(hhicr5vul_ke_pharm,ke_pharm_vul)
 
write.csv(ke_vul_pharm_final,"ke_vul_pharm_final.csv")

####KENYA CEREALS
hhicr5vul_ke_cereals<- hhicr5_ke[1:5,]

ke_cereals_vul<- all_final[all_final$ISO3 %in% c("UKR","PAK","RUS","THA","UGA"),]
colnames(ke_cereals_vul)[2]<-"Exporters"

ke_vul_cereals_final<-merge(hhicr5vul_ke_cereals,ke_cereals_vul)

write.csv(ke_vul_cereals_final,"ke_vul_cereals_final.csv")

###UGANDA PHARMS

hhicr5vul_ug_pharm<- hhicr5_ug_pharms[1:5,]

ug_pharm_vul<- all_final[all_final$ISO3 %in% c("BEL","CHN","KEN","IND","FRA"),]
colnames(ug_pharm_vul)[2]<-"Exporters"
ug_vul_pharm_final<-merge(hhicr5vul_ug_pharm,ug_pharm_vul)

write.csv(ug_vul_pharm_final,"ug_vul_pharm_final.csv")

###UGANDA CEREALS
hhicr5vul_ug_cereals<- hhicr5_ug[1:5,]

ug_cereals_vul<- all_final[all_final$ISO3 %in% c("RUS","PAK","UKR","TZA","ARG"),]
colnames(ug_cereals_vul)[2]<-"Exporters"

ug_vul_cereals_final<-merge(hhicr5vul_ug_cereals,ug_cereals_vul)

write.csv(ug_vul_cereals_final,"ug_vul_cereals_final.csv")

###TANZANIA PHARMACEUTICALS
hhicr5vul_tza_pharm<- hhicr5_tza_pharms[1:5,]

tza_pharm_vul<- all_final[all_final$ISO3 %in% c("CHN","KEN","DNK","USA","IND"),]

colnames(tza_pharm_vul)[2]<-"Exporters"

tza_vul_pharm_final<-merge(hhicr5vul_tza_pharm,tza_pharm_vul)

write.csv(tza_vul_pharm_final,"tza_vul_pharm_final.csv")

###TANZANIA CEREALS

hhicr5vul_tza_cereals<- hhicr5_tza[1:5,]

tza_cereals_vul<- all_final[all_final$ISO3 %in% c("RUS","CAN","AUS","ZMB","DEU"),]
colnames(tza_cereals_vul)[2]<-"Exporters"

tza_vul_cereals_final<-merge(hhicr5vul_tza_cereals,tza_cereals_vul)

write.csv(tza_vul_cereals_final,"tza_vul_cereals_final.csv")


##SOUTH SUDAN PHARMACEUTICALS
hhicr5vul_ssud_pharm<- hhicr5_ssud_pharms[1:5,]

ssud_pharm_vul<- all_final[all_final$ISO3 %in% c("SWE","KEN","NLD","PAK","CHE"),]

colnames(ssud_pharm_vul)[2]<-"Exporters"

ssud_vul_pharm_final<-merge(hhicr5vul_ssud_pharm,ssud_pharm_vul)

write.csv(ssud_vul_pharm_final,"ssud_vul_pharm_final.csv")

###SOUTH SUDAN CEREALS

hhicr5vul_ssud_cereals<- hhicr5_ssud[1:5,]

ssud_cereals_vul<- all_final[all_final$ISO3 %in% c("UGA","KEN","CHN","PAK","USA"),]
colnames(ssud_cereals_vul)[2]<-"Exporters"

ssud_vul_cereals_final<-merge(hhicr5vul_ssud_cereals,ssud_cereals_vul)

write.csv(ssud_vul_cereals_final,"ssud_vul_cereals_final.csv")

###BURUNDI PHARMACEUTICALS
hhicr5vul_bur_pharm<- hhicr5_bur_pharms[1:5,]

bur_pharm_vul<- all_final[all_final$ISO3 %in% c("BEL","CHN","DNK","FRA","IND"),]

colnames(bur_pharm_vul)[2]<-"Exporters"

bur_vul_pharm_final<-merge(hhicr5vul_bur_pharm,bur_pharm_vul)

write.csv(bur_vul_pharm_final,"bur_vul_pharm_final.csv")

###BURUNDI CEREALS
hhicr5vul_bur_cereals<- hhicr5_bur[1:5,]

bur_cereals_vul<- all_final[all_final$ISO3 %in% c("CHN","IND","RUS","TZA","GBR"),]
colnames(bur_cereals_vul)[2]<-"Exporters"

bur_vul_cereals_final<-merge(hhicr5vul_bur_cereals,bur_cereals_vul)

write.csv(bur_vul_cereals_final,"bur_vul_cereals_final.csv")

####RWANDA PHARMACEUTICALS
hhicr5vul_rwa_pharm<- hhicr5_rwa_pharms[1:5,]

rwa_pharm_vul<- all_final[all_final$ISO3 %in% c("BEL","KEN","DNK","IND","USA"),]

colnames(rwa_pharm_vul)[2]<-"Exporters"

rwa_vul_pharm_final<-merge(hhicr5vul_rwa_pharm,rwa_pharm_vul)

write.csv(rwa_vul_pharm_final,"rwa_vul_pharm_final.csv")

####RWANDA CEREALS
hhicr5vul_rwa_cereals<- hhicr5_rwa[1:5,]

rwa_cereals_vul<- all_final[all_final$ISO3 %in% c("PAK","TZA","RUS","UGA","THA"),]
colnames(rwa_cereals_vul)[2]<-"Exporters"

rwa_vul_cereals_final<-merge(hhicr5vul_rwa_cereals,rwa_cereals_vul)

write.csv(rwa_vul_cereals_final,"rwa_vul_cereals_final.csv")



######################################################################################################################################

#######GDP ANALYSIS## Data source## World Development Indicators## Last updated 4/9/2020
gdp <-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/API_NY.GDP.MKTP.CD_DS2_en_csv_v2_936013/API_NY.GDP.csv")
gdp_exporting <-gdp[gdp$Country_Code %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI"),c(1:3,63)]


#######HDI and MPI (Multidimensional Poverty Index) ANALYSIS
hdi<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Human Development Index (HDI).csv")
hdi_exporting<-hdi[hdi$ISO3 %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI"),c(1:3, 32)]


#######CPIA Scores### Country Policy and Instituional Assessment###only world bank borrowing countries

cpia<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Data_Extract_From_Country_Policy_and_Institutional_Assessment/CPIA.csv")
####Change manually all .. to NA
cpia$ave20142018 <-rowMeans(cpia[,14:18],na.rm = TRUE)
 
cpia_indicators_EAC<-cpia[cpia$Country_Code %in% c("KEN","SSD","UGA","RWA","TZA","BDI"),c(1:3,19)]
write.csv(cpia_indicators_EAC,"cpia_indicators_EAC.csv")

cpia20142018 <-cpia%>%
  group_by(Country_Code)%>%
  summarise(cpiacountry=mean(ave20142018))
  
cpia_importing <-cpia20142018[cpia20142018$Country_Code %in% c("NLD","CHE","UKR","ARG","AUS","BEL","CAN","CHN","DNK","FRA","DEU","IND","KEN","PAK","RUS","SSD","GBR","THA","UGA","USA","ZMB","RWA","TZA","BDI","SWE"),]


write.csv(cpia_importing, file = "cpia_importing.csv")



########MARKET DYNAMICS CEREALS###Herfindahl-Hirschman Index(HHI)# measure of market concentration###US DOLLAR THOUSAND
#########KENYA
kenya_cerealsimports <-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_supplying_markets_for_CEREALS_imported_by_Kenya .csv")
kenya_cerealsimports$ave_kenya_cereal_imports<- rowMeans(kenya_cerealsimports[,7:11]) 
kenya_cerealsimports<-kenya_cerealsimports[order(-kenya_cerealsimports$ave_kenya_cereal_imports),]
kenya_cerealsimports<- kenya_cerealsimports[-1,] ##remove world imports
total_ke<-sum(kenya_cerealsimports$ave_kenya_cereal_imports)
 kenya_cerealsimports$kenya_share<- kenya_cerealsimports$ave_kenya_cereal_imports/total_ke
 kenya_cerealsimports$points_100<-kenya_cerealsimports$kenya_share*100
 kenya_cerealsimports$square<- kenya_cerealsimports$points_100^2
 hhiall_ke_cereals<-sum(kenya_cerealsimports$square)
 
 write.csv(kenya_cerealsimports,file = "kenya_cerealsimports.csv")

  cr5_ke <-kenya_cerealsimports[c(1:5),c(1,13)]
  hhi_ke<- kenya_cerealsimports[c(1:5),c(1,14)]
  hhicr5_ke<-merge(cr5_ke,hhi_ke)
 
  hhicr5_ke <-  hhicr5_ke %>%
    bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))

#####UGANDA
  uganda_cerealsimports <-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_supplying_markets_for_CEREALS_imported_by_Uganda.csv")
                                  
  uganda_cerealsimports$ave_uganda_cereal_imports<- rowMeans(uganda_cerealsimports[,7:11]) 
  uganda_cerealsimports<-uganda_cerealsimports[order(-uganda_cerealsimports$ave_uganda_cereal_imports),]
  uganda_cerealsimports<- uganda_cerealsimports[-1,] ##remove world imports
  total_ug<-sum(uganda_cerealsimports$ave_uganda_cereal_imports)
  uganda_cerealsimports$uganda_share<- uganda_cerealsimports$ave_uganda_cereal_imports/total_ug
  uganda_cerealsimports$points_100<-uganda_cerealsimports$uganda_share*100
  
  uganda_cerealsimports$square<- uganda_cerealsimports$points_100^2
 
  hhiall_ug_cereals<-sum(uganda_cerealsimports$square) 
  
  cr5_ug <-uganda_cerealsimports[c(1:5),c(1,13)]
  hhi_ug<- uganda_cerealsimports[c(1:5),c(1,14)]
  hhicr5_ug<-merge(cr5_ug,hhi_ug)
  
  hhicr5_ug <-  hhicr5_ug %>%
    bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))
  
#######TANZANIA
  
  tanzania_cerealsimports <-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_supplying_markets_for_CEREALS_imported_by_Tanzania.csv")
  
  tanzania_cerealsimports$ave_tanzania_cereal_imports<- rowMeans(tanzania_cerealsimports[,7:11]) 
  tanzania_cerealsimports<-tanzania_cerealsimports[order(-tanzania_cerealsimports$ave_tanzania_cereal_imports),]
  tanzania_cerealsimports<- tanzania_cerealsimports[-1,] ##remove world imports
  total_tza<-sum(tanzania_cerealsimports$ave_tanzania_cereal_imports)
  tanzania_cerealsimports$tanzania_share<- tanzania_cerealsimports$ave_tanzania_cereal_imports/total_tza
  tanzania_cerealsimports$points_100<-tanzania_cerealsimports$tanzania_share*100
  
  tanzania_cerealsimports$square<- tanzania_cerealsimports$points_100^2
  
  hhiall_tza_cereals<-sum(tanzania_cerealsimports$square) 
  
  cr5_tza <-tanzania_cerealsimports[c(1:5),c(1,13)]
  hhi_tza<- tanzania_cerealsimports[c(1:5),c(1,14)]
  hhicr5_tza<-merge(cr5_tza,hhi_tza)
  
  hhicr5_tza <-  hhicr5_tza %>%
    bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))

###### RWANDA
  rwanda_cerealsimports<-  read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_supplying_markets_for_CEREALS_imported_by_Rwanda.csv")

  rwanda_cerealsimports$ave_rwanda_cereal_imports<- rowMeans(rwanda_cerealsimports[,7:11]) 
  rwanda_cerealsimports<-rwanda_cerealsimports[order(-rwanda_cerealsimports$ave_rwanda_cereal_imports),]
  rwanda_cerealsimports<- rwanda_cerealsimports[-1,] ##remove world imports
  total_rwa<-sum(rwanda_cerealsimports$ave_rwanda_cereal_imports)
  rwanda_cerealsimports$rwanda_share<- rwanda_cerealsimports$ave_rwanda_cereal_imports/total_rwa
  
  rwanda_cerealsimports$points_100 <- rwanda_cerealsimports$rwanda_share*100
  
  rwanda_cerealsimports$square<- rwanda_cerealsimports$points_100^2
  
  hhiall_rwa_cereals<-sum(rwanda_cerealsimports$square)
  
  cr5_rwa <-rwanda_cerealsimports[c(1:5),c(1,13)]
  hhi_rwa <- rwanda_cerealsimports[c(1:5),c(1,14)]
  hhicr5_rwa<-merge(cr5_rwa,hhi_rwa)
  
  hhicr5_rwa <-  hhicr5_rwa %>%
    bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))
  
#####BURUNDI
burundi_cerealsimports<-  read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_supplying_markets_for_CEREALS_imported_by_Burundi.csv")

burundi_cerealsimports$ave_burundi_cereal_imports<- rowMeans(burundi_cerealsimports[,7:11]) 
burundi_cerealsimports<-burundi_cerealsimports[order(-burundi_cerealsimports$ave_burundi_cereal_imports),]
burundi_cerealsimports<- burundi_cerealsimports[-1,] ##remove world imports
total_bur<-sum(burundi_cerealsimports$ave_burundi_cereal_imports)
burundi_cerealsimports$burundi_share<- burundi_cerealsimports$ave_burundi_cereal_imports/total_bur
burundi_cerealsimports$points_100<-burundi_cerealsimports$burundi_share*100

burundi_cerealsimports$square<- burundi_cerealsimports$points_100^2

hhiall_bur_cereals<-sum(burundi_cerealsimports$square)

cr5_bur <-burundi_cerealsimports[c(1:5),c(1,13)]
hhi_bur <- burundi_cerealsimports[c(1:5),c(1,14)]
hhicr5_bur<-merge(cr5_bur,hhi_bur)

hhicr5_bur <-  hhicr5_bur %>%
  bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))

####SOUTH SUDAN

ssudan_cerealsimports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_supplying_markets_for_CEREALS_imported_by_ssudan.csv")

ssudan_cerealsimports[ssudan_cerealsimports == 0] <- NA

ssudan_cerealsimports$ave_ssudan_cereal_imports<- rowMeans(ssudan_cerealsimports[,7:11], na.rm = TRUE )

ssudan_cerealsimports<-ssudan_cerealsimports[order(-ssudan_cerealsimports$ave_ssudan_cereal_imports),]
ssudan_cerealsimports<- ssudan_cerealsimports[-1,] ##remove totals row
total_ssud<-sum(ssudan_cerealsimports$ave_ssudan_cereal_imports)
ssudan_cerealsimports$ssudan_share<- ssudan_cerealsimports$ave_ssudan_cereal_imports/total_ssud
ssudan_cerealsimports$points_100<-ssudan_cerealsimports$ssudan_share*100

ssudan_cerealsimports$square<- ssudan_cerealsimports$points_100^2

hhiall_ssudan_cereals<-sum(ssudan_cerealsimports$square)


cr5_ssud <-ssudan_cerealsimports[c(1:5),c(1,13)]
hhi_ssud <- ssudan_cerealsimports[c(1:5),c(1,14)]
hhicr5_ssud<-merge(cr5_ssud,hhi_ssud)

hhicr5_ssud <-  hhicr5_ssud %>%
  bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))

########MARKET DYNAMICS PHARMACEUTICALS###Herfindahl-Hirschman Index(HHI)# measure of market concentration###US DOLLAR THOUSAND
#########KENYA
kenya_pharmsimports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_supplying_markets_for_PHARM_imported_by_Kenya.csv")

kenya_pharmsimports$ave_kenya_pharm_imports<- rowMeans(kenya_pharmsimports[,7:11]) 
kenya_pharmsimports<-kenya_pharmsimports[order(-kenya_pharmsimports$ave_kenya_pharm_imports),]
kenya_pharmsimports<- kenya_pharmsimports[-1,] ##remove world imports
total_ke_pharms<-sum(kenya_pharmsimports$ave_kenya_pharm_imports)
kenya_pharmsimports$kenya_share_pharms<- kenya_pharmsimports$ave_kenya_pharm_imports/total_ke_pharms
kenya_pharmsimports$points_100<- kenya_pharmsimports$kenya_share_pharms*100

kenya_pharmsimports$square_pharms<- kenya_pharmsimports$points_100^2

hhiall_ke_pharms<-sum(kenya_pharmsimports$square_pharms)

cr5_ke_pharms <-kenya_pharmsimports[c(1:5),c(1,13)]
hhi_ke_pharms<- kenya_pharmsimports[c(1:5),c(1,14)]
hhicr5_ke_pharms<-merge(cr5_ke_pharms,hhi_ke_pharms)

hhicr5_ke_pharms <-  hhicr5_ke_pharms %>%
  bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))


#####UGANDA PHARMS
uganda_pharmsimports <- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_supplying_markets_for_PHARM_imported_by_Uganda.csv")
uganda_pharmsimports$ave_uganda_pharm_imports<- rowMeans(uganda_pharmsimports[,7:11]) 
uganda_pharmsimports<-uganda_pharmsimports[order(-uganda_pharmsimports$ave_uganda_pharm_imports),]
uganda_pharmsimports<- uganda_pharmsimports[-1,] ##remove world imports
total_ug_pharms<-sum(uganda_pharmsimports$ave_uganda_pharm_imports)
uganda_pharmsimports$uganda_share_pharms<- uganda_pharmsimports$ave_uganda_pharm_imports/total_ug_pharms

uganda_pharmsimports$points_100<-uganda_pharmsimports$uganda_share_pharms*100
uganda_pharmsimports$square_pharms_ug<- uganda_pharmsimports$points_100^2

hhiall_ug_pharms<-sum(uganda_pharmsimports$square_pharms_ug)

cr5_ug_pharms <-uganda_pharmsimports[c(1:5),c(1,13)]
hhi_ug_pharms<- uganda_pharmsimports[c(1:5),c(1,14)]
hhicr5_ug_pharms<-merge(cr5_ug_pharms,hhi_ug_pharms)

hhicr5_ug_pharms <-  hhicr5_ug_pharms %>%
  bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))


###RWANDA PHARMS
rwanda_pharmsimports <- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_supplying_markets_for_PHARM_imported_by_Rwanda.csv")
rwanda_pharmsimports$ave_rwanda_pharm_imports<- rowMeans(rwanda_pharmsimports[,7:11]) 
rwanda_pharmsimports<-rwanda_pharmsimports[order(-rwanda_pharmsimports$ave_rwanda_pharm_imports),]
rwanda_pharmsimports<- rwanda_pharmsimports[-1,] ##remove world imports
total_rwa_pharms<-sum(rwanda_pharmsimports$ave_rwanda_pharm_imports)
rwanda_pharmsimports$rwanda_share_pharms<- rwanda_pharmsimports$ave_rwanda_pharm_imports/total_rwa_pharms

rwanda_pharmsimports$points_100<-rwanda_pharmsimports$rwanda_share_pharms*100
rwanda_pharmsimports$square_pharms_rwa<- rwanda_pharmsimports$points_100^2


hhiall_rwa_pharms<-sum(rwanda_pharmsimports$square_pharms_rwa)

cr5_rwa_pharms <-rwanda_pharmsimports[c(1:5),c(1,13)]
hhi_rwa_pharms<- rwanda_pharmsimports[c(1:5),c(1,14)]
hhicr5_rwa_pharms<-merge(cr5_rwa_pharms,hhi_rwa_pharms)

hhicr5_rwa_pharms <-  hhicr5_rwa_pharms %>%
  bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))


######TANZANIA PHARMS

tanzania_pharmsimports <- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_supplying_markets_for_PHARM_imported_by_Tanzania.csv") 

tanzania_pharmsimports$ave_tanzania_pharm_imports<- rowMeans(tanzania_pharmsimports[,7:11]) 
tanzania_pharmsimports<-tanzania_pharmsimports[order(-tanzania_pharmsimports$ave_tanzania_pharm_imports),]
tanzania_pharmsimports<- tanzania_pharmsimports[-1,] ##remove world imports
total_tza_pharms<-sum(tanzania_pharmsimports$ave_tanzania_pharm_imports)
tanzania_pharmsimports$tanzania_share_pharms<- tanzania_pharmsimports$ave_tanzania_pharm_imports/total_tza_pharms
tanzania_pharmsimports$points_100<-tanzania_pharmsimports$tanzania_share_pharms*100

tanzania_pharmsimports$square_pharms_tza<- tanzania_pharmsimports$points^2

hhiall_tza_pharms<-sum(tanzania_pharmsimports$square_pharms_tza)

cr5_tza_pharms <-tanzania_pharmsimports[c(1:5),c(1,13)]
hhi_tza_pharms<- tanzania_pharmsimports[c(1:5),c(1,14)]
hhicr5_tza_pharms<-merge(cr5_tza_pharms,hhi_tza_pharms)

hhicr5_tza_pharms <-  hhicr5_tza_pharms %>%
  bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))

###BURUNDI PHARMS
burundi_pharmsimports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_supplying_markets_for_PHARM_imported_by_Burundi.csv")

burundi_pharmsimports$ave_burundi_pharm_imports<- rowMeans(burundi_pharmsimports[,7:11]) 
burundi_pharmsimports<-burundi_pharmsimports[order(-burundi_pharmsimports$ave_burundi_pharm_imports),]
burundi_pharmsimports<- burundi_pharmsimports[-1,] ##remove world imports
total_bur_pharms<-sum(burundi_pharmsimports$ave_burundi_pharm_imports)
burundi_pharmsimports$burundi_share_pharms<- burundi_pharmsimports$ave_burundi_pharm_imports/total_bur_pharms
burundi_pharmsimports$points_100<-burundi_pharmsimports$burundi_share_pharms*100

burundi_pharmsimports$square_pharms_bur<- burundi_pharmsimports$points_100^2
hhiall_bur_pharms<-sum(burundi_pharmsimports$square_pharms_bur)


cr5_bur_pharms <-burundi_pharmsimports[c(1:5),c(1,13)]
hhi_bur_pharms<- burundi_pharmsimports[c(1:5),c(1,14)]
hhicr5_bur_pharms<-merge(cr5_bur_pharms,hhi_bur_pharms)

hhicr5_bur_pharms <-  hhicr5_bur_pharms %>%
  bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))


###SOUTH SUDAN PHARMS
ssudan_pharmsimports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_supplying_markets_for_PHARM_imported_by_SSudan.csv")

ssudan_pharmsimports[ssudan_pharmsimports == 0] <- NA

ssudan_pharmsimports$ave_ssudan_pharm_imports<- rowMeans(ssudan_pharmsimports[,7:11], na.rm = TRUE )


ssudan_pharmsimports<-ssudan_pharmsimports[order(-ssudan_pharmsimports$ave_ssudan_pharm_imports,na.last=NA),]
ssudan_pharmsimports<- ssudan_pharmsimports[-1,] ##remove totals row
total_ssud_pharm<-sum(ssudan_pharmsimports$ave_ssudan_pharm_imports)
ssudan_pharmsimports$ssudan_share_pharms<- ssudan_pharmsimports$ave_ssudan_pharm_imports/total_ssud_pharm
ssudan_pharmsimports$square_pharms_ssud<- ssudan_pharmsimports$ssudan_share_pharms^2

cr5_ssud_pharms <-ssudan_pharmsimports[c(1:5),c(1,13)]
hhi_ssud_pharms <- ssudan_pharmsimports[c(1:5),c(1,14)]
hhicr5_ssud_pharms<-merge(cr5_ssud_pharms,hhi_ssud_pharms)

hhicr5_ssud_pharms <-  hhicr5_ssud_pharms %>%
  bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))

#######ALL COUNTRIES EXPORTING PARTNER ANALYSIS-CEREALS
exporting_partners_cereals<- list(kenya_cerealsimports,uganda_cerealsimports, rwanda_cerealsimports,burundi_cerealsimports,ssudan_cerealsimports,tanzania_cerealsimports) %>%
 reduce(full_join, by ="Exporters")
exporting_partners_cereals <-exporting_partners_cereals[,c(1,12,25,38,51,64,77)]
 exporting_partners_cereals$total <- rowSums(exporting_partners_cereals[,-1],na.rm = TRUE)
 exporting_partners_cereals$averageforpartners <- rowMeans(exporting_partners_cereals[,-1],na.rm = TRUE)
 exporting_partners_cereals <- exporting_partners_cereals[order(-exporting_partners_cereals$total),]
 write.csv(exporting_partners_cereals,file = "exporting_partners_cereals.csv")
 
 #######ALL COUNTRIES EXPORTING PARTNER ANALYSIS-PHARMACEUTICALS
exporting_partners_pharms<- list(kenya_pharmsimports,uganda_pharmsimports,rwanda_pharmsimports,burundi_pharmsimports,ssudan_pharmsimports,tanzania_pharmsimports) %>%
reduce(full_join, by ="Exporters") 
exporting_partners_pharms <-exporting_partners_pharms[,c(1,12,25,38,51,64,77)]
exporting_partners_pharms$total <- rowSums(exporting_partners_pharms[,-1],na.rm = TRUE)
exporting_partners_pharms$averageforpartners <- rowMeans(exporting_partners_pharms[,-1],na.rm = TRUE)
exporting_partners_pharms <- exporting_partners_pharms[order(-exporting_partners_pharms$total),]
write.csv(exporting_partners_pharms,file = "exporting_partners_pharms.csv")
 
 
######INDIVIDUAL EAC COUNTRY PARTNERS DIVERSIFICATION

hhicr5_all_cereals<- list(hhicr5_ssud,hhicr5_bur,hhicr5_rwa,hhicr5_ke,hhicr5_tza,hhicr5_ug) %>% 
  reduce(full_join, by ="Exporters")
write.csv(hhicr5_all_cereals,file = "hhicr5_all_cereals.csv")

hhicr5_all_pharms<- list(hhicr5_ssud_pharms,hhicr5_bur_pharms,hhicr5_rwa_pharms,hhicr5_ke_pharms,hhicr5_tza_pharms,hhicr5_ug_pharms)%>% 
  reduce(full_join, by ="Exporters")
write.csv(hhicr5_all_pharms,file = "hhicr5_all_pharms.csv")

############EXPORT IMPORT DYNAMICS
############UGANDA
ug_cereals_imports<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_Cereals_imported_by_Uganda.csv")
ug_cereals_exports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_Cereals_exported_by_Uganda.csv")

ug_cereals_imports$average_cereal_imports<- rowMeans(ug_cereals_imports[7:11])
ug_cereals_exports$average_cereal_exports<- rowMeans(ug_cereals_exports[7:11])

ug_cereals_imports<-ug_cereals_imports[order(-ug_cereals_imports$average_cereal_imports),]
ug_cereals_imports<- ug_cereals_imports[,c(1,2,13)]

ug_cereals_exports<-ug_cereals_exports[order(-ug_cereals_exports$average_cereal_exports),]
ug_cereals_exports<- ug_cereals_exports[,c(1,2,13)]

ug_cereals_merge<-merge(ug_cereals_exports,ug_cereals_imports)

ug_cereals_merge$sumexportsmports<-rowSums(ug_cereals_merge[3:4])


ug_cereals_merge <-  ug_cereals_merge %>%
  bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))

ug_cereals_merge<-ug_cereals_merge[order(-ug_cereals_merge$sumexportsmports),]

############EXPORT IMPORT DYNAMICS
############TANZANIA

tza_cereals_imports<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_Cereals_imported_by_Tanzania.csv")
tza_cereals_exports<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_Cereals_exported_by_Tanzania.csv")

tza_cereals_imports$average_cereal_imports<- rowMeans(tza_cereals_imports[7:11])
tza_cereals_exports$average_cereal_exports<- rowMeans(tza_cereals_exports[7:11])

tza_cereals_imports<-tza_cereals_imports[order(-tza_cereals_imports$average_cereal_imports),]
tza_cereals_imports<- tza_cereals_imports[,c(1,2,13)]

tza_cereals_exports<-tza_cereals_exports[order(-tza_cereals_exports$average_cereal_exports),]
tza_cereals_exports<- tza_cereals_exports[,c(1,2,13)]

tza_cereals_merge<-merge(tza_cereals_exports,tza_cereals_imports)

tza_cereals_merge$sumexportsmports<-rowSums(tza_cereals_merge[3:4])


tza_cereals_merge <-  tza_cereals_merge %>%
  bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))

tza_cereals_merge<-tza_cereals_merge[order(-tza_cereals_merge$sumexportsmports),]


############EXPORT IMPORT DYNAMICS
############KENYA
ke_cereals_imports<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_Cereals_imported_by_Kenya.csv")
ke_cereals_exports<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_Cereals_exported_by_Kenya.csv")

ke_cereals_imports$average_cereal_imports<- rowMeans(ke_cereals_imports[7:11])
ke_cereals_exports$average_cereal_exports<- rowMeans(ke_cereals_exports[7:11])

ke_cereals_imports<-ke_cereals_imports[order(-ke_cereals_imports$average_cereal_imports),]
ke_cereals_imports<- ke_cereals_imports[,c(1,2,13)]

ke_cereals_exports<-ke_cereals_exports[order(-ke_cereals_exports$average_cereal_exports),]
ke_cereals_exports<- ke_cereals_exports[,c(1,2,13)]

ke_cereals_merge<-merge(ke_cereals_exports,ke_cereals_imports)

ke_cereals_merge$sumexportsmports<-rowSums(ke_cereals_merge[3:4])


ke_cereals_merge <-  ke_cereals_merge %>%
  bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))

ke_cereals_merge<-ke_cereals_merge[order(-ke_cereals_merge$sumexportsmports),]

############EXPORT IMPORT DYNAMICS
############RWANDA
rwa_cereals_imports<- read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_Cereals_imported_by_Rwanda.csv")
rwa_cereals_exports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_Cereals_exported_by_Rwanda.csv")
rwa_cereals_imports$average_cereal_imports<- rowMeans(rwa_cereals_imports[7:11])
rwa_cereals_exports$average_cereal_exports<- rowMeans(rwa_cereals_exports[7:11])

rwa_cereals_imports<-rwa_cereals_imports[order(-rwa_cereals_imports$average_cereal_imports),]
rwa_cereals_imports<- rwa_cereals_imports[,c(1,2,13)]

rwa_cereals_exports<-rwa_cereals_exports[order(-rwa_cereals_exports$average_cereal_exports),]
rwa_cereals_exports<- rwa_cereals_exports[,c(1,2,13)]

rwa_cereals_merge<-merge(rwa_cereals_exports,rwa_cereals_imports)

rwa_cereals_merge$sumexportsmports<-rowSums(rwa_cereals_merge[3:4])


rwa_cereals_merge <-  rwa_cereals_merge %>%
  bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))

rwa_cereals_merge<-rwa_cereals_merge[order(-rwa_cereals_merge$sumexportsmports),]


############EXPORT IMPORT DYNAMICS
############BURUNDI
bur_cereals_imports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_Cereals_imported_by_Burundi.csv")
bur_cereals_exports<-read.csv("C:/Users/TABBY/OneDrive - Central European University/Documents/OneDrive - Central European University/Documents/Class Assignments and notes/Thesis/Trade Analysis/Trade Analysis 2/Trade_Map_List_of_Cereals_exported_by_Burundi.csv")

bur_cereals_imports$average_cereal_imports<- rowMeans(bur_cereals_imports[7:11])
bur_cereals_exports$average_cereal_exports<- rowMeans(bur_cereals_exports[7:11])

bur_cereals_imports<-bur_cereals_imports[order(-bur_cereals_imports$average_cereal_imports),]
bur_cereals_imports<- bur_cereals_imports[,c(1,2,13)]

bur_cereals_exports<-bur_cereals_exports[order(-bur_cereals_exports$average_cereal_exports),]
bur_cereals_exports<- bur_cereals_exports[,c(1,2,13)]

bur_cereals_merge<-merge(bur_cereals_exports,bur_cereals_imports)

bur_cereals_merge$sumexportsmports<-rowSums(bur_cereals_merge[3:4])


bur_cereals_merge <-  bur_cereals_merge %>%
  bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(.) else "Total")))

bur_cereals_merge<-bur_cereals_merge[order(-bur_cereals_merge$sumexportsmports),]

############EXPORT IMPORT DYNAMICS
############sOUTH SUDAN


