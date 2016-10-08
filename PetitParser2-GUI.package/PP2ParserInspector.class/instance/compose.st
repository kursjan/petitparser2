building
compose
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