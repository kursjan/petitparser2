seas optimizations
optimizedNextSet: node
	| nextSet |
	nextSet := self nextSet: node.
	nextSet := self removeSeas: nextSet.
	nextSet := self removeRepetitions: nextSet.
	nextSet := Set withAll: nextSet.
	
	^ nextSet