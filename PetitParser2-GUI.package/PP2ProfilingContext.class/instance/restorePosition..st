memoization
restorePosition: newPosition
	self event: #restorePosition.
	furthestPosition := (furthestPosition max: position).
	
	^ super restorePosition: newPosition