Class {
	#name : #PP2AllNodesCache,
	#superclass : #PP2AllNodesVisitor,
	#category : 'PetitParser2-Optimizations'
}

{ #category : #'as yet unclassified' }
PP2AllNodesCache >> afterAccept: ctx result: result [
	ctx node propertyAt: #allNodesSize ifAbsentPut: result size
]

{ #category : #'as yet unclassified' }
PP2AllNodesCache >> doPass: node [
	self visit: node
]
