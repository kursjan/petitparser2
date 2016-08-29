gt
eventsIn: composite
	<gtInspectorPresentationOrder: 30>
	composite morph 
		title: 'Parsing Events';
		display: [:result :sample :stream :parser  | 
			| morph |
			morph := ScrollPane new.
			morph color: Color white.
			morph scroller addMorph: self asEventMorph.
			morph ]