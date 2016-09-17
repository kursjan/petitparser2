as yet unclassified
testVisitDelegate
	parser := $a asPParser wrapped.
	result := visitor visit: parser.
	
	self assert: result equals: visitor