as yet unclassified
testDelegateExcludeSelf
	named := 'foo' asParser2
		name: 'foo';
		yourself.
		
	parser := named wrapped
		name: 'self';
		yourself.
		
	self visit: parser.
	
	self assert: result size equals: 1.
	self assert: result anySatisfy: [ :p | p name = 'foo' ]