visiting
cache: node production: production
	| strategy |
	node child isCacheForbidden ifTrue: [ ^ self ].
	
	strategy := production strategy cache.
	node changeStrategy: strategy 