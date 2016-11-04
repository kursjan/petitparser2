caching
cache: node
	node isCacheForbidden ifTrue: [ ^ self ].
	node contextChanges isContextChange ifTrue: [ ^ self ].
	node isMemoized ifTrue: [ ^ self ].
	
	node strategy: node strategy cache.