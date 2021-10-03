
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


