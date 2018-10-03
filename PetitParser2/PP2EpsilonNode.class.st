Class {
	#name : #PP2EpsilonNode,
	#superclass : #PP2Node,
	#classInstVars : [
		'instance'
	],
	#category : 'PetitParser2-Nodes'
}

{ #category : #accessing }
PP2EpsilonNode class >> instance [
	instance isNil ifTrue: [ 
		instance := PP2EpsilonNode basicNew initialize
	].
	instance resetStrategies.
	^ instance
]

{ #category : #'instance creation' }
PP2EpsilonNode class >> new [
	^ self instance
]

{ #category : #visiting }
PP2EpsilonNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitEpsilon: self
]

{ #category : #'analysis - first' }
PP2EpsilonNode >> firstCharSet [
	^ PP2CharSetPredicate any
]

{ #category : #testing }
PP2EpsilonNode >> isEpsilon [
	^ true
]

{ #category : #'as yet unclassified' }
PP2EpsilonNode >> nonEpsilon [
	^	#failure asPParser
]

{ #category : #initialization }
PP2EpsilonNode >> resetStrategy [
	strategy := PP2Epsilon on: self
]
