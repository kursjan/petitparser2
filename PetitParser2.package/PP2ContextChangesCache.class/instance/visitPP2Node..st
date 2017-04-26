accessing
visitPP2Node: node
	
	"TODO"

	^ cache detect: [:each | each node = node ] ifNone: [PP2CcResult noChange].