accessing
parser: aPP2Node
	| parent |
	super parser: aPP2Node.
	
	"Transform to profiling strategies"
	aPP2Node allNodesDo: [ :node | 
		parent := node.
		node strategies do: [ :strategy | 
			self switchToProfiling: strategy parent: parent.
			parent := strategy.
		]
	].

	aPP2Node refreshCaches.