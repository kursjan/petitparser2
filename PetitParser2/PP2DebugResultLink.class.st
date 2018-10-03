Class {
	#name : #PP2DebugResultLink,
	#superclass : #Object,
	#instVars : [
		'reference'
	],
	#category : 'PetitParser2-Debug'
}

{ #category : #'instance creation' }
PP2DebugResultLink class >> on: aPP2DebugResult [
	^ (self new)
		reference: aPP2DebugResult;
		yourself
]

{ #category : #analysis }
PP2DebugResultLink >> allResults [
	^ #()
]

{ #category : #analysis }
PP2DebugResultLink >> allResultsTo: aSet [
	^ aSet
]

{ #category : #converting }
PP2DebugResultLink >> asEventsMorph [
	^ reference asEventsMorph
]

{ #category : #accessing }
PP2DebugResultLink >> children [
	^ Array with: reference 
]

{ #category : #accessing }
PP2DebugResultLink >> contents [
	^ reference contents
]

{ #category : #accessing }
PP2DebugResultLink >> debugResult [
	^ self
]

{ #category : #printing }
PP2DebugResultLink >> formattedText [
	^ Text string: self printString attribute: (TextColor new color: Color blue muchDarker)
]

{ #category : #printing }
PP2DebugResultLink >> printOn: aStream [ 
	super printOn: aStream.
	aStream nextPutAll: ': reference'
]

{ #category : #accessing }
PP2DebugResultLink >> reference [
	^ reference
]

{ #category : #accessing }
PP2DebugResultLink >> reference: anObject [
	reference := anObject
]

{ #category : #accessing }
PP2DebugResultLink >> startStopInterval [
	^ reference startStopInterval
]
