as yet unclassified
testVisitSequence
	parser := $a asParser2, $b asParser2.
	result := visitor visit: parser.
	
	self assert: result equals: #()