converting
asEventsMorph
	^ PP2EventsTrace new
		startPosition: 1;
		stopPosition: (entries size);
		entries: entries;
		eventsMorph.