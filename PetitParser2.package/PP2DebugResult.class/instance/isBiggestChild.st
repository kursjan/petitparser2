printing
isBiggestChild
	parent isNil ifTrue: [ ^ false ].
	^ (parent children sort: [ :c1 :c2 | c1 allResults size > c2 allResults size ]) first == self