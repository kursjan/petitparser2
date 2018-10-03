Class {
	#name : #PP2BenchmarkReport,
	#superclass : #Object,
	#instVars : [
		'entries'
	],
	#category : 'PetitParser2-Benchmarks-Core'
}

{ #category : #logging }
PP2BenchmarkReport >> addEntry: entry [
	entries add: entry
]

{ #category : #logging }
PP2BenchmarkReport >> addEntry: parserName size: inputSize time: milliseconds [
	self addEntry: parserName size: inputSize time: milliseconds gcTime: 0
]

{ #category : #logging }
PP2BenchmarkReport >> addEntry: parserName size: inputSize time: milliseconds gcTime: gcMilliseconds [
	| entry |
	entry := PP2BenchmarkEntry new
		name: parserName ;
		size: inputSize ;
		time: milliseconds ;
		gcTime: gcMilliseconds ;
		timestamp: DateAndTime current.
		
	self addEntry: entry
]

{ #category : #converting }
PP2BenchmarkReport >> asString [
	| stream |
	stream := WriteStream on: ''.
	self show: stream.
	^ stream contents
]

{ #category : #statistics }
PP2BenchmarkReport >> fiveNumberSummary: list [
	| median min max lowerQuartile upperQuartile |
	median := self median: list.
	min := self min: list.
	max := self max: list.
	lowerQuartile := self lowerQuartile: list.
	upperQuartile := self upperQuartile: list.
	
	^ {  min . lowerQuartile . median . upperQuartile . max } 
]

{ #category : #summary }
PP2BenchmarkReport >> gcTimesFrom: subentries [
	^ subentries collect: #gcTime
]

{ #category : #summary }
PP2BenchmarkReport >> groupBy: fieldName [
	| dictionary |
	dictionary := OrderedDictionary new.
	entries do: [ :e |
		| collection |
		collection := dictionary at: (e perform: fieldName) ifAbsentPut: [ OrderedCollection new ].
		collection add: e.
	].
	^ dictionary
]

{ #category : #initialization }
PP2BenchmarkReport >> initialize [
	entries := OrderedCollection new
]

{ #category : #statistics }
PP2BenchmarkReport >> lowerHalf: list [
	| return mean |
	mean := self median: list.
	return := list select: [ :e | e < mean ].
	
	return isEmpty ifTrue: [ return add: list anyOne ].
	^ return
]

{ #category : #statistics }
PP2BenchmarkReport >> lowerQuartile: list [
	^ self mean: (self lowerHalf: list)
]

{ #category : #statistics }
PP2BenchmarkReport >> max: list [
	^ list max
]

{ #category : #statistics }
PP2BenchmarkReport >> mean: list [
	^ list average
]

{ #category : #statistics }
PP2BenchmarkReport >> median: list [
	| sorted size |
	sorted := list sort.
	size := sorted size.
	^ (size % 2 = 0) ifTrue: [ 
		((sorted at: (size // 2)) + (sorted at: ((size // 2) + 1))) / 2
	] ifFalse: [ 
		sorted at: (size // 2) + 1
	]


]

{ #category : #statistics }
PP2BenchmarkReport >> min: list [
	^ list min
]

{ #category : #reporting }
PP2BenchmarkReport >> printFiveNumberSummary: summary on: stream [
	"expeted: min, q1 mean q3 max"
	^ self printNumberSummary: summary on: stream 
]

{ #category : #reporting }
PP2BenchmarkReport >> printNumberSummary: summary on: stream [
	"expeted: min, q1 mean q3 max"

	summary do: [ :e | 
		stream 
			nextPut: Character tab;
			nextPutAll: (e printShowingDecimalPlaces: 3);
			yourself
	]
]

{ #category : #reporting }
PP2BenchmarkReport >> save: filename [
	| file    |
	file := FileStream forceNewFileNamed: filename.
	self show: file.
	file close.
]

{ #category : #'reporting complexity' }
PP2BenchmarkReport >> saveComplexity: filename [
	| file    |
	file := FileStream forceNewFileNamed: filename.
	self saveComplexityStream: file.
	file close.
]

{ #category : #'reporting complexity' }
PP2BenchmarkReport >> saveComplexityEntries: subentries stream: stream [
	| entry time gcTime |
	entry := subentries anyOne.
	time := self mean: (subentries collect: #time).
	gcTime := self mean: (subentries collect: #gcTime).
	
	stream 
		nextPutAll: entry name;
		nextPut: Character tab;
		nextPutAll: entry size asString;
		nextPut: Character tab;
		nextPutAll: time asFloat asString;
		nextPut: Character tab;
		nextPutAll: gcTime asFloat asString;
		nextPut: Character lf;
		flush
]

{ #category : #'reporting complexity' }
PP2BenchmarkReport >> saveComplexityStream: stream [
	(self groupBy: #size) keysAndValuesDo: [ :size :subentries |
		self saveComplexityEntries: subentries stream: stream
	]
]

{ #category : #reporting }
PP2BenchmarkReport >> saveEntriesNamed: name entries: subentries stream: stream [
	| size  timeSummary timeWithoutGCSummary gcSummary |

	size := (self sizesFrom: subentries) anyOne.
	timeSummary := self fiveNumberSummary: (self withoutMax: (self timesFrom: subentries)).
	timeWithoutGCSummary := self fiveNumberSummary: (self withoutMax: (self timesWithoutGCFrom: subentries)).
	gcSummary := self fiveNumberSummary: (self withoutMax: (self gcTimesFrom: subentries)).	
	
	stream
			nextPutAll: name;
			"With GC"
			nextPut: Character tab;
			nextPutAll: 'with gc'.
	self printFiveNumberSummary: (timeSummary collect: [ :e | e / size * 1000 ]) on: stream.
	stream
			"Without GC"
			nextPut: Character tab;
			nextPutAll: 'without gc'.
	self printFiveNumberSummary: (timeWithoutGCSummary collect: [ :e | e / size * 1000 ]) on: stream.
	stream
			"GC TIMES"
			nextPut: Character tab;
			nextPutAll: 'gc'.
	self printFiveNumberSummary: (gcSummary collect: [ :e | e / size * 1000 ]) on: stream.
	stream
			nextPutAll: String lf;
			flush.
]

{ #category : #reporting }
PP2BenchmarkReport >> show [
	Transcript show: '============'; cr.
	self show: Transcript
]

{ #category : #reporting }
PP2BenchmarkReport >> show: stream [
	(self groupBy: #name) keysAndValuesDo: [ :name :subentries |
		self saveEntriesNamed: name entries: subentries stream: stream
	].


]

{ #category : #'reporting complexity' }
PP2BenchmarkReport >> showComplexity [
	self saveComplexityStream: Transcript
]

{ #category : #reporting }
PP2BenchmarkReport >> showDetailed [
	(self groupBy: #name) keysAndValuesDo: [ :name :subentries |
		self showEntries: subentries
	]
]

{ #category : #reporting }
PP2BenchmarkReport >> showEntries: subentries [
	subentries do: [ :e | 
		self showEntry: e
	]
]

{ #category : #reporting }
PP2BenchmarkReport >> showEntry: entry [

	Transcript crShow: 'Size: ', entry size asString.
	Transcript crShow: entry name, ' time: ', entry time asString.
	Transcript crShow: 'Time per character: ', (entry tpc * 1000.0) asString, ' microseconds'.
	
	Transcript crShow: 'GC time: ', (entry gcTime) asString, 'ms'.
]

{ #category : #accessing }
PP2BenchmarkReport >> size [
	^ entries size
]

{ #category : #summary }
PP2BenchmarkReport >> sizesFrom: subentries [
	^ subentries collect: #size
]

{ #category : #reporting }
PP2BenchmarkReport >> speedup [
	self speedup: Transcript
]

{ #category : #reporting }
PP2BenchmarkReport >> speedup: stream [
	| grouped firstKey first firstName related relatedName |
	grouped := (self groupBy: #name).
	firstKey := grouped orderedKeys first.
	first := (self fiveNumberSummary: (self timesFrom: (grouped at: firstKey))) first.
	firstName := (grouped at: firstKey) anyOne name. 
	
	grouped orderedKeys allButFirstDo: [ :key | 
		key isNil ifFalse: [ 
			related := (self fiveNumberSummary: (self timesFrom: (grouped at: key))) first.
			relatedName := (grouped at: key) anyOne name.
		
			stream nextPutAll: firstName, ' vs ', relatedName, ' speedup: ', ((first / related) asFloat printShowingDecimalPlaces: 3).
			stream nextPutAll: String lf.
		]
	].
	stream flush.
]

{ #category : #statistics }
PP2BenchmarkReport >> standardDeviation: data [
	^ (self variance: data)	sqrt
]

{ #category : #reporting }
PP2BenchmarkReport >> time: timeValue characters: size [
	^ (timeValue / size * 1000) printShowingDecimalPlaces: 3
]

{ #category : #summary }
PP2BenchmarkReport >> timesFrom: subentries [
	^ subentries collect: #time
]

{ #category : #summary }
PP2BenchmarkReport >> timesWithoutGCFrom: subentries [
	^ subentries collect: [:e | e time - e gcTime ]
]

{ #category : #summary }
PP2BenchmarkReport >> tpcsFrom: subentries [
	| size |
	size := (self sizesFrom: subentries) anyOne.
	^ (subentries collect: #time) collect: [ :e | e / size * 1000 ]
]

{ #category : #statistics }
PP2BenchmarkReport >> upperHalf: list [
	| mean |
	mean := self median: list.
	^ list select: [ :e | e >= mean ]
]

{ #category : #statistics }
PP2BenchmarkReport >> upperQuartile: list [
	^ self mean: (self upperHalf: list)
]

{ #category : #statistics }
PP2BenchmarkReport >> variance: data [
	| mean squaredDiffs |
	mean := self mean: data.
	squaredDiffs := data collect: [ :value | (value - mean) abs squared ].
	
	^ squaredDiffs average
]

{ #category : #statistics }
PP2BenchmarkReport >> withoutMax: list [
	| max new |
	(list size <= 1) ifTrue: [ ^ list ].
	
	max := self max: list.
	new := list copy asOrderedCollection.
	new remove: max.
	^ new
]

{ #category : #statistics }
PP2BenchmarkReport >> withoutWorst: list [
	^ list sort removeLast
]
