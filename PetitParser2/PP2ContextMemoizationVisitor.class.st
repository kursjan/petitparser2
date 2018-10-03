Class {
	#name : #PP2ContextMemoizationVisitor,
	#superclass : #PP2NoopVisitor,
	#category : 'PetitParser2-Optimizations'
}

{ #category : #optimizations }
PP2ContextMemoizationVisitor >> doPass: node [
	^ self visit: node
	
]

{ #category : #visiting }
PP2ContextMemoizationVisitor >> visitAnd: node [
	node child contextChanges isNotContextChange ifTrue: [ 
		node memoizationStrategy: PP2CFMemoization new.
		^ 	super visitAnd: node.
	].

	node child contextChanges isContextPop ifTrue: [ 
		node memoizationStrategy: PP2PopMemoization new.
		^ 	super visitAnd: node.
	].

	node child contextChanges isContextPush ifTrue: [ 
		node memoizationStrategy: PP2PushMemoization new.
		^ 	super visitAnd: node.
	].

	^ 	super visitAnd: node.

]

{ #category : #visiting }
PP2ContextMemoizationVisitor >> visitFlatten: node [
	node contextChanges isContextChange ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	].
	super visitFlatten: node.
	

]

{ #category : #visiting }
PP2ContextMemoizationVisitor >> visitMatch: node [
	node child contextChanges isNotContextChange ifTrue: [ 
		node memoizationStrategy: PP2CFMemoization new
	].

	^ 	super visitWater: node

]

{ #category : #visiting }
PP2ContextMemoizationVisitor >> visitNonEpsilon: node [
	node child contextChanges isNotContextChange ifTrue: [ 
		node memoizationStrategy: PP2CFMemoization new.
		^ 	super visitAnd: node.
	].

	^ 	super visitAnd: node.

]

{ #category : #visiting }
PP2ContextMemoizationVisitor >> visitNot: node [
	node child contextChanges isNotContextChange ifTrue: [ 
		node memoizationStrategy: PP2CFMemoization new.
		^ 	super visitNot: node.
	].

	node child contextChanges isContextPop ifTrue: [ 
		node memoizationStrategy: PP2PopMemoization new.
		^ 	super visitNot: node.
	].

	node child contextChanges isContextPush ifTrue: [ 
		node memoizationStrategy: PP2PushMemoization new.
		^ 	super visitNot: node.
	].

	^ 	super visitAnd: node.

]

{ #category : #visiting }
PP2ContextMemoizationVisitor >> visitSea: node [
	node contextChanges isContextChange ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	].

	^ 	super visitSea: node

]

{ #category : #visiting }
PP2ContextMemoizationVisitor >> visitSequence: node [
	(node children noneSatisfy: [:child | child contextChanges isContextChange ]) ifTrue: [ 
		node memoizationStrategy: PP2CFMemoization new.
		^ 	super visitSequence: node
	].

	node contextChanges isContextPop ifTrue: [ 
		node memoizationStrategy: PP2PopMemoization new.
		^ 	super visitSequence: node
	].

	node contextChanges isContextPush ifTrue: [ 
		node memoizationStrategy: PP2PushMemoization new.
		^ 	super visitSequence: node
	].

	((node children anySatisfy: [ :child | child contextChanges isContextChange  ]) and: [
	  node contextChanges isNotContextChange ]) ifTrue: [ 
			"JK: PUSH-POP case, can be handled by the PushMemoization, let me know if not :)"
			node memoizationStrategy: PP2PushMemoization new.
			^ 	super visitSequence: node
	].


	^ 	super visitSequence: node


]

{ #category : #visiting }
PP2ContextMemoizationVisitor >> visitWater: node [
	node waterToken contextChanges isContextChange ifFalse: [ 
		node memoizationStrategy: PP2CFMemoization new
	].

	^ 	super visitWater: node

]
