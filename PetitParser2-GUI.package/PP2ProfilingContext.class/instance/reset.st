initialization
reset
	super reset.
	
	events := OrderedCollection new.
	positions := OrderedCollection new.
	selectors := OrderedCollection new.
	strategies := OrderedCollection new.
	
	colors := nil.
	totalSize := 0.