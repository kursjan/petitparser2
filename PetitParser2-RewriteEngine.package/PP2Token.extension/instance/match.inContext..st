*PetitParser2-RewriteEngine
match: parseNode inContext: aDictionary
	self halt.
	^ parseNode isToken and: [ self value = parseNode value ]