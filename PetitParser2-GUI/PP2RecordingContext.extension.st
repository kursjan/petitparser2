Extension { #name : #PP2RecordingContext }

{ #category : #'*PetitParser2-GUI' }
PP2RecordingContext >> gtCacheReport: composite [
	<gtInspectorPresentationOrder: 40>
	composite table 
		title: 'Caches';
		column: 'Cache' evaluated: [ :each | each first printString ];
		column: 'Hit Rate' evaluated: [ :each | each second printString ];
		column: 'Invocations' evaluated: [ :each | each third printString ];
		display: [:context | context asCacheReport  ];
		selectionAct: [ :list :warning | list selection inspect] on: $i entitled: 'Inspect (i)'
]

{ #category : #'*PetitParser2-GUI' }
PP2RecordingContext >> gtEventsMorph: composite [
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

]

{ #category : #'*PetitParser2-GUI' }
PP2RecordingContext >> gtEventsTable: composite [
	<gtInspectorPresentationOrder: 30>
	composite table 
		title: 'Events Table';
		column: 'Position' evaluated: [ :each | each first printString ];
		column: 'Event' evaluated: [ :each | each second printString ];
		column: 'Strategy' evaluated: [ :each | each third printString ];
		column: 'Node' evaluated: [ :each | each fourth printString ];
		display: [:context | context eventsTable ].
]

{ #category : #'*PetitParser2-GUI' }
PP2RecordingContext >> gtRememberTallyIn: composite [
	<gtInspectorPresentationOrder: 34>

	composite table 
		title: 'Remember Tally';
		column: 'Selector/Parser' evaluated: [ :each | each first printString ];
		column: 'Count' evaluated: [ :each | each second printString ];
		column: 'Percentage (%)' evaluated: [ :each | each third printString ];
		display: [ self asFrequencyTableForEvent: #remember ];
"		noSelection;"
		showOnly: 50
]

{ #category : #'*PetitParser2-GUI' }
PP2RecordingContext >> gtReport: composite [
	<gtInspectorPresentationOrder: 40>
	composite table 
		title: 'Report';
		column: 'Info' evaluated: [ :each | each second printString ];
		column: 'Value' evaluated: [ :each | each third printString ];
		display: [:context | context asReportTable ];
		selectionAct: [ :list :warning | list selection inspect] on: $i entitled: 'Inspect (i)'
]

{ #category : #'*PetitParser2-GUI' }
PP2RecordingContext >> gtTallyIn: composite [
	<gtInspectorPresentationOrder: 35>
	composite table 
		title: 'Global Tally';
		column: 'Strategy' evaluated: [ :each | each first displayName ];
		column: 'Count' evaluated: [ :each | each second printString ];
		column: 'Percentage (%)' evaluated: [ :each | each third printString ];
		display: [ self asFrequencyTable ];
		selectionAct: [ :list :context | list selection first inspect] on: $i entitled: 'Inspect (i)';
		act: [ :p :ctx | ctx asFrequencyTable inspect ] icon: GLMUIThemeExtraIcons glamorousInspect entitled: 'Inspect';
		showOnly: 50
]
