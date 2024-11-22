
library(ChIPseeker)
library(TxDb.Celegans.UCSC.ce11.refGene)
txdb <- TxDb.Celegans.UCSC.ce11.refGene
library(clusterProfiler)

peak <- readPeakFile("narrowpeakfile_updated.bed.txt", header = TRUE)

#generates coverage over chrs
covplot(peak, weightCol = "score")

#to generate heatmap of peaks relative to TSS
promoter <- getPromoters(TxDb=txdb, upstream=5000, downstream=5000)
tagMatrix <- getTagMatrix(peak, windows=promoter)

#tagHeatmap(tagMatrix, xlim=c(-5000,5000), color="red") <---- this doesnt wrk
#below works.

tagHeatmap(tagMatrix) +  scale_fill_distiller(palette = "Reds")

#plotting profile and heatmap combo. #i previously used nbin 800 and it looks better nbin makes bins and makes the program go faster.


peak_Profile_Heatmap(peak = peak, upstream = 5000, downstream = 5000, by = "gene", type = "start_site", TxDb = txdb)
#peak_Profile_Heatmap(peak = peak, upstream = 5000, downstream = 5000, by = "gene", type = "start_site", TxDb = txdb, nbin = 100)


#to generate the meta-gene plot/ to plot the avg profile of chip peaks binding to TSS
library(ggplot2)

plotAvgProf(tagMatrix, xlim = c(-5000,5000),
            xlab="Genomic Region (5'->3')", ylab = "Read Count Frequency") +
  scale_x_continuous(breaks=seq(-5000,5000,1000))


#confidence interval estimated by bootstrap method is also supported...below

plotAvgProf(tagMatrix, xlim = c(-5000,5000), 
            xlab="Genomic Region (5'->3')", ylab = "Read Count Frequency", conf = 0.95, resample = 1000)  +
  scale_x_continuous(breaks=seq(-5000,5000,1000))

#to see region around tss in relation to binding (pickup here)
plotPeakProf2(peak = peak, upstream = rel(0.5), downstream = rel(0.5),
              conf = 0.95, by = "gene", type = "body", nbin = 100,
              TxDb = txdb, weightCol = "score",ignore_strand = F)
#peak annotation
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("org.Ce.eg.db")


apeakAnno <- annotatePeak(peak, tssRegion = c(-5000,5000),TxDb=txdb, annoDb = "org.Ce.eg.db")

plotAnnoPie(peakAnno)

plotAnnoBar(peakAnno)

vennpie(peakAnno)

upsetplot(peakAnno)

upsetplot(peakAnno, vennpie=TRUE)

plotDistToTSS(peakAnno, title = "Distribution of TF binding loci relative to TSS")

#trying GO enrichment

library(ReactomePA)

pathway1 <- enrichPathway( organism = "celegans", as.data.frame(peakAnno)$geneId)
head(pathway1, 2)

gene <- seq2gene(peak, tssRegion = c(-3000, 3000), flankDistance = 3000, TxDb=txdb)
pathway2 <- enrichPathway( organism = "celegans", gene)
head(pathway2, 2)

dotplot(pathway2)
