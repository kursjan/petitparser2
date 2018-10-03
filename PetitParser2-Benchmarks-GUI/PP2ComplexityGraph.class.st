Class {
	#name : #PP2ComplexityGraph,
	#superclass : #Object,
	#instVars : [
		'report',
		'colors',
		'grapher',
		'legend'
	],
	#category : 'PetitParser2-Benchmarks-GUI-Graphs'
}

{ #category : #adding }
PP2ComplexityGraph >> addPlotData: ds [
	| rtData grouped mergeRange |
	"To avoid too many crosses nearby, group by hundreds:"
	mergeRange := self determineMergeRange: ds.
	grouped := ds groupedBy: [:e | (e size // mergeRange) * mergeRange ].
	grouped := grouped collect: [ :e | (e collect: #time) average ].

	rtData := RTData new.
	rtData dotShape 
		cross 
		color: (colors rtValue: ds).

	rtData points: grouped associations.
	rtData x: [:point | point key ].
	rtData y: [:point | point value ].
	grapher add: rtData.

	legend addColor: (colors rtValue: ds) text: ds anyOne name.
	
]

{ #category : #drawing }
PP2ComplexityGraph >> determineMergeRange: ds [
	^ ((ds collect: #size) max // 100) max: 1
]

{ #category : #drawing }
PP2ComplexityGraph >> draw [
	| datasets |
	grapher := RTGrapher new.
	grapher extent: 500 @ 500.

	"Legend"
	legend := RTLegendBuilder new.
	legend view: grapher view.
	legend addText: 'Time vs Input size'.

	datasets := report groupBy: #name.
	colors := RTMultiLinearColorForIdentity new objects: datasets values.

	datasets do: [:ds | 
		self addPlotData: ds
	].

	legend build.
	grapher build.
	^ grapher view
]

{ #category : #initialization }
PP2ComplexityGraph >> initialize [
	super initialize.
]

{ #category : #accessing }
PP2ComplexityGraph >> report [
	^ report
]

{ #category : #accessing }
PP2ComplexityGraph >> report: anObject [
	report := anObject
]
