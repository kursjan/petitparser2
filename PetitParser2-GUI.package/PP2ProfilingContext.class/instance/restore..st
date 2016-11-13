memoization
restore: whatever
	self event: #restore.
	furthestPosition := (furthestPosition max: position).
	^ super restore: whatever