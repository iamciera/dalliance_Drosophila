## Organizing .bed file
## Need BED12 format

dm6 <- read.delim("../data/dm6_refGenes.bed",header=F,as.is=T)

head(dm6)
summary(dm6)

dm6[1,] # look at the names of the columns

#remove column names
new_dm6a <- dm6[-1,]

# Rearrange Columns

new_dm6b <- new_dm6a[,c(3,7,8,2,12,14,5,6)]

head(new_dm6b)

# Add RGB column
new_dm6b$RGB <- "255,0,0"

new_dm6c <- cbind(new_dm6b, new_dm6a[,c(16,10,11)])

head(new_dm6c)

# write out

write.table(new_dm6c,"dm6_BED12.bed",col.names=F,row.names=F,sep="\t",quote=F)
