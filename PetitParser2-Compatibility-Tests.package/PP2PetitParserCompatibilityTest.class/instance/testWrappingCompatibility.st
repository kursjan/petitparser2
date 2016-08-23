tests
testWrappingCompatibility
	| pp2Node |
	pp2Node := (#any asParser >=> [ :ctx :cc | (ctx stream peekFor: $a) ifTrue: [ cc value ] ]) asPetit2Parser.
	
	self assert: pp2Node parse: 'ab' to: $b.
	self assert: pp2Node parse: 'bc' to: nil end: 0.	