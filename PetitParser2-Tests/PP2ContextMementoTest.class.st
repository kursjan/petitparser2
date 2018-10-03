Class {
	#name : #PP2ContextMementoTest,
	#superclass : #TestCase,
	#instVars : [
		'memento'
	],
	#category : 'PetitParser2-Tests-Core'
}

{ #category : #tests }
PP2ContextMementoTest >> testEquals [
	| anotherMemento |
	memento := PP2ContextMemento new.
	memento position: 1.
	memento propertyAt: #foo put: #bar.

	anotherMemento := PP2ContextMemento new.
	anotherMemento position: 1.
	anotherMemento propertyAt: #foo put: #bar.
	
	self assert: memento ~~ anotherMemento.
	self assert: memento = anotherMemento.
]

{ #category : #tests }
PP2ContextMementoTest >> testEqualsWithStack [
	| anotherMemento |
	memento := PP2ContextMemento new.
	memento position: 1.
	memento propertyAt: #foo put: Stack new.

	anotherMemento := PP2ContextMemento new.
	anotherMemento position: 1.
	anotherMemento propertyAt: #foo put: Stack new.
	
	self assert: memento ~~ anotherMemento.
	self assert: memento = anotherMemento.
]

{ #category : #tests }
PP2ContextMementoTest >> testHash [
	| anotherMemento |
	memento := PP2ContextMemento new.
	memento position: 1.
	memento propertyAt: #foo put: #bar.

	anotherMemento := PP2ContextMemento new.
	anotherMemento position: 1.
	anotherMemento propertyAt: #foo put: #bar.
	
	self assert: memento hash = anotherMemento hash.
]

{ #category : #tests }
PP2ContextMementoTest >> testMinus [
	| anotherMemento |
	memento := PP2ContextMemento new.
	memento position: 1.
	

	anotherMemento := memento - 1.
	
	self assert: memento ~~ anotherMemento.
	self assert: anotherMemento position equals: 0.
	self assert: memento position equals: 1.
]

{ #category : #tests }
PP2ContextMementoTest >> testPlus [
	| anotherMemento |
	memento := PP2ContextMemento new.
	memento position: 1.
	

	anotherMemento := memento + 1.
	
	self assert: memento ~~ anotherMemento.
	self assert: anotherMemento position equals: 2.
	self assert: memento position equals: 1.
]
