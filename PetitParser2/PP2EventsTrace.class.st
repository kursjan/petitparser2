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

{ #category : #'as yet unclassified' }
PP2EventsTrace >> colorForEvent: event [
	| eventSet |
	event == #namedInvoked ifTrue: [ ^ Color green muchDarker ].
	
	colors isNil ifTrue: [ 
		eventSet := (entries collect: #event) asIdentitySet asArray.
		self flag: 'JK: Dependency on Roassal? Should probably move this method!'.
		colors := (Smalltalk at: #RTMultiLinearColorForIdentity) new objects: eventSet.
	].
	^ colors 	rtValue: event
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

{ #category : #'as yet unclassified' }
PP2EventsTrace >> eventsMorph [
"	^ self eventsMorph: #(#uncheckedNext #uncheckedPeek #peek #next)"
	^ self eventsMorph: #(#namedInvoked)
]

{ #category : #'as yet unclassified' }
PP2EventsTrace >> eventsMorph: eventArray [
	| limit width height canvas morph heightIndex highlightStart highlightStop highlightColor |
	limit := self limit: eventArray.
	width  := (entries collect: #position) max min: 4096.
	height := limit min: 65535.
	canvas := FormCanvas extent: width @ height.
	morph := canvas form asMorph.
	heightIndex := 0.
	fEntries := OrderedCollection new.
	
	highlightStart := Stack with: SmallInteger maxVal.
	highlightStop := Stack with: SmallInteger maxVal.
	highlightColor := Color red muchLighter muchLighter.
	
	self interval do: [ :index |
		| entry |
		entry := entries at: index.

		(eventArray isNil or: [eventArray includes: entry event]) ifTrue: [ 
			fEntries addLast: entry.
			heightIndex := heightIndex + 1.
			
			(entry isInvocation and: [ 
			(entry node == self selectionNode) and: [ 
			(entry position == self selectionPosition) and: [ 
			(entry ~= self selection) ] ] ] ) ifTrue: [  
				highlightStart push: entry start.
				highlightStop push: entry stop.
				highlightColor := highlightColor darker.
			].
			index > highlightStop top ifTrue: [ 
				highlightColor := highlightColor lighter.
				highlightStop pop. 
				highlightStart pop 
			].

			(highlightStart top <= index and: [ highlightStop top >= index]) ifTrue: [  
				canvas line: 1 @ heightIndex to: width @ heightIndex color: highlightColor
			].

			(self selectionStart <= index and: [ self selectionStop >= index]) ifTrue: [  
				| color |
				color := Color yellow muchLighter.
				canvas line: 1 @ heightIndex to: width @ heightIndex color: color
			].


			canvas form 
				colorAt: entry position @ heightIndex 
				put: (self colorForEvent: entry event).
		]
	].

	morph := canvas form asMorph.
	morph on: #mouseMove
		send: #mouseDown:with:
		to: self.
		
	^ morph
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

{ #category : #'as yet unclassified' }
PP2EventsTrace >> mouseDown: anEvent with: aMorph [
	| location msg entry |
	location := anEvent position.
	(location  y < fEntries size and: [ location y > 0 ]) ifTrue: [ 
		entry := fEntries at: location y.
		msg := (entry position asString, ':', entry event, ': ', entry node asString).
		aMorph showBalloon: msg.
		Transcript cr; show: msg.
	]
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
