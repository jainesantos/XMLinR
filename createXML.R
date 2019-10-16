#Chamando a biblioteca XML
library(XML)

#Cria um novo domundo XML
doc = newXMLDoc()

#Cria uma tag no topo
top = newXMLNode("batata")

#Cria uma subtag de top com atributos 1 e abc
newXMLNode("potato", attrs = c(x = 1, y = 'abc'), parent = top)

#Cria uma subtag de top com algum texto
newXMLNode("patate", " Je mange des patate ", parent = top)

#Cria uma subtag de top com um texto como nome
d = newXMLNode("kartoffel", newXMLTextNode(" Mangia patata "), parent = top)

#Comentário
newXMLCommentNode("I will suggest you to eat potatoes", parent = top)

#Mais uma subtag
o = newXMLNode("Batatao", parent = top)

#Adiciona "filhos" ao nó Batatao
kids = lapply(c(" Asterix "," Doce ", " Baraka "),
              function(x)
                newXMLNode("Batatinha", x))
addChildren(o, kids)

#Imprime nosso XML gerado
cat(saveXML(top))

#Falta salvar a árvore XML num arquivo.xml de fato.