statistics
lowerHalf: list
	| return mean |
	mean := self median: list.
	return := list select: [ :e | e < mean ].
	
	return isEmpty ifTrue: [ return add: list anyOne ].
	^ return