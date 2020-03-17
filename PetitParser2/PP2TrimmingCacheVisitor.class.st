Class {
	#name : #PP2TrimmingCacheVisitor,
	#superclass : #PP2NoopVisitor,
	#category : 'PetitParser2-Optimizations'
}

{ #category : #optimizations }
PP2TrimmingCacheVisitor >> doPass: node [
	self flag: 'should add a trimming guard for the equivalent trimmers'.
	(self usingSameTrimmer: node) ifTrue: [ 
		self visit: node.
	] ifFalse: [  
		node warnDifferentTrimmer.
	]
]

{ #category : #optimizations }
PP2TrimmingCacheVisitor >> usingSameTrimmer: node [
	| trimmings trimmers |
	trimmings := node allNodes select: [ :c | c isTrimming ].
	
	trimmers := trimmings collect: [ :e | e trimmer ].

	^ (Set withAll: trimmers) size = 1
]

{ #category : #visiting }
PP2TrimmingCacheVisitor >> visitTrimming: node [
	node trimmer strategy: node trimmer strategy trimmingCache.
	
	super visitTrimming: node
]
