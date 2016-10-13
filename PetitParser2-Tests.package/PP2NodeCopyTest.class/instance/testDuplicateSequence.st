tests
testDuplicateSequence
	| node nodeCopy |
	node := $a asPParser, $b asPParser.
	
	nodeCopy := node duplicate.
	
	self assert: node equals: nodeCopy.
	self assert: node ~~ nodeCopy.
	
	self assert: node firstChild ~~ nodeCopy firstChild.
	self assert: node secondChild ~~ nodeCopy secondChild.	