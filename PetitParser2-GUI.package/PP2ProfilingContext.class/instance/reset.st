initialization
reset
	super reset.
	
	events := OrderedCollection new.
	positions := OrderedCollection new.
	nodes := OrderedCollection new.
	strategies := OrderedCollection new.
	
	furthestPosition := -1.
	totalSize := 0.