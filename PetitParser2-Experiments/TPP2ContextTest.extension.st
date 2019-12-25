Extension { #name : #TPP2ContextTest }

{ #category : #'*PetitParser2-Experiments' }
TPP2ContextTest >> testAdoptString [
	| context |
	context := self contextOn: 'foo'.
	
	self assert: context contents equals: 'foo'.
	
	context adoptString: 'bar'.
	self assert: context contents equals: 'bar'.
]
