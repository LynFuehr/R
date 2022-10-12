#Set Work space
setwd("C:/R_Workspace")

#install read excel and Venn Diagram packages
install.packages("readxl")
install.packages("VennDiagram")
library(readxl)
library(VennDiagram)

#Load relevant datasheet
Sheet6_df <- read_excel("CCArchitecture.xlsx", sheet = 7)

#Define Variables in data frame
colnames(Sheet6_df) <- c("Genename" , "P" , "Trait" , "Phenotpye")

#extract relevant variables from data frame
GeneTrait_df <- Sheet6_df[ , c("Genename","Trait")]

#Create Surface Area and Thickness subsets and their lists for the Venn Diagram
SA_df <- subset(GeneTrait_df, subset =  Trait == "SA")
TH_df <- subset(GeneTrait_df, subset =  Trait == "TH")

SA_list <- SA_df$Genename
TH_list <- TH_df$Genename

#Define Venn Diagram
Venn <- venn.diagram(list(SA_list,TH_list),
                     category = c("Surface Area", "Thickness"),
                     fill = c("red", "green"),
                     filename=NULL
                     )
                     
#Draw Venn Diagram
grid.newpage()
grid.draw(Venn)
