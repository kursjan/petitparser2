Extension { #name : #UndefinedObject }

{ #category : #'*PetitParser2' }
UndefinedObject >> asPParser [
	^ PP2EpsilonNode new
]

{ #category : #'*PetitParser2' }
UndefinedObject >> isSeparator [
	^ false
]
