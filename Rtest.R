
#d�finition du r�p�rtoire de travail
setwd("D:/TEST")

#importation des donn�es dans R
testdata <- read.csv("Exported.csv", header= TRUE, sep = ",", quote = "\"", dec = ".")

#appel du data
head(testdata)

#ANONYMISATION DES DONNEES
# packages utilis�s
library(dplyr)
library(digest)

cols_to_mask <- "NOM_ENQUETE_CHR "

#fonction d'anonymisation
anonymize <- function(x, algo="crc32") {
  sapply(x, function(y) if(y == "" | is.na(y)) "" else digest(y, algo = algo))
}
library(data.table, lib.loc="~/R/win-library/4.0")
testdata1 <- copy(testdata)

setDT(testdata)

#pour reconnaitre les valeurs NA
testdata1<- fread("D:/TEST/Exported.csv", fill=TRUE)
var <-  names(testdata)[unlist(lapply(testdata, is.character))]
testdata[, lapply(.SD, function(x) sum(is.na(x))), .SDcols = var]

#classe POSIXct
library(lubridate)
testdata1$DATE1 <- dmy(testdata1$DATE)
str(testdata1$DATE1)
#testdata1$DATE1 <- as.POSIXct(testdata1$DATE,  format = "%d/%m/%Y")

#mois et ann�e
testdata1 <- testdata1 %>%
  arrange(testdata1$DATE1) %>%
  mutate(ann�e=year(testdata1$DATE1),
         mois=month(testdata1$DATE1)
  )

#taux d'utilisation
testdata1$Q1_SOURCE_ECLAIRAGE_SINGLE_FCT_1
effectif=table(testdata1$Q1_SOURCE_ECLAIRAGE_SINGLE_FCT_1)+table(testdata1$Q1_SOURCE_ECLAIRAGE_SINGLE_FCT_2)
taux_utilisation= effectif/sum(effectif)

#cout moyen de source d'�clairage
mean(testdata1$Q1_COUT_MENSUEL_CONSOMMATION_NUM_1)

#moyenne etl'�cart-type de toutes les variables de type num�rique
library(data.table)
DT= data.table(testdata1)
DT[,sapply(.SD, function(y)list(mean=mean(y), sd=sd(y)))]


