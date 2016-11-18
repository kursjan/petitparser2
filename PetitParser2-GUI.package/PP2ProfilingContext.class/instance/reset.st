initialization
reset
	super reset.
	
	entries := OrderedCollection new.
	furthestPosition := -1.
	totalSize := 0.