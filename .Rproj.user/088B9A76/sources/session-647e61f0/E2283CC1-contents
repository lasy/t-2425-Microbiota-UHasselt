
plot_gamma <- function(x, models = 1:2, order_samples = TRUE){
  
  gammas <- 
    x@models[models] |> 
    map(
      ~ 
        .x$gamma |> 
        set_colnames(1:ncol(.x$gamma)) |>
        as.data.frame() |> 
        rownames_to_column("sample") |> 
        as_tibble()
    ) |>
    bind_rows(.id = "model")  |> 
    pivot_longer(-c(model, sample), names_to = "topic", values_to = "gamma") |>
    filter(!is.na(gamma)) |> 
    mutate(
      model = model |> fct_inorder(),
      topic = topic |> parse_number() |> factor()
    )
  
  if (order_samples) {
    tmp <- gammas |> arrange(model |> desc()) |>  filter(model == model[1])
    d <- tmp |> 
      select(-model) |> 
      pivot_wider(names_from = topic, values_from = gamma) |> 
      column_to_rownames("sample") |> 
      vegan::vegdist(method = "bray")
    o <- seriation::seriate(d)
    gammas <- 
      gammas |> 
      mutate(
        sample = 
          sample |> 
          factor(levels = seriation::permute(d, o) |> as.matrix() |> colnames())
      )
  }
  
  gammas |> 
    ggplot(aes(x = sample, y = topic |> fct_rev(), fill = topic, alpha = gamma)) +
    geom_tile() +
    facet_grid(model ~ ., scales = "free_y", space = "free_y") +
    ylab("topic") +
    scale_alpha(range = c(0, 1)) +
    theme(
      strip.text.y = element_text(angle = 0),
      axis.text.x = element_blank()
    )
}