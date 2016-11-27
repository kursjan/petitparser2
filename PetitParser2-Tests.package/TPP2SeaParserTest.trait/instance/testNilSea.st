tests
testNilSea
	| parser |
	parser := self emptySea.
	
	self assert: parser parse: ''.
	self assert: self result first equals: #() asOrderedCollection.	

	self assert: parser parse: '...'.
	self assert: self result first equals: #($. $. $.) asOrderedCollection.

