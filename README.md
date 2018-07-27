# Reco_rate

To calculate the reco rate along Chr 1 (AHR2a/1a)
Uses K.Broman's 'xoi' package

First, download 'CRH1_table.r' from [here](https://github.com/jthmiller/Reco_rate/blob/master/CRH1_table.r)

OR if you are EO: 'CH10_table.r' from [here on farm](http://farm.cse.ucdavis.edu/~jmiller1/CRH10_table.r)


In R:

```R
install.packages('xoi')

require('xoi')

dir <- "copy the location of the file here"

#exe: "/Users/jeffreymiller/Downloads/"

chr1 <- read.table(paste(dir,'CRH1_table.r',sep=''),
          sep=',')

#usage: est.recrate(genmap, phymap, pos, window = 5)

#Set the window size for calculating recombination rate
window <- 5

est.recrate(chr1$cm.pos,chr1$mb.pos,window=window)
```

I generated reco rate on 1 mb sliding window [here](https://github.com/jthmiller/Reco_rate/blob/master/CRH1_1mb_window.r)
```R
mb_1 <- est.recrate(chr1$cm.pos,chr1$mb.pos,window=1)

write.table(mb_1,
  file='/home/jmiller1/reco_rates/CRH1_1mb_window.r',
  sep=',')
```


How I generated the table. Not useful:
```R
posit.mb <- as.numeric(gsub('1:','',markernames(GP, chr=1)))/1000000
marks <- markernames(GP, chr=1)
names(posit.mb) <- marks
chr1 <- map2table(pull.map(GP,chr=1))
write.table(data.frame(chr=chr1[marks,1],
  cm.pos=chr1[marks,2],
  mb.pos=posit.mb[marks]),
  file='/home/jmiller1/reco_rates/CRH1_table.r',
  sep=',')
```
