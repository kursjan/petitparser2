tests
testBlock
	| parser |
	parser := [ :ctx | 
		self assert: (ctx isKindOf: PP2Context).
		ctx next 
	] asParser2.
	
	self assert: parser parse: 'ab' to: $a end: 1.
	self assert: parser parse: 'b' to: $b.
	self assert: parser parse: '' to: nil