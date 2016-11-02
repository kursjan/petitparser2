caching
cache: node
	node isCacheForbidden ifTrue: [ ^ self ].
	node changesContext ifTrue: [ ^ self ].
	
	node strategy: node strategy cache.