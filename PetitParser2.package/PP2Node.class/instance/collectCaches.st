optimizations - caching
collectCaches
	| caches |
	caches := IdentitySet new. 
	self allNodesDo: [ :c | c strategies do: [ :s | s isCache ifTrue: [ caches add: s ] ] ].
	^ caches asArray
