Class {
	#name : #PP2StreamTest,
	#superclass : #TestCase,
	#traits : 'TPP2StreamContextInterface',
	#classTraits : 'TPP2StreamContextInterface classTrait',
	#category : 'PetitParser2-Tests-Streams'
}

{ #category : #running }
PP2StreamTest >> setUp [
	super setUp
]

{ #category : #running }
PP2StreamTest >> streamOn: collection [
	^ PP2Stream on: collection
]

{ #category : #'tests - context interface' }
PP2StreamTest >> testContents [
	| stream |
	stream := self streamOn: 'bar'. 
	
	self assert: stream contents equals: 'bar'.
]
