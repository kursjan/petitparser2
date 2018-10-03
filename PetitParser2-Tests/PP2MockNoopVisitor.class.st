Class {
	#name : #PP2MockNoopVisitor,
	#superclass : #PP2NoopVisitor,
	#instVars : [
		'visitOrder'
	],
	#category : 'PetitParser2-Tests-Core'
}

{ #category : #initialization }
PP2MockNoopVisitor >> initialize [
	super initialize.
	
	visitOrder := OrderedCollection new
]

{ #category : #accessing }
PP2MockNoopVisitor >> visitOrder [
	^ visitOrder
]

{ #category : #visiting }
PP2MockNoopVisitor >> visitPP2Node: aPP2Node [
	visitOrder add: aPP2Node.
	
	^ super visitPP2Node: aPP2Node
]
