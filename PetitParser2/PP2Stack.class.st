Class {
	#name : #PP2Stack,
	#superclass : #Stack,
	#instVars : [
		'size'
	],
	#category : 'PetitParser2-Context'
}

{ #category : #'as yet unclassified' }
PP2Stack >> initialize [
	super initialize.
	
	size := 0
]

{ #category : #removing }
PP2Stack >> pop [
	size := size - 1.
	super pop
]

{ #category : #adding }
PP2Stack >> push: element [
	size := size + 1.
	super push: element
]

{ #category : #accessing }
PP2Stack >> size [
	^ size
]
