memoization
restorePosition: contextMemento
	furthestPosition := (furthestPosition max: position).
	^ super restorePosition: contextMemento