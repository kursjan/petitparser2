memoization
restore: contextMemento
	furthestPosition := (furthestPosition max: position).
	^ super restore: contextMemento