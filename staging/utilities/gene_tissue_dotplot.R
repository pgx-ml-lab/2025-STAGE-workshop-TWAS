# Load required libraries
library(ggplot2)
library(dplyr)
library(scales)


plot_gene_tissue_dots_advanced <- function(data,
                                          p_thresholds = c(1e-3, 1e-5),
                                          dot_sizes = c(2, 4, 6),
                                          color_palette = "RdBu",
                                          custom_colors = NULL,
                                          color_limits = NULL,
                                          filter_pvalue = NULL,
                                          title = "TWAS Results",
                                          subtitle = "Color: effect size | Size: p-value significance",
                                          x_angle = 45,
                                          legend_position = "right",
                                          facet_by = NULL,
                                          order_genes = FALSE,
                                          order_tissues = FALSE,
                                          save_plot = FALSE,
                                          filename = "gene_tissue_dotplot.png",
                                          width = 10,
                                          height = 8,
                                          dpi = 300) {
  
  # Check required columns
  required_cols <- c("gene_name", "tissue", "effect_size", "pvalue")
  if (!all(required_cols %in% names(data))) {
    stop("Data must contain columns: ", paste(required_cols, collapse = ", "))
  }
  
  # Ensure p_thresholds are sorted
  p_thresholds <- sort(p_thresholds, decreasing = TRUE)
  
  # Create p-value categories
  data <- data %>%
    mutate(
      p_category = case_when(
        pvalue < p_thresholds[2] ~ paste("<", format(p_thresholds[2], scientific = TRUE)),
        pvalue < p_thresholds[1] ~ paste("<", format(p_thresholds[1], scientific = TRUE)),
        TRUE ~ paste(">=", format(p_thresholds[1], scientific = TRUE))
      )
    )
  
  # Set factor levels
  p_levels <- c(
    paste(">=", format(p_thresholds[1], scientific = TRUE)),
    paste("<", format(p_thresholds[1], scientific = TRUE)),
    paste("<", format(p_thresholds[2], scientific = TRUE))
  )
  
  data$p_category <- factor(data$p_category, levels = p_levels, ordered = TRUE)
  
  # Filter data if requested
  if (!is.null(filter_pvalue)) {
    data <- data %>%
      filter(pvalue < filter_pvalue)
    
    if (nrow(data) == 0) {
      warning("No data points meet the p-value filter criterion")
      return(NULL)
    }
  }
  
  # Order genes by mean effect size if requested
  if (order_genes) {
    gene_order <- data %>%
      group_by(gene_name) %>%
      summarise(mean_effect = mean(effect_size, na.rm = TRUE)) %>%
      arrange(mean_effect) %>%
      pull(gene_name)
    
    data$gene_name <- factor(data$gene_name, levels = gene_order)
  }
  
  # Order tissues by mean effect size if requested
  if (order_tissues) {
    tissue_order <- data %>%
      group_by(tissue) %>%
      summarise(mean_effect = mean(effect_size, na.rm = TRUE)) %>%
      arrange(mean_effect) %>%
      pull(tissue)
    
    data$tissue <- factor(data$tissue, levels = tissue_order)
  }
  
  # Set color limits
  if (is.null(color_limits)) {
    max_effect <- max(abs(data$effect_size), na.rm = TRUE)
    color_limits <- c(-max_effect, max_effect)
  }
  
  # Create size mapping
  names(dot_sizes) <- p_levels
  
  # Create the base plot
  p <- ggplot(data, aes(x = gene_name, y = tissue)) +
    geom_point(aes(color = effect_size, size = p_category))
  
  # Apply color scale based on palette choice
  if (!is.null(custom_colors)) {
    p <- p + scale_color_gradientn(
      colors = custom_colors,
      limits = color_limits,
      name = "Effect Size"
    )
  } else if (color_palette == "diverging") {
    p <- p + scale_color_gradient2(
      low = "blue",
      mid = "white",
      high = "red",
      midpoint = 0,
      limits = color_limits,
      name = "Effect Size"
    )
  } else if (color_palette == "viridis") {
    p <- p + scale_color_viridis_c(
      limits = color_limits,
      name = "Effect Size"
    )
  } else if (color_palette == "RdBu") {
    p <- p + scale_color_distiller(
      palette = "RdBu",
      limits = color_limits,
      name = "Effect Size"
    )
  }
  
  # Add remaining elements
  p <- p +
    scale_size_manual(
      values = dot_sizes,
      name = "P-value",
      drop = FALSE
    ) +
    theme_bw(base_size=15) +
    theme(
      axis.text.x = element_text(angle = x_angle, hjust = 1),
      panel.grid.major = element_line(color = "gray90"),
      panel.grid.minor = element_blank(),
      legend.position = legend_position
    ) +
    labs(
      x = "Gene",
      y = "Tissue",
      title = title,
      subtitle = subtitle
    )
  
  # Add faceting if requested
  if (!is.null(facet_by) && facet_by %in% names(data)) {
    p <- p + facet_wrap(as.formula(paste("~", facet_by)), scales = "free")
  }
  
  # Save plot if requested
  if (save_plot) {
    ggsave(filename, p, width = width, height = height, dpi = dpi)
    message("Plot saved to: ", filename)
  }
  
  return(p)
}