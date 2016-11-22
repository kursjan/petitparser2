*PetitParser2-GUI
gtEventsMorph: composite
	<gtInspectorPresentationOrder: 30>
	
	composite morph 
		title: 'Events Morph';
		display: [:result  | 
			| morph |
			morph := ScrollPane new.
			morph color: Color white.
			morph scroller addMorph: self asEventsMorph.
			morph ];
		act: [ :p :ctx | 
				| wrapper |	
				wrapper := GLMWrapper new.
				wrapper show: [:a | self gtEventsTable: a ].
				wrapper openOn: ctx.
			] icon: GLMUIThemeExtraIcons glamorousInspect entitled: 'Inspect in Table';
		yourself
