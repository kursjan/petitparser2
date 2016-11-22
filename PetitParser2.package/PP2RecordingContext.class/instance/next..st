accessing
next: number
	self event: #next.
	furthestPosition := (furthestPosition max: position + number).
	
	^ super next: number