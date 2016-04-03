test - parsing
testAction
	| block parser |
	block := [ :char | char asUppercase ].
	parser := #any asParser2 ==> block.
	self assert: parser block equals: block.
	self assert: parser parse: 'a' to: $A.
	self assert: parser parse: 'b' to: $B