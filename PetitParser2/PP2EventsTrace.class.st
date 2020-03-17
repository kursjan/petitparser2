Class {
	#name : #PP2EventsTrace,
	#superclass : #Object,
	#instVars : [
		'entries',
		'fEntries',
		'colors',
		'selection'
	],
	#category : 'PetitParser2-Recording'
}

{ #category : #adding }
PP2EventsTrace >> addLast: aPP2ProfilingEvent [
	entries addLast: aPP2ProfilingEvent 
]

{ #category : #accessing }
PP2EventsTrace >> entries [
	^ entries
]

{ #category : #accessing }
PP2EventsTrace >> entries: aCollection [
	entries := aCollection
]

{ #category : #enumerating }
PP2EventsTrace >> entriesCollect: aBlock [
	^ entries collect: aBlock
]

{ #category : #accessing }
PP2EventsTrace >> entriesCount [
	^ entries size
]

{ #category : #enumerating }
PP2EventsTrace >> entriesDo: aBlock [
	^ entries do: aBlock
]

{ #category : #accessing }
PP2EventsTrace >> entryAt: index [
	^ entries at: index
]

{ #category : #private }
PP2EventsTrace >> filterEvents: eventsCollection [
	fEntries := OrderedCollection new.
	self halt: 'obsolete?'.	
	self interval do: [ :index | | e |
		e := self entries at: index.
		(eventsCollection isNil or: [ eventsCollection includes: e event]) ifTrue: [
			fEntries add: e.
		]
	].
	
	^ fEntries
]

{ #category : #initialization }
PP2EventsTrace >> initialize [
	super initialize.
	
	entries := OrderedCollection new
]

{ #category : #accessing }
PP2EventsTrace >> interval [
"	
	(start isNil not and: [stop isNil not]) ifTrue: [ 
		^ (start to: stop)
	].
"
	^ 1 to: entries size.
]

{ #category : #accessing }
PP2EventsTrace >> last [
	^ entries last
]

{ #category : #accessing }
PP2EventsTrace >> limit: eventsCollection [
	| limit |
	
	eventsCollection isNil ifTrue: [ ^ entries size ].
	limit := 0.
		
	self interval do: [ :index | | e |
		e := self entries at: index.
		(eventsCollection includes: e event) ifTrue: [
			limit := limit + 1
		]
	].
	
	^ limit
]

{ #category : #accessing }
PP2EventsTrace >> selection [
	^ selection
]

{ #category : #accessing }
PP2EventsTrace >> selection: invocationEntry [
	selection := invocationEntry
]

{ #category : #accessing }
PP2EventsTrace >> selectionNode [
	^ selection isNil ifFalse: [ selection node ] ifTrue: [ nil  ]
]

{ #category : #accessing }
PP2EventsTrace >> selectionPosition [
	^ selection isNil ifFalse: [ selection position ] ifTrue: [ SmallInteger maxVal  ]
]

{ #category : #accessing }
PP2EventsTrace >> selectionStart [
	^ selection isNil ifFalse: [ selection start ] ifTrue: [ SmallInteger maxVal  ]
]

{ #category : #accessing }
PP2EventsTrace >> selectionStop [
	^ selection isNil ifFalse: [ selection stop ] ifTrue: [ SmallInteger minVal  ]
]

{ #category : #accessing }
PP2EventsTrace >> strategies [
	^ entries collect: #strategy
]
