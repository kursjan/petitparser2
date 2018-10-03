Class {
	#name : #PP2NodeCopyTest,
	#superclass : #TestCase,
	#category : 'PetitParser2-Tests-Nodes'
}

{ #category : #tests }
PP2NodeCopyTest >> testCopy [
	| node nodeCopy |
	node := $a asPParser.
	
	nodeCopy := node copy.
	
	self assert: node equals: nodeCopy.
	self assert: node ~~ nodeCopy.
	
	self assert: node strategy node == node.
	self assert: nodeCopy strategy node == nodeCopy.
]

{ #category : #tests }
PP2NodeCopyTest >> testCopyDelegate [
	| node nodeCopy |
	node := $a asPParser wrapped.
	
	nodeCopy := node copy.
	
	self assert: node equals: nodeCopy.
	self assert: node ~~ nodeCopy.
	
	self assert: node child == nodeCopy child.
]

{ #category : #tests }
PP2NodeCopyTest >> testCopyProperties [
	| node nodeCopy |
	node := $a asPParser.
	node propertyAt: #foo put: #bar.
	
	nodeCopy := node copy.
	
	self assert: node equals: nodeCopy.

	self assert: node properties equals: nodeCopy properties.
	self assert: node properties ~~ nodeCopy properties.
]

{ #category : #tests }
PP2NodeCopyTest >> testDuplicateDelegate [
	| node nodeCopy |
	node := $a asPParser wrapped.
	
	nodeCopy := node duplicate.
	
	self assert: node equals: nodeCopy.
	self assert: node ~~ nodeCopy.
	
	self assert: node child equals: nodeCopy child.
	self assert: node child ~~ nodeCopy child.	
]

{ #category : #tests }
PP2NodeCopyTest >> testDuplicateSequence [
	| node nodeCopy |
	node := $a asPParser, $b asPParser.
	
	nodeCopy := node duplicate.
	
	self assert: node equals: nodeCopy.
	self assert: node ~~ nodeCopy.
	
	self assert: node firstChild ~~ nodeCopy firstChild.
	self assert: node secondChild ~~ nodeCopy secondChild.	
]
