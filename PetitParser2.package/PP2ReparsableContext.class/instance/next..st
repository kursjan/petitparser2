accessing
next: integer
	furthestPosition := (furthestPosition max: position + integer).
	^ super next: integer