initialization
reset
	super reset.
	
	eventsTrace := PP2EventsTrace new.
	furthestPosition := -1.
	totalSize := 0.