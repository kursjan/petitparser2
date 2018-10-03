Class {
	#name : #PP2AllNodesCacheTest,
	#superclass : #TestCase,
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #tests }
PP2AllNodesCacheTest >> assert: node hasProperty: propertyName withValue: propertyValue [
	self assert: (node propertyAt: propertyName) equals: propertyValue
]

{ #category : #tests }
PP2AllNodesCacheTest >> testSanity [
	| parser |
	parser := PP2ExpressionGrammar new.
	PP2AllNodesCache new doPass: parser.
	
	parser allNodesDo: [ :child | 
		self assert: (child hasProperty: #allNodesSize).
	].

	self assert: (parser productionAt: #number) hasProperty: #allNodesSize withValue: 12.
	self assert: parser hasProperty: #allNodesSize withValue: parser allNodes size.	
]
