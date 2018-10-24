Extension { #name : #PP2AbstractStrategy }

{ #category : #'*PetitParser2-Experiments-Reparsing' }
PP2AbstractStrategy >> isReparsable [
	^ false
]

{ #category : #'*PetitParser2-Experiments-Reparsing' }
PP2AbstractStrategy >> reparsable [
	^ PP2Reparsable on: self
]
