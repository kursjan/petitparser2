Class {
	#name : #PP2FirstProductionSetCache,
	#superclass : #PP2FirstSetVisitor,
	#category : 'PetitParser2-Optimizations'
}

{ #category : #hooks }
PP2FirstProductionSetCache >> afterAccept: ctx result: result [
	ctx node propertyAt: #firstProductionSet ifAbsentPut: result
]

{ #category : #optimizations }
PP2FirstProductionSetCache >> doPass: node [
	| allNodes child |
	self visit: node.
	allNodes := node allNodes.
	
	[child := allNodes detect: [ :e | (e hasProperty: #firstProductionSet) not ] 
							ifNone: [ nil ] ] whileNotNil: [ 		
		self visit: child
	]
]

{ #category : #initialization }
PP2FirstProductionSetCache >> initialize [
	super initialize.
	predicateBlock := [ :e | e isProduction  ]
]
