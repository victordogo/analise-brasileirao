# Dataset com imagens dos clubes brasileiros da Serie A desde 2003

library(tidyverse)

df <- read_rds('data/1-saldo-medio/df.rds')

df_clubes <- tibble(
  time=unique(df$mandante)
)

### URLS WIKIMEDIA

imgs <- paste0('img/', df_clubes$time, '.png')

### Adicionando URLs

df_clubes$imagem <- imgs


#### ADICIONANDO IMAGENS AOS DADOS

df_2003 <- read_rds('data/1-saldo-medio/df_2003.rds') |>
  left_join(df_clubes, by='time')

df_2013 <- read_rds('data/1-saldo-medio/df_2013.rds') |>
  left_join(df_clubes, by='time')

df_2018 <- read_rds('data/1-saldo-medio/df_2018.rds') |>
  left_join(df_clubes, by='time')

# Exportando

df_2003 |>
  write_rds('data/1-saldo-medio/df_2003.rds')

df_2013 |>
  write_rds('data/1-saldo-medio/df_2013.rds')

df_2018 |>
  write_rds('data/1-saldo-medio/df_2018.rds')
