Class {
	#name : #PP2DebugResult,
	#superclass : #Object,
	#traits : 'TPP2Debuggable',
	#classTraits : 'TPP2Debuggable classTrait',
	#instVars : [
		'parser',
		'result',
		'children',
		'parent',
		'start',
		'stop',
		'context',
		'allChildren',
		'furthestPosition',
		'invocationEntry'
	],
	#category : 'PetitParser2-Debug'
}

{ #category : #analysis }
PP2DebugResult >> allResults [
	^ allChildren ifNil: [  
		| collection |
		collection := IdentitySet new.
		self allResultsTo: collection.
		allChildren := collection	
	]

]

{ #category : #analysis }
PP2DebugResult >> allResultsTo: set [
	set add: self.
	self children do: [ :child | child allResultsTo: set ].
]

{ #category : #converting }
PP2DebugResult >> asEventsMorph [
	invocationEntry isNil ifTrue: [ ^ Morph new ].
	
	^ (self findContext eventsTrace)
		selection: invocationEntry;
		eventsMorph
]

{ #category : #accessing }
PP2DebugResult >> children [
	^ children
]

{ #category : #accessing }
PP2DebugResult >> children: anObject [
	children := anObject
]

{ #category : #accessing }
PP2DebugResult >> contents [
	^ self findContextContents
]

{ #category : #accessing }
PP2DebugResult >> context [
	
	^ context
]

{ #category : #accessing }
PP2DebugResult >> context: anObject [
	
	context := anObject
]

{ #category : #accessing }
PP2DebugResult >> debugResult [
	^ self
]

{ #category : #accessing }
PP2DebugResult >> findContext [
	
	context ifNil: [ ^ parent ifNotNil: [ parent findContext ] ].
	^ context
]

{ #category : #accessing }
PP2DebugResult >> findContextContents [
	^ (self findContext ifNotNil: [ :s | s contents ]) ifNil: [ '' ]
]

{ #category : #printing }
PP2DebugResult >> formattedText [
	self result isPetit2Failure ifTrue: [ 
		^ Text string: self printString attribute: TextColor gray 
	].
	
	(self isBiggestChild) ifTrue: [  
		^ Text string: self printString attribute: (TextColor new color: Color red muchDarker)
	].
	
	^ self printString
]

{ #category : #accessing }
PP2DebugResult >> furthestPosition [
	^ furthestPosition
]

{ #category : #accessing }
PP2DebugResult >> furthestPosition: anObject [
	furthestPosition := anObject
]

{ #category : #initialization }
PP2DebugResult >> initialize [ 
	children := OrderedCollection new
]

{ #category : #accessing }
PP2DebugResult >> invocationEntry [
	self flag: 'JK: I don''t like the cyclic dependency between debug result and profiling info. Is there a better architecture for this?'.
	
	^ invocationEntry
]

{ #category : #accessing }
PP2DebugResult >> invocationEntry: entry [
	invocationEntry := entry
]

{ #category : #printing }
PP2DebugResult >> isBiggestChild [
	parent isNil ifTrue: [ ^ false ].
	^ (parent children sort: [ :c1 :c2 | c1 allResults size > c2 allResults size ]) first == self
]

{ #category : #accessing }
PP2DebugResult >> parent [
	^ parent
]

{ #category : #accessing }
PP2DebugResult >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
PP2DebugResult >> parser [
	^ parser
]

{ #category : #accessing }
PP2DebugResult >> parser: anObject [
	parser := anObject
]

{ #category : #printing }
PP2DebugResult >> printOn: aStream [ 
	self parser ifNil: [ ^ super printOn: aStream ].
	aStream 
		nextPutAll: self parser displayName;
		nextPutAll: '[';
		nextPutAll: self parser withoutDebugStrategy displayName;	"first ones are the debugging ones, skip them"
		nextPutAll: ']';
		nextPutAll: '(';
		nextPutAll: self allResults size asString;
"		nextPutAll: ':';
		nextPutAll: self events size asString;
"		nextPutAll: ')';
		nextPutAll: ' - ';   
		nextPutAll: (self result printStringLimitedTo: 50).

]

{ #category : #accessing }
PP2DebugResult >> result [
	^ result
]

{ #category : #accessing }
PP2DebugResult >> result: anObject [
	result := anObject
]

{ #category : #accessing }
PP2DebugResult >> start [
	^ start
]

{ #category : #accessing }
PP2DebugResult >> start: anObject [
	start := anObject
]

{ #category : #accessing }
PP2DebugResult >> startStopInterval [
	(start isNil or: [stop isNil]) ifTrue: [ ^ 1 to: 0 ].
	
	^ start to: stop 
]

{ #category : #analysis }
PP2DebugResult >> steps [
	^ self allResults size
]

{ #category : #accessing }
PP2DebugResult >> stop [
	^ stop
]

{ #category : #accessing }
PP2DebugResult >> stop: anObject [
	stop := anObject
]
