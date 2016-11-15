converting
asEventsMorph
	^ PP2EventsTrace new
		startPosition: 1;
		stopPosition: (positions size);
		events: events;
		positions: positions;
		selectors: strategies;
		eventsMorph.