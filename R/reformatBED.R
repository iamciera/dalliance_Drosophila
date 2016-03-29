## Organizing .bed file
## Need BED12 format

dm6 <- read.delim("../data/dm6_refGenes.bed",header=F,as.is=T)

head(dm6)
summary(dm6)

dm6[1,] # look at the names of the columns

#remove column names
new_dm6a <- dm6[-1,]

# Rearrange Columns

new_dm6b <- new_dm6a[,c(3,7,8,13)]
new_dm6b[,5] <- 1000
new_dm6b[,6] <- new_dm6a[,4]
new_dm6b[,7] <- 0
new_dm6b[,8] <- 0
new_dm6b[,9] <- "0,0,0"
new_dm6b[,10] <- 1
new_dm6b[,11] <- as.numeric(new_dm6b$V8) - as.numeric(new_dm6b$V7)
new_dm6b[,12] <- 0


dim(new_dm6b)
head(new_dm6b)

  #new_dm6b$thickStart <- new_dm6b$V7
#new_dm6b$thickEnd <- new_dm6b$V7

# Add RGB column
# new_dm6b$RGB <- "255,0,0"

# new_dm6b <- cbind(new_dm6b, new_dm6a[,c(9,10,11)])

# head(new_dm6c)
# dim(new_dm6c)

## Maybe it doesn't like the overlapping genes, 
## so you need only one entry per gene

new_dm6d <- new_dm6b[!duplicated(new_dm6b[3]), ]
dim(new_dm6d) # 18758, which seems about right, wikipedia says 15,682
head(new_dm6d)

new_dm6d <- new_dm6d[1:15000,] #got an error at around line 15528

write.table(new_dm6d,"../data/dm6_BED12.bed",col.names=F,row.names=F,sep="\t",quote=F)
