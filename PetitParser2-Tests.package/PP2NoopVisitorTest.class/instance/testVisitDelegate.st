as yet unclassified
testVisitDelegate
	parser := $a asParser2 wrapped.
	result := visitor visit: parser.
	
	self assert: result equals: visitor