optimizations
doPass: node
	| children child |
	self visit: node.
	children := node allNodes.
	
	[child := children detect: [ :e | (e hasProperty: self propertySymbol) not ] 
							ifNone: [ nil ] ] whileNotNil: [ 		
		self visit: child
	]