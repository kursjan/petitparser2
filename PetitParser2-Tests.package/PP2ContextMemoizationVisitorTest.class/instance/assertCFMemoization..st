as yet unclassified
assertCFMemoization: node

	visitor visit: node.
	
	self assert: (node memoizationStrategy isKindOf: PP2CFMemoization).