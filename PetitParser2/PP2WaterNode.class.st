Class {
	#name : #PP2WaterNode,
	#superclass : #PP2Node,
	#instVars : [
		'boundary',
		'waterToken'
	],
	#category : 'PetitParser2-Nodes'
}

{ #category : #accessing }
PP2WaterNode class >> boundary: aPP2Node [
	^ (self new) 
		boundary: aPP2Node;
		yourself
]

{ #category : #visiting }
PP2WaterNode >> accept: visitor [
	^ visitor visitWater: self
]

{ #category : #accessing }
PP2WaterNode >> boundary [
	^ boundary
]

{ #category : #accessing }
PP2WaterNode >> boundary: anObject [
	self boundaryElements: (self toCollection: anObject)

]

{ #category : #accessing }
PP2WaterNode >> boundaryElements [
	^ boundary children collect: #child
]

{ #category : #accessing }
PP2WaterNode >> boundaryElements: collectionOrElement [
	| elements |
	elements := collectionOrElement isCollection ifTrue: [ collectionOrElement ] ifFalse: [ OrderedCollection with: collectionOrElement ].
	"
		#rejectXYZ are optimizations. 
		
		This is kind of design issue, but I need to make seas at least a bit useable
		in in non-optimized mode as well.
	"
	elements := elements collect: [:e | self rejectSeas: e ].
	elements := elements collect: [:e | self rejectPossessive: e ].
	elements := elements collect: [:e | self nonEpsilon: e ].
	elements := elements collect: #and.
		
	boundary := (PP2ChoiceNode withAll: elements).
	
	self strategy isDebugging ifTrue: [ boundary enableDebug ]
]

{ #category : #accessing }
PP2WaterNode >> children [
	^ Array with: boundary with: waterToken 
]

{ #category : #initialization }
PP2WaterNode >> initialize [
	super initialize.
	
	waterToken := #any asPParser.
	boundary := (PP2ChoiceNode with: PP2EndOfInputNode new and).
]

{ #category : #private }
PP2WaterNode >> nonEpsilon: node [
	^ node isNullable ifTrue: [ node nonEpsilon  ] ifFalse: [ node ]
]

{ #category : #private }
PP2WaterNode >> rejectPossessive: node [
	^ node selfSkipDelegate isRepeating ifTrue: [ node child  ] ifFalse: [ node ]
]

{ #category : #private }
PP2WaterNode >> rejectSeas: nodeOrDelegate [
	| node |
	node := nodeOrDelegate selfSkipDelegate.
	
	^ node isSea ifTrue: [ node island  ] ifFalse: [ node ]
]

{ #category : #initialization }
PP2WaterNode >> resetStrategy [
	strategy := PP2Water on: self
]

{ #category : #private }
PP2WaterNode >> toCollection: object [
	object isCollection ifTrue: [ ^ object ].
	
	^ object asOrderedCollection
]

{ #category : #accessing }
PP2WaterNode >> waterToken [
	^ waterToken
]

{ #category : #accessing }
PP2WaterNode >> waterToken: anObject [
	waterToken := anObject
]
