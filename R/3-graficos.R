# Leitura dos dados

library(tidyverse)
library(ggimage)

df_2003 <- read_rds('data/df_2003.rds')
df_2013 <- read_rds('data/df_2013.rds')
df_2018 <- read_rds('data/df_2018.rds')

### Grafico 2003

df_2003 |>
  ggplot()+
  aes(x=media_man, y=media_vis, image=imagem)+
  geom_vline(xintercept = 0, size=1,alpha=0.3)+
  geom_hline(yintercept = 0, size=1,alpha=0.3)+
  annotate(geom = 'text', label='Saldo Visitante = 0',
           y=-0.03,x=-1, size=4, alpha=0.4)+
  annotate(geom = 'text', label='Saldo Mandante = 0',
           y=-1.50,x=0.03, size=4, alpha=0.4, angle=270)+
  geom_image(size=0.045)+
  scale_size_identity()+
  labs(
    x='Saldo Médio Mandante',
    y='Saldo Médio Visitante',
    title='Saldo Médio de Gols Visitante x Mandante - Brasileirão Série A',
    subtitle='de 2003 até 2022'
  )+
  theme_minimal()+
  scale_x_continuous(breaks=seq(-1.75, 0.75, 0.25))+
  scale_y_continuous(breaks=seq(-1.75, 0.75, 0.25))+
  coord_cartesian(xlim=c(-1.25,1.25),
                  ylim=c(-1.875, 0.5))

ggsave('graph/2003.png', dpi=300)

### Grafico 2013

df_2013 |>
  ggplot()+
  aes(x=media_man, y=media_vis, image=imagem)+
  geom_vline(xintercept = 0, size=1,alpha=0.3)+
  geom_hline(yintercept = 0, size=1,alpha=0.3)+
  annotate(geom = 'text', label='Saldo Visitante = 0',
           y=-0.03,x=-1, size=4, alpha=0.4)+
  annotate(geom = 'text', label='Saldo Mandante = 0',
           y=-1.65,x=0.03, size=4, alpha=0.4, angle=270)+
  geom_image(size=0.045)+
  scale_size_identity()+
  labs(
    x='Saldo Médio Mandante',
    y='Saldo Médio Visitante',
    title='Saldo Médio de Gols Visitante x Mandante - Brasileirão Série A',
    subtitle='de 2013 até 2022'
  )+
  theme_minimal()+
  scale_x_continuous(breaks=seq(-1.75, 0.75, 0.25))+
  scale_y_continuous(breaks=seq(-1.75, 0.75, 0.25))+
  coord_cartesian(xlim=c(-1.25,1.25),
                  ylim=c(-1.875, 0.5))

ggsave('graph/2013.png', dpi=300)

### Grafico 2018

df_2018 |>
  ggplot()+
  aes(x=media_man, y=media_vis, image=imagem)+
  geom_vline(xintercept = 0, size=1,alpha=0.3)+
  geom_hline(yintercept = 0, size=1,alpha=0.3)+
  annotate(geom = 'text', label='Saldo Visitante = 0',
           y=-0.03,x=-1, size=4, alpha=0.4)+
  annotate(geom = 'text', label='Saldo Mandante = 0',
           y=-1.55,x=0.03, size=4, alpha=0.4, angle=270)+
  geom_image(size=0.045)+
  scale_size_identity()+
  labs(
    x='Saldo Médio Mandante',
    y='Saldo Médio Visitante',
    title='Saldo Médio de Gols Visitante x Mandante - Brasileirão Série A',
    subtitle='de 2018 até 2022'
  )+
  theme_minimal()+
  scale_x_continuous(breaks=seq(-1.75, 0.75, 0.25))+
  scale_y_continuous(breaks=seq(-1.75, 0.75, 0.25))+
  coord_cartesian(xlim=c(-1.25,1.25),
                  ylim=c(-1.875, 0.5))

ggsave('graph/2018.png', dpi=300)
