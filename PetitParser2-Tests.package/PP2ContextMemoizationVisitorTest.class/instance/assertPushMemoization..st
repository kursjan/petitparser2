as yet unclassified
assertPushMemoization: node

	visitor visit: node.
	
	self assert: (node memoizationStrategy isKindOf: PP2PushMemoization).