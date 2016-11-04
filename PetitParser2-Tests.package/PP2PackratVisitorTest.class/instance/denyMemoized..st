asserting
denyMemoized: node

	visitor visit: node.
	
	self deny: (node isMemoized).