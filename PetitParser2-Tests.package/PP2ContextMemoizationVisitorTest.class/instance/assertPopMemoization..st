as yet unclassified
assertPopMemoization: node

	visitor visit: node.
	
	self assert: (node memoizationStrategy isKindOf: PP2PopMemoization).