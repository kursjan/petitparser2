converting
asEventMorph
	self halt: 'deprecated, use #asEventsMorph'.
	^ PP2EventsTrace new
		startPosition: 1;
		stopPosition: (positions size);
		events: events;
		positions: positions;
		selectors: strategies;
		eventsMorph.