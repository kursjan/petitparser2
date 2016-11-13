initialization
reset
	super reset.
	
	events := OrderedCollection new.
	positions := OrderedCollection new.
	nodes := OrderedCollection new.
	strategies := OrderedCollection new.
	
	furthestPosition := -1.
	colors := nil.
	totalSize := 0.