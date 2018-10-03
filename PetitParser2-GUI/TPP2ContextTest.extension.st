Extension { #name : #TPP2ContextTest }

{ #category : #'*PetitParser2-GUI' }
TPP2ContextTest >> testDebugResult [
	| context |
	context := self contextOn: 'baab'.
	context parser: $a asPParser plus.
	context position: 1.
	context startMemento: context remember.	
		
	self assert: context debugResult isNotNil.
	self assert: context debugResult children first result size equals: 2.
	self assert: context debugResult children first result first equals: $a.
]
