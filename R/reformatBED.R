## Organizing .bed file
## Need BED12 format

dm6 <- read.delim("dm6_refGenes.bed",header=F,as.is=T)

head(dm6)
summary(dm6)

#remove column names
new_dm6 <- dm6[-1,]

# Rearrange Columns

new_dm6 <- new_dm6[,c(3,7,8,9,4,12,5,6)]

head(new_dm6)

# Add RGB column
new_dm6$RGB <- "255,0,0"

new_dm6 <- cbind(new_dm6, dm6[,c(9,10,11)])

head(new_dm6)

# write out

write.table(new_dm6,"dm6_BED12.bed",col.names=F,row.names=F,sep="\t",quote=F)
