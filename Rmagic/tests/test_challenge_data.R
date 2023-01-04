# To run this file:
# - Set the working directory to 'R/tests'.
library(reticulate)
py_discover_config(required_module = "magic")
import("magic")
py_config()

# Instead of library(Rmagic) Run
install.magic()
library(ggplot2)
library(readr)
library(viridis)

data <- read.csv("seurat_pbmc3k_counts.csv",row.names = 1)

seurat_raw_data <- t(data)
rownames(seurat_raw_data) <- colnames(data)
colnames(seurat_raw_data) <- rownames(data)
seurat_obj <- Seurat::CreateSeuratObject(count = data,raw.data = seurat_raw_data)

  # run MAGIC
data_MAGIC <- magic(data)
result <- data.frame(data_MAGIC$result)

write.csv(data_MAGIC$result,"magic_impute_result.csv")


# # plot
# p <- ggplot(data) +
#   geom_point(aes(VIM, CDH1, colour = ZEB1)) +
#   scale_colour_viridis(option = "B")
# ggsave("EMT_challenge_data_R_before_magic.png", plot = p, width = 5, height = 5)
# 
# p_m <- ggplot(data_MAGIC) +
#   geom_point(aes(VIM, CDH1, colour = ZEB1)) +
#   scale_colour_viridis(option = "B")
# ggsave("EMT_challenge_data_R_after_magic.png", plot = p_m, width = 5, height = 5)