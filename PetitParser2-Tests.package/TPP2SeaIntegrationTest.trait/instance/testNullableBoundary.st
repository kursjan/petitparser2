tests
testNullableBoundary
	| parser sea |

	sea := self seaInstance island: $a asPParser.
	parser := sea, $b asPParser optional.
	
	self assert: parser parse: '..a..'.
	self assert: self result first second equals: $a.

	self assert: parser parse: '..a..b'.
	self assert: self result first second equals: $a.

	self assert: parser fail: '..b'.
	self assert: parser fail: '..'	.