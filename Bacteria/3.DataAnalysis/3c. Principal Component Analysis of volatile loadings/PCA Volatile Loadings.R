#Generation of PCA analysis for volatile loadings
mysamdata <- sample_data(data.frame(mynames = row.names(Volatile), myvar = rep(c(1,2), length(row.names(Volatile))/2), row.names = row.names(Volatile)))

myotutbl <- otu_table(as.matrix(Volatile), taxa_are_rows = FALSE)

volatile_ps <- phyloseq(otu_table = myotutbl
                        , sample_data = mysamdata
)

#PCA performance
ord.nmds.bray1000_vol <- ordinate(volatile_ps, method="RDA", distance="bray")

#PCA plot
##per stage
plot_ordination(volatile_ps, ord.nmds.bray1000_vol, label = "mynms", color="stage") +
  theme_bw() + geom_point(size = 4)

##per vinification
plot_ordination(volatile_ps, ord.nmds.bray1000_vol, label = "mynms", color="vinification") +
  theme_bw() + geom_point(size = 4)

# PCA loadings
myloadings <- scores(ord.nmds.bray1000_vol, display = "species", scaling = 0)
# loadings plot
plot(myloadings, type = "p", pch = 21, bg = "black")
text(myloadings, label = row.names(myloadings))