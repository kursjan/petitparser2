analysis - first
firstCharSet
	^ (literal = '') ifTrue: [ 
		PP2CharSetPredicate any
	] ifFalse: [ 
		PP2CharSetPredicate on: [ :e | self literal first = e ]
	]