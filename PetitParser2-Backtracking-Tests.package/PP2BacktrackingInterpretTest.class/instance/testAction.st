test
testAction
	| parser |
	parser := #any asPParser ==> [:e | e asUppercase ].

	self assert: parser parse: 'a' to: $A.
	self assert: parser parse: 'b' to: $B