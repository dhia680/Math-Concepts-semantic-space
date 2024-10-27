library(dplyr)
library(mirt)

d = read.csv("vocAnalyses/GRMData.csv", encoding='utf-8') %>% select(-SubID)

fitModel = mirt(data=d, itemtype='graded')

write.csv(fscores(fitModel), file="GRMsubjects.csv")
write.csv(coef(fitModel, IRTpars = TRUE, simplify = TRUE), file="GRMitems.csv")
write.csv(fitModel@Fit, file="GRMfit.csv")
