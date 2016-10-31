caching
cacheIfMakesSense: node
	(self cacheMakesSense: node) ifTrue: [  
		self cache: node
	]