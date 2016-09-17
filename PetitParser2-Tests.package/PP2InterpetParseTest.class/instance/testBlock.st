test
testBlock
	| parser |
	parser := [ :ctx | 
		self assert: (ctx isPetit2Context).
		ctx next 
	] asPParser.
	
	self assert: parser parse: 'ab' to: $a end: 1.
	self assert: parser parse: 'b' to: $b.
	self assert: parser parse: '' to: nil