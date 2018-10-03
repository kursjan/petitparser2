Class {
	#name : #PP2FiveNumberSummaryGraph,
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
PP2FiveNumberSummaryGraph >> addPlotData: ds withName: name [
	| rtData summary |
	"To avoid too many crosses nearby, group by hundreds:"
	summary := report fiveNumberSummary: (self extractBlock value: ds).

	rtData := RTBoxPlotDataSet new.
	rtData points: summary.
	rtData model: name.
		
	"rtData boxShape color: (colors rtValue: name)."
	rtData boxLineShape color: (colors rtValue: name).

	grapher add: rtData.
	legend addColor: (colors rtValue: name) text: name.
	
]

{ #category : #drawing }
PP2FiveNumberSummaryGraph >> draw [
	| datasets |
	grapher := RTGrapher new.
"	grapher extent: 300 @ 300."

	"Legend"
	legend := RTLegendBuilder new.
	legend view: grapher view.
	legend addText: self title.

	datasets := report groupBy: #name.
	colors := RTMultiLinearColorForIdentity new objects: datasets keys.

	datasets keysAndValuesDo: [:name :data | 
		self addPlotData: data withName: name
	].

	grapher axisX 
		labelRotation: -30;
		labelConversion: [ :v | datasets keys at: v ifAbsent: '' ];
		numberOfTicks: (datasets keys size + 1);
		numberOfLabels: datasets keys size.
	grapher title: 'foo'.
"	legend build."
	grapher build.
	^ grapher view
]

{ #category : #initialization }
PP2FiveNumberSummaryGraph >> initialize [
	super initialize.
]

{ #category : #accessing }
PP2FiveNumberSummaryGraph >> report [
	^ report
]

{ #category : #accessing }
PP2FiveNumberSummaryGraph >> report: anObject [
	report := anObject
]

{ #category : #accessing }
PP2FiveNumberSummaryGraph >> title [
	self subclassResponsibility 
]
