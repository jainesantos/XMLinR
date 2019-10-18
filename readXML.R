# Um programa para ler um arquivo XML

# Chamar a biblioteca XML
library(XML)

# Lemos o arquivo first.xml e guardamos em readXml
readXml <- xmlParse(file = "first.xml")

# Geramos uma lista que contém tags e atributos do nosso arquivo
model <- xmlToList(readXml)

# Imprimimos a lista
print(model)

# Atribuimos o item Kartoffel para b1
b1 <- model$kartoffel

# Atribuimos a lista Batatao para b2
b2 <- model$Batatao

# Imprimimos b2 e b1
cat("\n")
print(b2)
print(b1)