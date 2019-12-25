Class {
	#name : #PP2ParseTest,
	#superclass : #PP2AbstractParserTest,
	#traits : 'TPP2ParseTest',
	#classTraits : 'TPP2ParseTest classTrait',
	#instVars : [
		'context'
	],
	#category : #'PetitParser2-Tests-Parsing'
}

{ #category : #accessing }
PP2ParseTest >> context [
	context isNil ifTrue: [ 
		context := super context
	].

	^ context
]

{ #category : #accessing }
PP2ParseTest >> parse: aStream withParser: aParser withContext: aContext [
	^ aParser parseAdaptable: aStream withContext: aContext
]

{ #category : #'test - context' }
PP2ParseTest >> testMatch [
	| node |
	node := $a asPParser match.
	
	self context defaultStack push: $a.
	self assert: node parse: 'a'.
]

{ #category : #'test - context' }
PP2ParseTest >> testMatchEmpty [
	| node |
	node := $a asPParser match.
	
	self assert: node fail: 'a'.
]

{ #category : #'test - context' }
PP2ParseTest >> testMatchFailure [
	| node |
	node := $a asPParser match.
	
	self context defaultStack push: $b.
	self assert: node fail: 'b'.
]

{ #category : #'test - context' }
PP2ParseTest >> testMatchNoMatch [
	| node |
	node := $a asPParser match.
	
	self context defaultStack push: $b.
	self assert: node fail: 'a'.
]

{ #category : #test }
PP2ParseTest >> testNonEpsilon [
	|  parser |
	parser := $a asPParser optional nonEpsilon.
	
	self assert: parser fail: ''.
	self assert: parser parse: 'a'
]

{ #category : #'test - context' }
PP2ParseTest >> testPop [
	| node |
	node := nil asPParser pop.
	
	self context defaultStack push: $a.
	self assert: node parse: ''.
	self assert: context defaultStack isEmpty.
]

{ #category : #'test - context' }
PP2ParseTest >> testPopStarOne [
	| node |
	node := $a asPParser pop star.
	
	self context defaultStack push: $a.
	self assert: node parse: 'a'.
	self assert: context defaultStack size equals: 0.
]

{ #category : #'test - context' }
PP2ParseTest >> testPopStarTwo [
	| node |
	node := $a asPParser pop star.
	
	self context defaultStack push: $a.
	self context defaultStack push: $a.
	self assert: node parse: 'aa'.
	self assert: context defaultStack size equals: 0.
]

{ #category : #'test - context' }
PP2ParseTest >> testPopStarZero [
	| node |
	node := $a asPParser pop star.
	
	self context defaultStack push: $a.
	self assert: node parse: ''.
	self assert: context defaultStack size equals: 1.
]

{ #category : #'test - context' }
PP2ParseTest >> testPush [
	| node |
	node := $a asPParser push.
	
	self assert: node parse: 'a'.
	self assert: context defaultStack size equals: 1.
	self assert: context defaultStack top equals: $a.

]

{ #category : #'test - context' }
PP2ParseTest >> testPushStarOne [
	| node |
	node := $a asPParser push star.
	
	self assert: node parse: 'a'.
	self assert: context defaultStack size equals: 1.
]

{ #category : #'test - context' }
PP2ParseTest >> testPushStarTwo [
	| node |
	node := $a asPParser push star.
	
	self assert: node parse: 'aa'.
	self assert: self context defaultStack size equals: 2.

]

{ #category : #'test - context' }
PP2ParseTest >> testPushStarZero [
	| node |
	node := $a asPParser push star.
	
	self assert: node parse: ''.
	self assert: self context defaultStack size equals: 0.
]

{ #category : #'test - water' }
PP2ParseTest >> testWaterBoundary [
	| water |
	water := PP2WaterNode new
		boundaryElements: 'foo' asPParser;
		yourself.
	
	self assert: water parse: 'foobar' to: '' end: 0.
	self assert: water parse: 'barfoo' to: 'bar' end: 3.
	
	self assert: water fail: ''.
	self assert: water fail: 'barbar'.	
]

{ #category : #'test - water' }
PP2ParseTest >> testWaterDefault [
	| water |
	water := PP2WaterNode new.
	
	self assert: water parse: 'foobar' to: 'foobar'.
	self assert: water parse: '' to: ''
]

{ #category : #'test - water' }
PP2ParseTest >> testWaterRecursive [
	| water |
	water := PP2WaterNode new
		yourself.

	water boundary: water.
	self assert: water parse: 'foobar' to: '' end: 0
]

{ #category : #'test - water' }
PP2ParseTest >> testWaterRecursive2 [
	| water eof |
	water := PP2WaterNode new
		yourself.
	eof := PP2EndOfInputNode new.

	water boundary: (water, eof) / eof.
	self assert: water parse: 'foobar' to: 'foobar'
]
