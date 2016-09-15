gt
gtEventsIn: composite
	<gtInspectorPresentationOrder: 30>
	composite morph 
		title: 'Parsing Events';
		display: [:result :sample :stream  | 
			| morph |
			morph := ScrollPane new.
			morph color: Color white.
			morph scroller addMorph: self asEventMorph.
			morph ];
		act: [ :p :ctx | 
				| wrapper |	
				wrapper := GLMWrapper new.
				wrapper show: [:a | self gtEventsTable: a ].
				wrapper openOn: ctx.
			] icon: GLMUIThemeExtraIcons glamorousInspect entitled: 'Inspect in Table';
		yourself
