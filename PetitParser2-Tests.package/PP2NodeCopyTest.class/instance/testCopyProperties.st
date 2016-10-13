tests
testCopyProperties
	| node nodeCopy |
	node := $a asPParser.
	node propertyAt: #foo put: #bar.
	
	nodeCopy := node copy.
	
	self assert: node equals: nodeCopy.

	self assert: node properties equals: nodeCopy properties.
	self assert: node properties ~~ nodeCopy properties.