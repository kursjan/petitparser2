Extension { #name : #PP2Token }

{ #category : #'*PetitParser2-RewriteEngine' }
PP2Token >> match: parseNode inContext: aDictionary [
	^ parseNode isToken and: [ self value = parseNode value ]
]

{ #category : #'*PetitParser2-RewriteEngine' }
PP2Token >> parent [
	self propertyAt: #parent ifAbsent: [ nil ]
]

{ #category : #'*PetitParser2-RewriteEngine' }
PP2Token >> parent: parentNode [
	self propertyAt: #parent put: parentNode
]

{ #category : #'*PetitParser2-RewriteEngine' }
PP2Token >> startPosition [
	^ start
]

{ #category : #'*PetitParser2-RewriteEngine' }
PP2Token >> stopPosition [
	^ stop
]
