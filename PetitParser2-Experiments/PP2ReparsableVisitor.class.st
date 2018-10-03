Class {
	#name : #PP2ReparsableVisitor,
	#superclass : #PP2NoopVisitor,
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #optimizations }
PP2ReparsableVisitor >> doPass: node [
	^ self visit: node
]

{ #category : #asserting }
PP2ReparsableVisitor >> shouldMemoize: node [
	^ node propertyAt: #reparsable ifAbsent: [ false ]
]

{ #category : #visiting }
PP2ReparsableVisitor >> visitPP2Node: node [
	(self shouldMemoize: node) ifTrue: [  
		node strategy: node strategy reparsable
	].
	
	^ super visitPP2Node: node
]
