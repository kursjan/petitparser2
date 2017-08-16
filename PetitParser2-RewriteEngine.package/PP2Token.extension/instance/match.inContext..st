*PetitParser2-RewriteEngine
match: parseNode inContext: aDictionary
	^ parseNode isToken and: [ self value = parseNode value ]