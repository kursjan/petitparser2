Class {
	#name : #PP2TransformVisitor,
	#superclass : #PP2NoopVisitor,
	#instVars : [
		'predicate',
		'block',
		'mapping'
	],
	#category : 'PetitParser2-Core'
}

{ #category : #accessing }
PP2TransformVisitor >> block [
	^ block
]

{ #category : #accessing }
PP2TransformVisitor >> block: anObject [
	block := anObject
]

{ #category : #initialization }
PP2TransformVisitor >> initialize [
	super initialize.

	predicate := [ :node | true ].
	block := [ :node | node ].
	
	mapping := IdentityDictionary new.
]

{ #category : #visiting }
PP2TransformVisitor >> initializeMapping: rootNode [
	| transformed |
	
	rootNode allNodesDo: [ :node |
		transformed := node copy. 
		(predicate value: node) ifTrue: [  
			transformed := block value: transformed
		].
		mapping at: node put: transformed.
	]
]

{ #category : #visiting }
PP2TransformVisitor >> openedResultFor: context [
	"when visiting opened node, return the transformed value"
	^ self transformed: context node
]

{ #category : #accessing }
PP2TransformVisitor >> predicate [
	^ predicate
]

{ #category : #accessing }
PP2TransformVisitor >> predicate: anObject [
	predicate := anObject
]

{ #category : #visiting }
PP2TransformVisitor >> transformed: node [
	^ mapping at: node ifAbsent: [ node ].
	
]

{ #category : #visiting }
PP2TransformVisitor >> visitPP2Node: node [
	| transformed transformedChild |
	self isRoot ifTrue: [ self initializeMapping: node ].
		
	transformed := self transformed: node.
	transformed children do: [ :child |
		transformedChild := self visit: child.
		transformed replace: child with: transformedChild.
	].

	^ transformed

]
