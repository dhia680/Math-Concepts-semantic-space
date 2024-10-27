library(dplyr)
library(mirt)

d = read.csv("vocAnalyses/IRTData.csv", encoding='utf-8') %>% select(-SubID)

fitModel = mirt(data=d, itemtype='2PL', optimizer='NR')

write.csv(fscores(fitModel), file="IRTsubjects.csv")
write.csv(coef(fitModel, IRTpars = TRUE, simplify = TRUE), file="IRTitems.csv")
write.csv(fitModel@Fit, file="IRTfit.csv")
