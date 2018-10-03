Class {
	#name : #PP2RecordingContext,
	#superclass : #PP2InMemoryContext,
	#instVars : [
		'totalSize',
		'eventsTrace',
		'furthestPosition'
	],
	#category : 'PetitParser2-Recording'
}

{ #category : #converting }
PP2RecordingContext >> asCacheReport [
	| table |
	table := OrderedCollection new. 
	parser allCaches do: [ :c | 
		table add: (Array with: c with: c hitRatio with: c invocations).
	].

	^ table
]

{ #category : #converting }
PP2RecordingContext >> asEventsMorph [
	^ eventsTrace 
		selection: nil;
		eventsMorph
]

{ #category : #converting }
PP2RecordingContext >> asFrequencyTable [
	| bag total result |
	bag := (eventsTrace entriesCollect: #strategy) asBag.
	result := OrderedCollection new.
	bag isEmpty ifTrue: [ ^ result ].
	total := 100.0 / bag size.
	bag sortedCounts 
		do: [ :each | result addLast: (Array with: each value with: each key with: total * each key) ].
	^ result
]

{ #category : #converting }
PP2RecordingContext >> asFrequencyTableForEvent: event [
	| bag total result filtered |
	
	filtered := OrderedCollection new.
	eventsTrace entriesDo: [ :e | 
		event == e event ifTrue: [ filtered add: e strategy ]
	].
	
	bag := filtered asBag.
	result := OrderedCollection new.
	bag isEmpty ifTrue: [ ^ result ].
	total := 100.0 / bag size.
	bag sortedCounts 
		do: [ :each | result addLast: (Array with: each value with: each key with: total * each key) ].
	^ result
]

{ #category : #converting }
PP2RecordingContext >> asReportTable [
	| backtrackPerCharacter restoreCount rememberCount table lwRememberCount lwRestoreCount lwBacktrackPerCharacter |
	rememberCount := (self countFor: #remember).
	restoreCount := (self countFor: #restore).
	backtrackPerCharacter := (restoreCount / (totalSize max: 1) asFloat).

	lwRememberCount := (self countFor: #rememberPosition).
	lwRestoreCount := (self countFor: #restorePosition).
	lwBacktrackPerCharacter := (lwRestoreCount / (totalSize max: 1) asFloat).

	table := OrderedCollection new. 
	table add: (Array with: totalSize with: #'total stream size' with: totalSize).

	table add: (Array with: backtrackPerCharacter with: #'backtrack per character' with: backtrackPerCharacter).
	table add: (Array with: rememberCount with: #'remember count' with: rememberCount).
	table add: (Array with: restoreCount with: #'restore count' with: restoreCount).

	table add: (Array with: lwBacktrackPerCharacter with: #'lightweight backtrack per character' with: lwBacktrackPerCharacter).
	table add: (Array with: lwRememberCount with: #'lightweight remember count' with: lwRememberCount).
	table add: (Array with: lwRestoreCount with: #'lightweight restore count' with: lwRestoreCount).

	^ table
]

{ #category : #recording }
PP2RecordingContext >> cacheHit [
	self event: #cacheHit
]

{ #category : #reporting }
PP2RecordingContext >> countFor: event [
	| count |
	count := 0.
	self eventsTrace entriesDo: [ :e |
		(e event == event) ifTrue: [ count := count + 1 ].
	].
	^ count
]

{ #category : #accessing }
PP2RecordingContext >> event: value [
	| entry |

	entry := PP2EventRecord new
		position: self position;
		strategy: self strategy;
		event: value;
		yourself.
		
	eventsTrace addLast: entry
]

{ #category : #converting }
PP2RecordingContext >> eventsTable [
	| trace |
	trace := OrderedCollection new.
	1 to: (10*1000 min: eventsTrace entriesCount) do: [ :index | 
		trace addLast: { 
			(eventsTrace entryAt: index) position . 
			(eventsTrace entryAt: index) event . 
			(eventsTrace entryAt: index) strategy .
			(eventsTrace entryAt: index) node 
		}
	].

	^ trace
]

{ #category : #accessing }
PP2RecordingContext >> eventsTrace [
	^ eventsTrace 
]

{ #category : #accessing }
PP2RecordingContext >> furthestPosition [
	^ furthestPosition max: position
]

{ #category : #accessing }
PP2RecordingContext >> furthestPosition: anObject [
	furthestPosition := anObject
]

{ #category : #initialization }
PP2RecordingContext >> initialize [
	super initialize.
	self reset.
]

{ #category : #reporting }
PP2RecordingContext >> invocationCount [
	^  self countFor: #methodInvoked
]

{ #category : #events }
PP2RecordingContext >> invoked [
	| entry |

	entry := PP2InvocationRecord new
		position: self position;
		strategy: self strategy;
		event: #invoked;
		yourself.
		
	eventsTrace addLast: entry
]

{ #category : #testing }
PP2RecordingContext >> isRecording [
	^ true
]

{ #category : #accessing }
PP2RecordingContext >> lastDebugResult [
	^ (self currentDebugResult children) isEmpty ifTrue: [ 
		nil
	] ifFalse: [
		self currentDebugResult children last
	]
]

{ #category : #events }
PP2RecordingContext >> namedInvoked [
	| entry |

	entry := PP2InvocationRecord new
		position: self position;
		strategy: self strategy;
		event: #namedInvoked;
		yourself.
		
	eventsTrace addLast: entry
]

{ #category : #accessing }
PP2RecordingContext >> next [
	self event: #next.
	furthestPosition := (furthestPosition max: position + 1).
	
	^ super next
]

{ #category : #accessing }
PP2RecordingContext >> next: number [
	self event: #next.
	furthestPosition := (furthestPosition max: position + number).
	
	^ super next: number
]

{ #category : #private }
PP2RecordingContext >> node [
	^ (thisContext findContextSuchThat: [ :ctxt | (ctxt receiver isKindOf: PP2AbstractStrategy)])
		ifNil: [ nil ]
		ifNotNil: [ :aContext |
			aContext receiver node
		].	

]

{ #category : #accessing }
PP2RecordingContext >> parser: aPP2Node [
	super parser: aPP2Node.
	
	"Transform to recording strategies"
	aPP2Node enableRecording.
]

{ #category : #accessing }
PP2RecordingContext >> position: value [
	self assert: value isInteger.
	super position: value
]

{ #category : #events }
PP2RecordingContext >> remember [
	self event: #remember.
	^ super remember
]

{ #category : #memoization }
PP2RecordingContext >> rememberPosition [
	self event: #rememberPosition.
	^ super rememberPosition
]

{ #category : #initialization }
PP2RecordingContext >> reset [
	super reset.
	
	eventsTrace := PP2EventsTrace new.
	furthestPosition := -1.
	totalSize := 0.
]

{ #category : #memoization }
PP2RecordingContext >> restore: whatever [
	self event: #restore.
	furthestPosition := (furthestPosition max: position).
	^ super restore: whatever
]

{ #category : #memoization }
PP2RecordingContext >> restorePosition: newPosition [
	self event: #restorePosition.
	furthestPosition := (furthestPosition max: position).
	
	^ super restorePosition: newPosition
]

{ #category : #requirements }
PP2RecordingContext >> setAsStartState [
	^ self startMemento: super remember
]

{ #category : #private }
PP2RecordingContext >> strategy [
	^ (thisContext findContextSuchThat: [ :ctxt | (ctxt receiver isKindOf: PP2AbstractStrategy)])
		ifNil: [ PP2NilStrategy new ]
		ifNotNil: [ :aContext | aContext receiver ].	

]

{ #category : #accessing }
PP2RecordingContext >> stream: aStream [
	super stream: aStream.

	totalSize := totalSize + readLimit.

]

{ #category : #accessing }
PP2RecordingContext >> totalSize [
	^ totalSize
]

{ #category : #events }
PP2RecordingContext >> uncheckedNext [
	self event: #uncheckedNext.
	^ super uncheckedNext
]

{ #category : #events }
PP2RecordingContext >> uncheckedPeek [
	self event: #uncheckedPeek.
	^ super uncheckedPeek
]
