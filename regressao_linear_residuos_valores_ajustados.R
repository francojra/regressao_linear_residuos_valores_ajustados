
# Erros residuais e valores ajustados do modelo de Regressão Linear ------------------------------------------------------------------------

# Pacotes necessários ----------------------------------------------------------------------------------------------------------------------

library(tidyverse) # manipulção e visualização de dados
library(broom) # Cria um data frame organizado dos resultados estatísticos
theme_set(theme_classic()) # Estabelecer tema para o gráfico

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

install.packages("datarium") # Baixar pacote que fornece os dados
data("marketing", package = "datarium")
sample_n(marketing, 3) # Apresenta as três primeiras linhas dos dados

# Construir modelo de regressão ------------------------------------------------------------------------------------------------------------

### Pergunta: como o orçamento em publicidade no Facebook influencia nas vendas

model <- lm(sales ~ youtube, data = marketing)
model

# Verificar valores ajustados e residuais do modelo ----------------------------------------------------------------------------------------

### Os valores ajustados (ou previstos) são os valores y que você esperaria para 
### os valores x fornecidos de acordo com o modelo de regressão construído, ou seja,
### um melhor ajuste do seu modelo.

### Quando nem todos os pontos de dados caem exatamente na linha de regressão estimada,
### significa que os valores observados (medidos) são diferentes dos valores previstos
### e ajustados do modelo. A diferença é chamada de erros residuais, representados por 
### linhas vermelhas verticais (veja no gráfico abaixo).

model.diag.metrics <- augment(model)
head(model.diag.metrics)

### Resultados:

# youtube: valores dos orçamentos investidos no youtube
# sales: valores observados de vendas
# .fitted: valores ajustados das vendas
# .resid: erros residuais

# Gráfico do modelo ------------------------------------------------------------------------------------------------------------------------

ggplot(model.diag.metrics, aes(youtube, sales)) +
  geom_point() +
  stat_smooth(method = lm, se = FALSE) +
  geom_segment(aes(xend = youtube, yend = .fitted), color = "red", size = 0.3)

# Referência ------------------------------------------------------------------------------------------------------------------------------------

### http://www.sthda.com/english/articles/39-regression-model-diagnostics/161-linear-regression-assumptions-and-diagnostics-in-r-essentials/

