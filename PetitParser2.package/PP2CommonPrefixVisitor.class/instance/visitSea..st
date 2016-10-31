visiting
visitSea: node

	(self cacheMakesSense: node island) ifTrue: [  
		self cache: node island production: node island.
		
		node beforeWater boundaryElements do: [ :e | self cache: e production: e ].
		node afterWater boundaryElements do: [ :e | self cache: e production: e ].
	]