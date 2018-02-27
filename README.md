# Reco_rate

## To run the reco rate for Chr 1 (AHR2a/1a)
## Uses K.Broman's 'xio' package

#posit.mb <- as.numeric(gsub('1:','',markernames(GP, chr=1)))/1000000
#marks <- markernames(GP, chr=1)
#names(posit.mb) <- marks
#chr1 <- map2table(pull.map(GP,chr=1))
#write.table(data.frame(chr=chr1[marks,1],cm.pos=chr1[marks,2],mb.pos=posit.mb[marks]),
#	file='/home/jmiller1/reco_rates/CRH1_table.r', sep=',')

## First, download 'CRH1_table.r' from

install.packages('xio')

require('xio')

dir <- "copy the location of the file here"
#exe: "/Users/jeffreymiller/Downloads/"

chr1 <- read.table(paste(dir,'CRH1_table.r',sep=''), sep=',')

## usage: est.recrate(genmap, phymap, pos, window = 5)

## Set the window size for calculating recombination rate
window <- 5 

est.recrate(chr1$cm.pos,chr1$mb.pos,window=window)

