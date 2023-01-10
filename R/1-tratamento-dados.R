### Tratamento dos dados

library(tidyverse)

df <- read_csv('data/campeonato-brasileiro-full.csv') |>
  select(data, mandante, visitante, mandante_Placar,
         visitante_Placar) |>
  mutate(data=lubridate::dmy(data),
         mandante=str_replace(mandante, 'Gremio Prudente', 'Barueri'),
         visitante=str_replace(visitante, 'Gremio Prudente', 'Barueri')
         )

df |>
  write_rds('data/df.rds')

### DESDE 2003 ATE 2022

### Criando banco de dados de saldos mandante e visitante

df_saldo <- tibble(
  time = unique(df$mandante),
  saldo_man = numeric(length(unique(df$mandante))),
  saldo_vis = numeric(length(unique(df$mandante))),
  n_man = numeric(length(unique(df$mandante))),
  n_vis = numeric(length(unique(df$mandante)))
)

for (ii in 1:length(df_saldo$time)) {

  soma_man <- c()
  soma_vis <- c()
  n_man <- 0
  n_vis <- 0

  for (jj in 1:nrow(df)) {

    # Encontrando variaveis

    soma_man <- c(
      soma_man,
      ifelse(
        df_saldo$time[ii]==df$mandante[jj],
        df$mandante_Placar[jj]-df$visitante_Placar[jj],0
      )
    )

    soma_vis <- c(
      soma_vis,
      ifelse(
        df_saldo$time[ii]==df$visitante[jj],
        df$visitante_Placar[jj]-df$mandante_Placar[jj],0
      )
    )

    n_man <- ifelse(
      df_saldo$time[ii]==df$mandante[jj],
      n_man+1, n_man
    )

    n_vis <- ifelse(
      df_saldo$time[ii]==df$visitante[jj],
      n_vis+1, n_vis
    )
  }

  df_saldo$saldo_man[ii] <- sum(soma_man)
  df_saldo$saldo_vis[ii] <- sum(soma_vis)
  df_saldo$n_man[ii] <- n_man
  df_saldo$n_vis[ii] <- n_vis

}

df_saldo <- df_saldo |>
  mutate(
    media_man=saldo_man/n_man,
    media_vis=saldo_vis/n_vis
  ) |>
  select(
    time, media_man, media_vis, n_man, n_vis
  )


### Exportando banco de dados

df_saldo |>
  write_rds('data/df_2003.rds')

### DESDE 2013 ATE 2022

df <- df |>
  filter(data >= '2013-01-01')

### Criando banco de dados de saldos mandante e visitante

df_saldo <- tibble(
  time = unique(df$mandante),
  saldo_man = numeric(length(unique(df$mandante))),
  saldo_vis = numeric(length(unique(df$mandante))),
  n_man = numeric(length(unique(df$mandante))),
  n_vis = numeric(length(unique(df$mandante)))
)

for (ii in 1:length(df_saldo$time)) {

  soma_man <- c()
  soma_vis <- c()
  n_man <- 0
  n_vis <- 0

  for (jj in 1:nrow(df)) {

    # Encontrando variaveis

    soma_man <- c(
      soma_man,
      ifelse(
        df_saldo$time[ii]==df$mandante[jj],
        df$mandante_Placar[jj]-df$visitante_Placar[jj],0
      )
    )

    soma_vis <- c(
      soma_vis,
      ifelse(
        df_saldo$time[ii]==df$visitante[jj],
        df$visitante_Placar[jj]-df$mandante_Placar[jj],0
      )
    )

    n_man <- ifelse(
      df_saldo$time[ii]==df$mandante[jj],
      n_man+1, n_man
    )

    n_vis <- ifelse(
      df_saldo$time[ii]==df$visitante[jj],
      n_vis+1, n_vis
    )
  }

  df_saldo$saldo_man[ii] <- sum(soma_man)
  df_saldo$saldo_vis[ii] <- sum(soma_vis)
  df_saldo$n_man[ii] <- n_man
  df_saldo$n_vis[ii] <- n_vis

}

df_saldo <- df_saldo |>
  mutate(
    media_man=saldo_man/n_man,
    media_vis=saldo_vis/n_vis
  ) |>
  select(
    time, media_man, media_vis, n_man, n_vis
  )


### Exportando banco de dados

df_saldo |>
  write_rds('data/df_2013.rds')

### DESDE 2018 ATE 2022

df <- df |>
  filter(data >= '2018-01-01')

### Criando banco de dados de saldos mandante e visitante

df_saldo <- tibble(
  time = unique(df$mandante),
  saldo_man = numeric(length(unique(df$mandante))),
  saldo_vis = numeric(length(unique(df$mandante))),
  n_man = numeric(length(unique(df$mandante))),
  n_vis = numeric(length(unique(df$mandante)))
)

for (ii in 1:length(df_saldo$time)) {

  soma_man <- c()
  soma_vis <- c()
  n_man <- 0
  n_vis <- 0

  for (jj in 1:nrow(df)) {

    # Encontrando variaveis

    soma_man <- c(
      soma_man,
      ifelse(
        df_saldo$time[ii]==df$mandante[jj],
        df$mandante_Placar[jj]-df$visitante_Placar[jj],0
      )
    )

    soma_vis <- c(
      soma_vis,
      ifelse(
        df_saldo$time[ii]==df$visitante[jj],
        df$visitante_Placar[jj]-df$mandante_Placar[jj],0
      )
    )

    n_man <- ifelse(
      df_saldo$time[ii]==df$mandante[jj],
      n_man+1, n_man
    )

    n_vis <- ifelse(
      df_saldo$time[ii]==df$visitante[jj],
      n_vis+1, n_vis
    )
  }

  df_saldo$saldo_man[ii] <- sum(soma_man)
  df_saldo$saldo_vis[ii] <- sum(soma_vis)
  df_saldo$n_man[ii] <- n_man
  df_saldo$n_vis[ii] <- n_vis

}

df_saldo <- df_saldo |>
  mutate(
    media_man=saldo_man/n_man,
    media_vis=saldo_vis/n_vis
  ) |>
  select(
    time, media_man, media_vis, n_man, n_vis
  )


### Exportando banco de dados

df_saldo |>
  write_rds('data/df_2018.rds')
