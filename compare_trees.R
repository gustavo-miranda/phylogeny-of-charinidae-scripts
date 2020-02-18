# visualizing trees with connected taxa
# Plot two phylogenetic trees face to face. 
# Gustavo Silva de Miranda
# based on https://yulab-smu.github.io/treedata-book/chapter2.html#subsetting-tree-with-data

library(dplyr)
library(ggplot2)
library(ggtree)
library(treeio)

setwd("path/to/directory")

  
##### read tree files
x <- read.nexus(file = '.path/to/directory/tree.nex')
y <- read.tree(file= ".path/to/directory/tree.tre")


##### plot tree to variable

# to see node numbers (if needed)
ggtree(x) + geom_text2(aes(subset=!isTip, label=node), hjust=-.3) + geom_tiplab(size=2)
ggtree(y) + geom_text2(aes(subset=!isTip, label=node), hjust=-.3) + geom_tiplab(size=2)

# creates an object with a plot of tree 1 with a centralized title
p1 <- ggtree(x_2) + ggtitle("ML") + theme(plot.title = element_text(hjust = 0.25)) +
      geom_hilight(node=113, fill="steelblue", alpha=.6) +
      geom_hilight(node=116, fill="yellow", alpha=.6) +
      geom_hilight(node=154, fill="green", alpha=.6)

p2 <- ggtree(y_2) + ggtitle("BI") + theme(plot.title = element_text(hjust = 0.25)) +
      geom_hilight(node=190, fill="steelblue", alpha=.6) +
      geom_hilight(node=112, fill="yellow", alpha=.6) +
      geom_hilight(node=142, fill="green", alpha=.6)

# create tibbles from $data
d1 <- p1$data
d2 <- p2$data

# reverse x-axis and set offset to make the tree in the right hand side of the first tree
d2$x <- max(d2$x) - d2$x + max(d1$x) + 1

pp <- p1 +                                       # plot the first tree (ML)
      geom_tree(data=d2) +                       # add tree layer (BI)
      labs(title = "ML vs BI", caption="Programs: RaxML and MrBayes")

# same as above, but simplified
pp <- p1 +  geom_tree(data=d2) + labs(title = "ML vs BI", caption="Programs: RaxML and MrBayes")

dd <- bind_rows(d1, d2) %>%     # bind multiple data frames by row and column
      filter(!is.na(label))     # 'filter' return rows with matching conditions, in this case the 'labels' (tip labels)

 
pp + geom_line(aes(x, y, group=label), data=dd, color='grey')

ggsave(filename = "MLvsBI_tree_comparison.pdf" , device = "pdf", width = 15, height = 20 , units = "in" , limitsize = FALSE)
