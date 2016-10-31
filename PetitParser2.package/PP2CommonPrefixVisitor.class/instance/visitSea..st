visiting
visitSea: node

	(self cacheMakesSense: node island) ifTrue: [  
		self cache: node island production: node island
	]