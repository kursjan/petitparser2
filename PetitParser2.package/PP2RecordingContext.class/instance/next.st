accessing
next
	self event: #next.
	furthestPosition := (furthestPosition max: position + 1).
	
	^ super next