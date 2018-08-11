test - mapping
testFoldRight
	| parser |
	parser := #any asPParser star 
		foldRight: [ :a :b | Array with: a with: b ].

	self assert: parser parse: 'a' to: #a.
	self assert: parser parse: 'ab' to: #($a $b).
	self assert: parser parse: 'abc' to: #($a ($b $c)).
	self assert: parser parse: 'abcd' to: #($a ($b ($c $d))).
	self assert: parser parse: 'abcde' to: #($a ($b ($c ($d $e))))