Class {
	#name : #PP2ReparsableVisitorTest,
	#superclass : #TestCase,
	#traits : 'TPP2TypeAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait',
	#instVars : [
		'reparsable',
		'parser'
	],
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #'as yet unclassified' }
PP2ReparsableVisitorTest >> testReparsable [
	reparsable := #letter asPParser star reparsable.
	parser := reparsable wrapped.
	
	self visit: parser.
	
	self assert: reparsable strategy isKindOf: PP2Reparsable 
]

{ #category : #'as yet unclassified' }
PP2ReparsableVisitorTest >> visit: node [
	^ PP2ReparsableVisitor new visit: node
]
