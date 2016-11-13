visiting
visitSea: node
	self visit: node island.
	
	node isMemoized ifFalse: [ 
		self cache: node island.
		node beforeWater boundaryElements do: [ :e | self cache: e ].
		node afterWater boundaryElements do: [ :e | self cache: e ].
	]