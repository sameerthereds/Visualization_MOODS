library(ggraph)
library(igraph)
library(tidyverse)
library(viridis)


# We need a data frame giving a hierarchical structure. Let's consider the flare dataset:
tmp <- data %>% filter(!is.na(Count))
edges <- data.frame(
  from = "*",
  to = tmp$Stressors
)
vertices = rbind(tmp, data.frame(Stressors="*", Count=1)) %>% mutate(name=Stressors)
mygraph <- graph_from_data_frame( edges, vertices=vertices )

ggraph(mygraph, layout = 'circlepack', weight=Count) + 
  geom_node_circle( aes(fill=name)) +
  scale_fill_viridis(discrete=TRUE) +
  geom_node_label(aes(label=name)) +
  theme_void() 
  
  
