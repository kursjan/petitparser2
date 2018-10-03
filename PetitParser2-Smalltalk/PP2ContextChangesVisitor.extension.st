Extension { #name : #PP2ContextChangesVisitor }

{ #category : #'*PetitParser2-Smalltalk' }
PP2ContextChangesVisitor >> visitSmalltalkWhitespace: node [
	^ PP2CcChange noChange 
]
