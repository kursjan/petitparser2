Extension { #name : #PP2Context }

{ #category : #'*PetitParser2-Experiments' }
PP2Context >> adoptString: newString [
	stream adoptString: newString
]

{ #category : #'*PetitParser2-Experiments' }
PP2Context >> applyChange: change [
	change updateContext: self.
	change updateTokens: self returnValue.
	change updateParser: self parser
]

{ #category : #'*PetitParser2-Experiments' }
PP2Context >> asReparsableContext [
	^ self collection asReparsableContext
]
