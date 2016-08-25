statistics
upperHalf: list
	| mean |
	mean := self median: list.
	^ list select: [ :e | e >= mean ]