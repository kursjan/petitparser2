Extension { #name : #TPP2Debuggable }

{ #category : #'*PetitParser2-GUI' }
TPP2Debuggable >> contents [
	self explicitRequirement
]

{ #category : #'*PetitParser2-GUI' }
TPP2Debuggable >> gtDebugView: composite [
	<gtInspectorPresentationOrder: 40>

	| browser |
	self allowsDebug ifFalse: [ ^ self ].
	
	browser := composite tabulator.
	browser title: 'Debug View'.
	browser row: #tree;
			  row: #tabs.

	browser transmit 
		to: #tree;
		andShow: [ :a | self gtTreeViewIn: a ].

	browser transmit
		to: #tabs;
		andShow: [ :a | self gtTabsIn: a ].

	browser transmit 
		from: #tree;
		to: #tabs.
		
	browser startOn: self
]

{ #category : #'*PetitParser2-GUI' }
TPP2Debuggable >> gtSampleIn: composite result: result [
	
	(composite text)
		title: 'Sample';
		display: [:context | context contents ];
		initialize: [ :text | text selectionInterval: result debugResult startStopInterval ];
		allowNil.
]

{ #category : #'*PetitParser2-GUI' }
TPP2Debuggable >> gtTabsIn: composite [

	composite tabulator with: [ :tabulator |
		tabulator column: #one.
		
		tabulator transmit to: #one; andShow: [ :a :b |  
			self gtSampleIn: a result: b.
			self gtTraceIn: a. 
		].
	]
]

{ #category : #'*PetitParser2-GUI' }
TPP2Debuggable >> gtTraceIn: composite [

	(composite morph)
		title: 'Traces';
		display: [:result  | 
			| morph |
			morph := ScrollPane new.
			morph color: Color white.
			morph scroller addMorph: result asEventsMorph.
			morph ];
		yourself
]

{ #category : #'*PetitParser2-GUI' }
TPP2Debuggable >> gtTreeViewIn: composite [
	composite tree
		title: 'Execution Traces';
		display: [ :context | context debugResult children first ];
		when: [ :context | context debugResult children notEmpty ];
		format: [:debuggerResult | debuggerResult  formattedText ];
		selectionAct: [ :presentation | presentation selection inspect ] entitled: 'Inspect';
		selectionAct: [ :presentation | presentation selection asEventsMorph inspect ] entitled: 'Events' enabledWhen: [:presentation | presentation selection hasEvents ];
		children: [:debuggerResult | debuggerResult children ]
]
