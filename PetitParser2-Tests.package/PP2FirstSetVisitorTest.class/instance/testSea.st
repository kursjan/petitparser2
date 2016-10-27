tests
testSea
	| sea |
	parser := $a asPParser.
	sea := parser sea.
	firstSet := self firstSetWithoutDuplicates: sea.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: parser.
	self assert: firstSet includes: #any asPParser. 
