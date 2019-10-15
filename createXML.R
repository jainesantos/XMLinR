#Chamando a biblioteca XML
library(XML)

#Cria um novo domundo XML
doc = newXMLDoc()

#Cria uma tag no topo
top = newXMLNode("batata")

#Cria uma subtag de top com atributos 1 e abc
newXMLNode("potato", attrs = c(x = 1, y = 'abc'), parent = top)

#Cria uma subtag de top com algum texto
newXMLNode("patate", "With some text", parent = top)

#Cria uma subtag de top com um texto como nome
d = newXMLNode("d", newXMLTextNode("Mangia patata"), parent = top)

#Seila por enquanto.....
newXMLCDataNode("x <- 1\n x > 2", parent = d)

###  O estudo do código parou por aqui  ###

newXMLPINode("R", "library(XML)", top)
newXMLCommentNode("This is a comment", parent = top)

o = newXMLNode("ol", parent = top)

kids = lapply(letters[1:3],
              function(x)
                newXMLNode("li", x))
addChildren(o, kids)

cat(saveXML(top))


x = newXMLNode("block", "xyz", attrs = c(id = "bob"),
               namespace = "fo",
               namespaceDefinitions = c("fo" = "http://www.fo.org"))

xmlName(x, TRUE) == "fo"

# a short cut to define a name space and make it the prefix for the
# node, thus avoiding repeating the prefix via the namespace argument.
x = newXMLNode("block", "xyz", attrs = c(id = "bob"),
               namespace = c("fo" = "http://www.fo.org"))


# name space on the attribute
x = newXMLNode("block", attrs = c("fo:id" = "bob"),
               namespaceDefinitions = c("fo" = "http://www.fo.org"))




x = summary(rnorm(1000))
d = xmlTree()
d$addNode("table", close = FALSE)

d$addNode("tr", .children = sapply(names(x), function(x) d$addNode("th", x)))
d$addNode("tr", .children = sapply(x, function(x) d$addNode("td", format(x))))

d$closeNode()


# Just doctype
z = xmlTree("people", dtd = "people")
# no public element
z = xmlTree("people", dtd = c("people", "", "http://www.omegahat.net/XML/types.dtd"))
# public and system
z = xmlTree("people", dtd = c("people", "//a//b//c//d", "http://www.omegahat.net/XML/types.dtd"))

# Using a DTD node directly.
dtd = newXMLDTDNode(c("people", "", "http://www.omegahat.net/XML/types.dtd"))
z = xmlTree("people", dtd = dtd)


x = rnorm(3)
z = xmlTree("r:data", namespaces = c(r = "http://www.r-project.org"))
z$addNode("numeric", attrs = c("r:length" = length(x)), close = FALSE)
lapply(x, function(v) z$addNode("el", x))
z$closeNode()
# should give   <r:data><numeric r:length="3"/></r:data>


# shows namespace prefix on an attribute, and different from the one on the node.
z = xmlTree()
z$addNode("r:data",
          namespace = c(r = "http://www.r-project.org",
                        omg = "http://www.omegahat.net"),
          close = FALSE)
x = rnorm(3)
z$addNode("r:numeric", attrs = c("omg:length" = length(x)))


z = xmlTree("people", namespaces = list(r = "http://www.r-project.org"))
z$setNamespace("r")

z$addNode("person", attrs = c(id = "123"), close = FALSE)
z$addNode("firstname", "Duncan")
z$addNode("surname", "Temple Lang")
z$addNode("title", "Associate Professor")
z$addNode("expertize", close = FALSE)
z$addNode("topic", "Data Technologies")
z$addNode("topic", "Programming Language Design")
z$addNode("topic", "Parallel Computing")
z$addNode("topic", "Data Visualization")
z$closeTag()
z$addNode("address", "4210 Mathematical Sciences Building, UC Davis")



# 
txt = newXMLTextNode("x < 1")
txt # okay
saveXML(txt) # x &lt; 1

# By escaping the text, we ensure the entities don't
# get expanded, i.e. < doesn't become &lt;
txt = newXMLTextNode(I("x < 1"))
txt # okay
saveXML(txt) # x < 1


newXMLNode("r:expr", newXMLTextNode(I("x < 1")),
           namespaceDefinitions = c(r = "http://www.r-project.org"))
