visiting
visitSea: node

	super visitSea: node.
	self updateNode: node.
		
	"memoize, if there are seas in water"
	node afterWater allNodes select: [ :n | n isSea ] thenDo: [ :sea |
		sea isContextFree ifTrue: [ 
			sea strategy: sea strategy memoize
		]
	].

	^ node