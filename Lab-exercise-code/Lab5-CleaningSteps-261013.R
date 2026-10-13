

names(brewhaus) <- gsub("\\.", "_", names(brewhaus))
dim(brewhaus)

!duplicated(brewhaus)
dim(unique(brewhaus))
brewhaus_unique <- brewhaus[!duplicated(brewhaus), ]