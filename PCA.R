#conducting PCA analysis

PCA <- prcomp(crime_data_subset_imputed_2)

PCA


#finding pca component with largest loading for crime rate



# Find the maximum loading value for the feature
max_loading <- max(PCA$rotation["ViolentCrimesPerPop",])


# Find the index of the principal component with the maximum loading value
max_pc <- which(PCA$rotation["ViolentCrimesPerPop",] == max_loading)



# Print the results
cat("The PC component with the largest loading value for feature_name is PC", max_pc, "with a loading value of", max_loading)

target <- PCA$rotation[,29:30]
#melting comp_df
melt_tardf <- melt(target)


#getting rid of pc 30
melt_tardf <- subset(melt_tardf, !grepl("PC30", X2))

#creating heatmap

p<-ggplot(melt_tardf, aes(X2, X1)) +
  geom_tile(aes(fill = value)) +
  scale_fill_gradient2(low = "blue", high = "red", mid = 'white')+ylab(element_blank()) +  xlab("Component") +  ggtitle('Heatmap of Chosen Components') + guides(fill = guide_colourbar(title = ""))+   theme(axis.text.x = element_text(angle = 45, hjust = 1),
                                                                                                                                                                                                               axis.text.y = element_text(size = 5), # adjust font size for y-axis labels
                                                                                                                                                                                                               axis.title = element_text(size = 12))# adjust font size for axis titles
# Increase the size of the plot using options()
options(repr.plot.width = 8, repr.plot.height = 6, repr.plot.res = 100)



# Save the plot at high resolution using ggsave()
ggsave("C:/Users/stuar/OneDrive/Desktop/Brown University/Spring-2023/DATA2020/pca_plot.png", p, dpi = 600, width = 8, height = 6)





