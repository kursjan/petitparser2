Class {
	#name : #PP2Stack,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #'PetitParser2-Context'
}

{ #category : #accessing }
PP2Stack class >> elementsCollection [
	^ OrderedCollection new
]

{ #category : #comparing }
PP2Stack >> = anotherStack [
	(anotherStack isKindOf: PP2Stack) ifFalse: [  
		^ false
	].

	^ anotherStack elements = elements 
]

{ #category : #accessing }
PP2Stack >> elements [
	^ elements
]

{ #category : #comparing }
PP2Stack >> equals: anotherStack [
	(anotherStack isKindOf: PP2Stack) ifFalse: [  
		^ false
	].

	^ anotherStack elements = elements 
]

{ #category : #initialization }
PP2Stack >> initialize [
	super initialize.
	
	elements := PP2Stack elementsCollection.
]

{ #category : #removing }
PP2Stack >> isEmpty [
	^ elements isEmpty 
]

{ #category : #removing }
PP2Stack >> pop [
	^ elements removeLast
]

{ #category : #copying }
PP2Stack >> postCopy [
	"JK: I am not sure, if this works properly for optimized version!"
	super postCopy.
	
	elements := elements copy.
]

{ #category : #adding }
PP2Stack >> push: element [
	elements addLast: element.
	^ element
]

{ #category : #adding }
PP2Stack >> size [
	^ elements size
]

{ #category : #removing }
PP2Stack >> top [
	^ elements last
]
