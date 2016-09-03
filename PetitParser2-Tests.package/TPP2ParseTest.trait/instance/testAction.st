test
testAction
	| parser |
	parser := #any asParser2 ==> [:e | e asUppercase ].

	self assert: parser parse: 'a' to: $A.
	self assert: parser parse: 'b' to: $B