# Reco_rate
install.packages('xoi')
require('xoi')
dir <- "/home/jmiller1/reco_rates/tables/"
plotdir <- "/home/jmiller1/reco_rates/plots/"
#Set the window (MB) size for calculating recombination rate
window <- 1
#load('/home/jmiller1/QTL_Map_Raw/popgen/rQTL/NBH/plot.lod.profile')

plot.rate <- function(X){
  # Convert position to MB
  posit.mb <- as.numeric(gsub(paste(X,':',sep=''),'',markernames(GP, chr=X)))/1000000
  marks <- markernames(GP, chr=X)
  names(posit.mb) <- marks

  # rQTL function to convert the data structure to simple map table
  chr <- map2table(pull.map(GP,chr=X))

  # write a table for later use
  chr.rate <- data.frame(chr=chr[marks,1],
    cm.pos=chr[marks,2],
    mb.pos=posit.mb[marks])

  #write.table(chr.rate,
  #  file=paste(dir,'CHR',X,'CM_dist.csv',sep=''),
  #  sep=',')

  # Estimate recombination. 'Uses the physical marker positions plus a grid with 4 positions per Mbp.'
  rate <- est.recrate(chr.rate$cm.pos,chr.rate$mb.pos,window=window)
  #write.table(rate,
  #  file=paste(dir,'CHR',X,'_','per',window,'MB.csv',sep=''),
  #  sep=',')

  # Plot into plotdir
  #png(filename = paste(plotdir,'CHR',X,'_','per',window,'MB.png',sep=''))
  plot(rate$pos,rate$rate)
  #dev.off()
}

# Extremely high recombination on CHR10 marker at 29-30.5 CM, which
# is position 30134102 to 34335301
