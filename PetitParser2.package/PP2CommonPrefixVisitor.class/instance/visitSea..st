visiting
visitSea: node
	self visit: node island.
	
	self cache: node island.
	node beforeWater boundaryElements do: [ :e | self cache: e ].
	node afterWater boundaryElements do: [ :e | self cache: e ].
