visiting
visitPP2Node: node
	| target |
	node children do: [ :child | 
		(child class == PP2DelegateNode and: [ child strategy class == PP2Delegate]) ifTrue: [  
			target := child child.
			node strategy bypass: child to: target
		].
		self visit: child.
	]