test - context
testPop
	| node |
	node := nil asPParser pop.
	
	self context defaultStack push: $a.
	self assert: node parse: ''.
	self assert: context defaultStack isEmpty.