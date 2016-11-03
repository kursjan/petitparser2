as yet unclassified
assertMemoized: node

	visitor visit: node.
	
	self assert: (node isMemoized).