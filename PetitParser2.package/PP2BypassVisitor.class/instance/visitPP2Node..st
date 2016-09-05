visiting
visitPP2Node: node
	| target |
	node children do: [ :child | 
		(child class == PP2DelegateNode) ifTrue: [  
			target := child child.
			node strategy bypass: child to: target
		].
		self visit: child.
	]