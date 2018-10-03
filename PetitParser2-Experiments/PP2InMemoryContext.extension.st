Extension { #name : #PP2InMemoryContext }

{ #category : #'*PetitParser2-Experiments-Reparsing' }
PP2InMemoryContext >> asReparsableContext [
	^ (PP2ReparsableContext on: collection)
]
