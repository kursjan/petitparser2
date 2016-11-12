as yet unclassified
testStructuredDocument
	| input |
	input := PP2Sources current htmlSample.
	
	self parse: input rule: #structuredDocument.