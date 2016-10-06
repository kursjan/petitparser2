as yet unclassified
testDelegate
	named := 'foo' asPParser
		name: 'foo';
		yourself.
		
	parser := named wrapped.
	self visit: parser.
	
	self assert: result size equals: 1.
	self assert: result anySatisfy: [ :p | p name = 'foo' ]