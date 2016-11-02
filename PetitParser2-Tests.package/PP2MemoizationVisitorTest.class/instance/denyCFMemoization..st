as yet unclassified
denyCFMemoization: node

	visitor visit: node.
	
	self deny: (node memoizationStrategy isKindOf: PP2CFMemoization).