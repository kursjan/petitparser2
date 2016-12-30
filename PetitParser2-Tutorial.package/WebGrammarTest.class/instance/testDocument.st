tests
testDocument
	| input |
	input := PP2Sources current htmlSample.
	
	self parse: input rule: #document.
	self assert: result size equals: 2.