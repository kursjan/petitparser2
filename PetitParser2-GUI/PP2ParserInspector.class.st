"
This browser expects an instance of PPParser in the #entity port.

self openOn: PPArithmeticParser new.
"
Class {
	#name : #PP2ParserInspector,
	#superclass : #GLMCompositePresentation,
	#category : 'PetitParser2-GUI-Browser'
}

{ #category : #'as yet unclassified' }
PP2ParserInspector class >> openOn: aParserInstance [
	^ self new openOn: aParserInstance
]

{ #category : #'private building' }
PP2ParserInspector >> browserStructureFor: browser [
	browser
		column: #sample;
		column: #inspectors
]

{ #category : #building }
PP2ParserInspector >> compose [
	"
	self new openOn: PP2ExpressionParser new
	"

	self title: [ :each | 'Parser Inspector on ' , (each name ifNil: [ each class name ]) ].
	self tabulator
		with: [ :browser | 
			self browserStructureFor: browser.
			browser transmit
				fromOutsidePort: #entity;
				fromOutsidePort: #sampleText;
				to: #sample;
				andShowIfNone: [ :a | self sampleIn: a ].
			browser transmit
				from: #sample port: #text;
				toOutsidePort: #sampleText.
			browser transmit
				"from: #sample;"
				"passivelyFrom: #sample port: #text;"
				from: #sample port: #context;
				fromOutsidePort: #entity;
				to: #inspectors;
				andShow: [ :a | self inspectorsIn: a ].	"result (disabled)"	"sample text (disabled)" "context" "parser"
			browser transmit
				from: #inspectors;
				to: #sample port: #selectionInterval;
				transformed: [ :debugResultOrAnything | 
					"Please forgive me: Or better, teach me, how to transmit selection from treeView to #debugResult port"
					(debugResultOrAnything isKindOf: PP2DebugResult) ifTrue: [ 
						debugResultOrAnything startStopInterval ] 
				]
		]
]

{ #category : #'private building' }
PP2ParserInspector >> gtWarningsIn: composite for: parser [
	<gtInspectorPresentationOrder: 50>
	
	parser allWarnings isEmpty ifTrue: [ ^ self ].

	parser gtWarningsIn: composite.
	composite presentations last
		display: [ :context | context parser allWarnings associations ]

]

{ #category : #'private building' }
PP2ParserInspector >> inspectorsIn: composite [
	composite dynamic 
		display: [ :context :parser |
			GLMCompositePresentation new with: [ :aComposite | 
				context gtResultIn: aComposite.
				context gtReport: aComposite.
				context gtTallyIn: aComposite.
				context gtTreeViewIn: aComposite.
				self  	  gtWarningsIn: aComposite for: parser.
			].
		].
]

{ #category : #'private building' }
PP2ParserInspector >> sampleIn: composite [
	(composite text)
		title: 'Sample';
		display: [:parser :sample | sample ifNil: [''] ];
		allowNil;
		populate: #selection
			icon: GLMUIThemeExtraIcons glamorousPlay
			on: $s
			entitled: 'Parse (s)'
			with: [ :presentation :parser | 
				| input context result |
				input := presentation text asString.
				context := PP2RecordingContext new.
				result := (parser deoptimize; debug: input withContext: context) value.
				
				(presentation pane port: #context) value: context.
				result 
			];
		populate: #selection
			icon: GLMUIThemeExtraIcons glamorousSpawn
			on: $o
			entitled: 'Parse Optimized (o)'
			with: [ :presentation :parser | 
				| input context result |
				input := presentation text asString.
				context := PP2RecordingContext new.
				result := (parser optimize; debug: input withContext: context) value.
				
				(presentation pane port: #context) value: context.
				result 
			]

]
