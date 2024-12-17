

run_lda_cv <- function(x, nfolds, ks, dir = "cv/", refresh = FALSE){
  if (!dir.exists(dir)) dir.create(dir)
  folds <- sample(1:nfolds, ncol(x), replace = TRUE)
  map(
    1:nfolds, 
    run_lda_cv_fold, 
    x = x, folds = folds, ks = ks, dir = dir, refresh = refresh
  ) |> 
    bind_rows()
}




run_lda_cv_fold <- function(fold, x, folds, ks, dir, refresh = FALSE){
  if (!dir.exists(dir)) dir.create(dir)
  filename <- str_c(dir, paste0("fold_", fold, ".Rds"))
  if (refresh | (!file.exists(filename))) {
    x_train <- x[, folds != fold] |> assay("counts") |> t()
    x_test <- x[, folds == fold] |> assay("counts") |> t()
    lda_models <- map(ks, ~ LDA(x_train , k = .x, method = "VEM"))
    fold_res <- list(x_train = x_train, x_test = x_test, lda_models = lda_models)
    saveRDS(fold_res, filename)
  } else {
    fold_res <- readRDS(filename)
    x_train <- fold_res$x_train
    x_test <- fold_res$x_test
    lda_models <- fold_res$lda_models
  }
  # x_train <- x_train |> as.integer() |> matrix(nrow = nrow(x_train), ncol = ncol(x_train))
  perplexity_train <- map(lda_models, ~ perplexity(.x, x_train))
  perplexity_test <- map(lda_models, ~ perplexity(.x, x_test)) 
  bind_rows(
    tibble(ks = ks, set = "train", perplexity = perplexity_train |> unlist()),
    tibble(ks = ks, set = "test", perplexity = perplexity_test |> unlist())
  ) |> mutate(fold = fold)
}
