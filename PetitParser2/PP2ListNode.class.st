Class {
	#name : #PP2ListNode,
	#superclass : #PP2Node,
	#instVars : [
		'children'
	],
	#category : 'PetitParser2-Nodes'
}

{ #category : #'as yet unclassified' }
PP2ListNode class >> with: aParser [
	^ self withAll: (Array with: aParser)
]

{ #category : #'as yet unclassified' }
PP2ListNode class >> with: aFirstParser with: aSecondParser [
	^ self withAll: (Array with: aFirstParser with: aSecondParser)
]

{ #category : #'as yet unclassified' }
PP2ListNode class >> withAll: aCollection [
	^ self new
		children: aCollection;
		yourself
]

{ #category : #visiting }
PP2ListNode >> accept: aPP2Visitor [
	^ self subclassResponsibility
]

{ #category : #accessing }
PP2ListNode >> children [
	^ children
]

{ #category : #accessing }
PP2ListNode >> children: aCollection [
	^ children := aCollection
]

{ #category : #copying }
PP2ListNode >> copyWith: aParser [
	^ self species withAll: (children copyWith: aParser)
]

{ #category : #accessing }
PP2ListNode >> firstChild [
	^ self children at: 1
]

{ #category : #initialization }
PP2ListNode >> initialize [
	super initialize.
	self children: #()
]

{ #category : #copying }
PP2ListNode >> postCopy [
	super postCopy.
	children := children copy
]

{ #category : #transforming }
PP2ListNode >> replace: child with: anotherChild [
	children keysAndValuesDo: [ :index :e |
		e == child ifTrue: [ children at: index put: anotherChild ] 
	]
]

{ #category : #accessing }
PP2ListNode >> secondChild [
	^ self children at: 2
]

{ #category : #accessing }
PP2ListNode >> thirdChild [
	^ self children at: 3
]
