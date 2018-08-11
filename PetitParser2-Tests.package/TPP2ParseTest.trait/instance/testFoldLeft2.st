test - mapping
testFoldLeft2
	| parser |
	parser := #any asPParser star 
		foldLeft: [ :a :b :c | Array with: a with: b with: c ].
"	self assert: parser parse: #(a) to: #a.
"
	self assert: parser parse: 'a' to: 'a'.
	self assert: parser parse: 'abc' to: #($a $b $c).
	self assert: parser parse: 'abcde' to: #(($a $b $c) $d $e)
