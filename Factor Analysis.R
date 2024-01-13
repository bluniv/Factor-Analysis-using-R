#let's import necessary packages
library(psych)
library(dplyr)

#let's import our dataset
data=read.csv(file.choose(),header=TRUE)
data

#we will check for missing values in our data
is.null(data)

#this will provide us the name of all the columns in the data
names(data)

KMO(data)
#The KMO function in the psych package produces an overall measure of sampling adequacy and MSA for each item.
#The overall KMO for data is 0.78, which is acceptable and this suggest that data is appropriate for factor analysis.

cortest.bartlett(data)
#Here the p value we get is very close to 0
#In Bartlett’s Test the value obtained should be less than 0.05 
#So we can say that the Bartlett’s Test is statistically significant and we can proceed for Factor Analysis.

scree(data)
#We plot a Scree plot to check how many factors to retain
#Here 3 factors have eigen value greater than 1 
#so based on eigen value criterion we decide to take 3 factors

pca=pca(data,nfactors=3,rotate="varimax")
pca
print(pca$loadings,cutoff=0.5,sort=TRUE)
colnames(pca$loadings)=c('Personality','Qualification','Looks')
print(pca$loadings,cutoff=0.5,sort=TRUE)
#We retained 3 factors
#The first factor is something that is common to Dependable, Honest, Reliable, Trust-worthy, sincere & expert. 
#It seems like a good name for this factor is “Personality” 
#The other two factors can be named as “Qualification” & “Looks”.
fa.diagram(pca)

#Conclusion:
#Celebrity personality, qualification and looks are the three major qualities that have the greatest impact on advertising firms.
#When hiring celebrities to endorse items, the advertising industry should take into consideration these three elements.
