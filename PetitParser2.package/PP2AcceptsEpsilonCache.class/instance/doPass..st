optimizations
doPass: node
	| children child |
	self visit: node.
	children := node allChildren.
	
	[child := children detect: [ :e | (e hasProperty: #acceptsEpsilon) not ] 
							ifNone: [ nil ] ] whileNotNil: [ 		
		self visit: child
	]