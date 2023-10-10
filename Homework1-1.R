getwd()
setwd('~/Downloads/SDS 313/')
bonds<- read.csv('Homework1_Bonds.csv')

#Question 1
(table(Homework1_Bonds$Result))
prop.table(table(Homework1_Bonds$Result))
table(Homework1_Bonds$Gov_Type)

table(Homework1_Bonds$Gov_Type,Homework1_Bonds$Result)
prop.table(table(Homework1_Bonds$Gov_Type,Homework1_Bonds$Result ))


#Question 2
total_sum <- sum(Homework1_Bonds$Votes_For, )
total_sum1 <- sum(Homework1_Bonds$Votes_Against)

Homework1_Bonds$Votes_Total <- Homework1_Bonds$Votes_For + Homework1_Bonds$Votes_Against

table(Homework1_Bonds$Purpose_Detail, Homework1_Bonds$Votes_Total)

#Question 3
subset_data_approved <- Homework1_Bonds[Homework1_Bonds$Votes_For > Homework1_Bonds$Votes_Against
                                        & Homework1_Bonds$Votes_Total > 10, ]


subset_data_approved$Approval_Percentage <- 
  (subset_data_approved$Votes_For / subset_data_approved$Votes_Total) * 100 #Used help from Chatgpt to understand how to create a subset

hist(subset_data_approved$Approval_Percentage,
     main = "Distribution of Approval Percentage",
     xlab = "Approval Percentage (%)",
     ylab = "Frequency",
     col = "grey",
     border = "black")

#Question 4
plot(subset_data_approved$Amount, 
     subset_data_approved$Approval_Percentage,
     xlab = "Bond Cost",
     ylab = "Approval Percentage (%)",
     main = "Relationship Between Bond Cost and Approval Percentage")

correlation <- cor(subset_data_approved$Amount, 
                   subset_data_approved$Approval_Percentage) #Used google for help to understand how to find correlation



