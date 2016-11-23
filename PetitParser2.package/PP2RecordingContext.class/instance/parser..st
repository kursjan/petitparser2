accessing
parser: aPP2Node
	| parent |
	super parser: aPP2Node.
	
	"Transform to profiling strategies"
	aPP2Node allNodesDo: [ :node | 
		parent := node.
		node strategies do: [ :strategy | 
			parent := self switchToRecording: strategy parent: parent.
		]
	].

	aPP2Node refreshCaches.