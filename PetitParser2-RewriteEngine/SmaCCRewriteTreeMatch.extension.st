Extension { #name : #SmaCCRewriteTreeMatch }

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteTreeMatch >> canMatch: aClass [
	^ self trees
		anySatisfy: [ :each | each class == aClass or: [ each isPatternParseNode ] ]
]
