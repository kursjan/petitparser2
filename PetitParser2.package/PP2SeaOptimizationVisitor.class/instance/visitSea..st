visiting
visitSea: node
	node setBeforeWater: (self createBeforeWater: node).
	node setAfterWater: (self createAfterWater: node).
	
	"memoize, if there are seas in water"
	node afterWater child allNodes select: [ :n | n isSea ] thenDo: [ :sea |
		sea strategy: sea strategy memoize
	].

	^ node