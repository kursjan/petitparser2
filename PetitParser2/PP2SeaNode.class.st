Class {
	#name : #PP2SeaNode,
	#superclass : #PP2Node,
	#instVars : [
		'island',
		'beforeWater',
		'afterWater',
		'root'
	],
	#category : 'PetitParser2-Nodes'
}

{ #category : #'instance creation' }
PP2SeaNode class >> on: island [
	^ (self new)
		island: island;
		yourself
]

{ #category : #visiting }
PP2SeaNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitSea: self
]

{ #category : #accessing }
PP2SeaNode >> afterWater [
	^ afterWater 
]

{ #category : #accessing }
PP2SeaNode >> beforeWater [
	^ beforeWater
]

{ #category : #accessing }
PP2SeaNode >> children [
	^ Array with: beforeWater with: island with: afterWater
]

{ #category : #initialization }
PP2SeaNode >> initialize [
	super initialize.
	
	beforeWater := PP2WaterNode new
		waterToken: self waterToken;
		yourself.
	afterWater := PP2WaterNode new
		waterToken: self waterToken;
		yourself.

]

{ #category : #testing }
PP2SeaNode >> isMemoized [
	^ self strategies anySatisfy: [ :s | s isMemoized ]
]

{ #category : #testing }
PP2SeaNode >> isSea [
	^ true
]

{ #category : #accessing }
PP2SeaNode >> island [
	^ island
]

{ #category : #accessing }
PP2SeaNode >> island: anObject [
	island := anObject
]

{ #category : #'private - operators' }
PP2SeaNode >> nonEpsilon: node [
	^ node isNullable ifTrue: [ node nonEpsilon  ] ifFalse: [ node ]
]

{ #category : #transforming }
PP2SeaNode >> replace: node with: anotherNode [
	island == node ifTrue: [ island := anotherNode ].
	beforeWater == node ifTrue: [ beforeWater := anotherNode ].
	afterWater == node ifTrue: [ afterWater := anotherNode ]		
]

{ #category : #initialization }
PP2SeaNode >> reset: newContext [
	(root ~= newContext parser) ifTrue: [  
		self updateForRoot: newContext parser
	]
]

{ #category : #initialization }
PP2SeaNode >> resetStrategy [
	strategy := PP2Sea on: self
]

{ #category : #accessing }
PP2SeaNode >> root: newRoot [
	root := newRoot
]

{ #category : #boundaries }
PP2SeaNode >> updateAfterWater: rootParser [
	| next |
	self assert: rootParser isPetit2Parser.
	
	next := self nextSetIn: rootParser.
	afterWater boundaryElements: (OrderedCollection withAll: next)

]

{ #category : #boundaries }
PP2SeaNode >> updateBeforeWater: rootParser [
	| next elements |
	self assert: rootParser isPetit2Parser.

	next := self nextSetIn: rootParser.
	elements := OrderedCollection with: island.
	elements addAll: next.
	beforeWater	boundaryElements: elements.
	
]

{ #category : #initialization }
PP2SeaNode >> updateForRoot: newRoot [
	root := newRoot.
	self updateBeforeWater: root.
	self updateAfterWater: root
]

{ #category : #accessing }
PP2SeaNode >> waterToken [
	^ self propertyAt: #waterToken ifAbsent: [  
		#any asPParser 
	]
]

{ #category : #accessing }
PP2SeaNode >> waterToken: waterToken [
	self propertyAt: #waterToken put: waterToken.
	
	beforeWater waterToken: waterToken.
	afterWater waterToken: waterToken.
]
