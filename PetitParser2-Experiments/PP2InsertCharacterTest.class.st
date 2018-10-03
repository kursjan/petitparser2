Class {
	#name : #PP2InsertCharacterTest,
	#superclass : #TestCase,
	#traits : 'TPP2TypeAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait',
	#instVars : [
		'key',
		'change',
		'context',
		'memento',
		'buffer',
		'newBuffer'
	],
	#category : 'PetitParser2-Experiments-Reparsing'
}

{ #category : #running }
PP2InsertCharacterTest >> setUp [
	context := PP2Context on: 'foobar'.
	buffer := IdentityDictionary new.
	change := PP2InsertCharacter new.
	memento := PP2Memento new.
]

{ #category : #tests }
PP2InsertCharacterTest >> testChangeAfterRange [
	change position: 2.

	self assert: (change changeAfterRange: 0).
	self deny: (change changeAfterRange: 1).
]

{ #category : #tests }
PP2InsertCharacterTest >> testChangeBeforeRange [
	change position: 2.

	self assert: (change changeBeforeRange: 4).
	self assert: (change changeBeforeRange: 3).

	self deny: (change changeBeforeRange: 2).
]

{ #category : #tests }
PP2InsertCharacterTest >> testChangeBetweenAnd [
	change position: 2.

	self assert: (change changeBetween: 2 and: 2).
	self assert: (change changeBetween: 2 and: 3).

	self assert: (change changeBetween: 1 and: 2).
	self assert: (change changeBetween: 1 and: 1).

	self deny: (change changeBetween: 3 and: 3).
	self deny: (change changeBetween: 0 and: 0).

]

{ #category : #tests }
PP2InsertCharacterTest >> testUpdateBufferChangeAfter [
	key := 0. "+1"
	memento furthestPosition: 1.
	change position: 3.

	context position: memento furthestPosition.
	memento contextMemento: context remember.
	
	buffer at: key put: memento.
	
	newBuffer := change updateBuffer: buffer.
	self assert: (newBuffer at: key) equals: memento.
	self assert: memento contextMemento position equals: 1.
]

{ #category : #tests }
PP2InsertCharacterTest >> testUpdateBufferChangeBefore [
	key := 2. "+1"
	memento furthestPosition: 3.
	change position: 1.

	context position: memento furthestPosition.
	memento contextMemento: context remember.
	
	buffer at: key put: memento.
	
	newBuffer := change updateBuffer: buffer.
	self assert: (newBuffer at: key + 1) equals: memento.
	self assert: memento contextMemento position equals: 4.
]

{ #category : #tests }
PP2InsertCharacterTest >> testUpdateBufferInRange [
	key := 0. "+1"
	memento furthestPosition: 3.
	change position: 2.
	
	context position: memento furthestPosition.
	memento contextMemento: context remember.
	
	buffer at: key put: memento.
	
	newBuffer := change updateBuffer: buffer.
	self assert: (newBuffer at: key) isKindOf: PP2MementoPromise.
	self assert: (newBuffer at: key) buffer equals: newBuffer.
	self assert: (newBuffer at: key) contextMemento position equals: 4.
	self assert: (newBuffer at: key) furthestPosition equals: 4.
	self assert: (newBuffer at: key) position equals: key.
	
]

{ #category : #tests }
PP2InsertCharacterTest >> testUpdateBufferInRangeHighBoundary [
	key := 0. "+1"
	memento furthestPosition: 1.
	change position: 2.

	context position: memento furthestPosition.
	memento contextMemento: context remember.

	buffer at: key put: memento.
	
	newBuffer := change updateBuffer: buffer.
	self assert: (newBuffer at: key) isKindOf: PP2MementoPromise.
	self assert: (newBuffer at: key) buffer equals: newBuffer.
	self assert: (newBuffer at: key) contextMemento position equals: 2.	
	self assert: (newBuffer at: key) position equals: key.
]

{ #category : #tests }
PP2InsertCharacterTest >> testUpdateBufferInRangeLowBoundary [
	key := 1. "+1"
	memento furthestPosition: 3.
	change position: 2.

	context position: memento furthestPosition.
	memento contextMemento: context remember.
	
	buffer at: key put: memento.
	
	newBuffer := change updateBuffer: buffer.
	self assert: (newBuffer at: key) isKindOf: PP2MementoPromise.
	self assert: (newBuffer at: key) buffer equals: newBuffer.
	self assert: (newBuffer at: key) contextMemento position equals: 4.
	self assert: (newBuffer at: key) position equals: key.
	
	
]

{ #category : #tests }
PP2InsertCharacterTest >> testUpdateTokens [
	| token anotherToken returnValue originalInput |

	originalInput := '_foobar'.

	token := PP2Token on: originalInput start: 2 stop: 4.
	anotherToken := PP2Token on: originalInput start: 5 stop: 7.
	
	returnValue := OrderedCollection with: token with: #foobar with: anotherToken.

	change input: '__foobar'.
	change position: 1.
	change updateTokens: returnValue.
	
	self assert: token start equals: 3.
	self assert: token stop equals: 5.
	self assert: token value = 'foo'.
	
	self assert: anotherToken start equals: 6.
	self assert: anotherToken stop equals: 8.
	self assert: anotherToken value equals: 'bar'.
]

{ #category : #tests }
PP2InsertCharacterTest >> testUpdateTokensAfterChange [
	| token anotherToken returnValue originalInput |

	originalInput := 'foo__bar'.

	token := PP2Token on: originalInput start: 1 stop: 3.
	anotherToken := PP2Token on: originalInput start: 6 stop: 8.
	
	returnValue := OrderedCollection with: token with: #foobar with: anotherToken.

	change input: 'foo___bar'.
	change position: 5.
	change updateTokens: returnValue.
	
	self assert: token start equals: 1.
	self assert: token stop equals: 3.
	self assert: token value = 'foo'.
	
	self assert: anotherToken start equals: 7.
	self assert: anotherToken stop equals: 9.
	self assert: anotherToken value equals: 'bar'.
]

{ #category : #tests }
PP2InsertCharacterTest >> testUpdateTokensOnce [
	| token returnValue originalInput |

	originalInput := '_foobar'.

	token := PP2Token on: originalInput start: 2 stop: 4.
	
	returnValue := OrderedCollection with: token with: #foobar with: token.

	change input: '__foobar'.
	change position: 1.
	change updateTokens: returnValue.
	
	self assert: token start equals: 3.
	self assert: token stop equals: 5.
	self assert: token value = 'foo'.
]

{ #category : #tests }
PP2InsertCharacterTest >> testUpdateTokensSingleToken [
	| returnValue originalInput |

	originalInput := '_foobar'.
	returnValue := PP2Token on: originalInput start: 2 stop: 4.
	
	
	change input: '__foobar'.
	change position: 1.
	change updateTokens: returnValue.
	
	self assert: returnValue start equals: 3.
	self assert: returnValue stop equals: 5.
	self assert: returnValue value = 'foo'.
]
