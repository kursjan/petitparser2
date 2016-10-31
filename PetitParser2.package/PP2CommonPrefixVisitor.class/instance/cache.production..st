caching - choice
cache: node production: production
	| strategy |
	node isCacheForbidden ifTrue: [ ^ self ].
	
	strategy := production strategy cache.
	node changeStrategy: strategy 