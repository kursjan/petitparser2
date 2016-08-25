statistics
withoutMax: list
	| max new |
	(list size <= 1) ifTrue: [ ^ list ].
	
	max := self max: list.
	new := list copy asOrderedCollection.
	new remove: max.
	^ new