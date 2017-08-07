*PetitParser2-RewriteEngine
canMatch: aClass
	^ self trees
		anySatisfy: [ :each | each class == aClass or: [ each isPatternParseNode ] ]