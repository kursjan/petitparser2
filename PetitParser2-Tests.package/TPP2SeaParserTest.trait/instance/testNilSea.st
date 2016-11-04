tests
testNilSea
	| parser |
	parser := self emptySea.
	
	self assert: parser parse: ''.
	self assert: self result first equals: ''.	

	self assert: parser parse: '...'.
	self assert: self result first equals: '...'.

