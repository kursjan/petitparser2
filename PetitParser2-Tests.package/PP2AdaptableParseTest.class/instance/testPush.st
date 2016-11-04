test - context
testPush
	| node |
	node := $a asPParser push.
	
	self assert: node parse: 'a'.
	self assert: context defaultStack size equals: 1.
	self assert: context defaultStack top equals: $a.
