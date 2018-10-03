Trait {
	#name : #TPP2StreamContextInterface,
	#category : 'PetitParser2-Tests-Streams'
}

{ #category : #'tests - context interface' }
TPP2StreamContextInterface >> testAtEnd [
	| stream |
	stream := self streamOn: ''. 
	self assert: (stream atEnd: 0).
	self assert: (stream atEnd: 1).


	stream := self streamOn: 'f'. 
	self assert: (stream atEnd: 0) not.
	self assert: (stream atEnd: 1).
	self assert: (stream atEnd: 2).
]

{ #category : #'tests - context interface' }
TPP2StreamContextInterface >> testAtPosition [
	| stream |
	stream := self streamOn: 'bar'. 
	
	self assert: (stream atPosition: 1) = $b.
	self assert: (stream atPosition: 2) = $a.
	self assert: (stream atPosition: 3) = $r.
]

{ #category : #'tests - context interface' }
TPP2StreamContextInterface >> testAtPositionReversedOrder [
	| stream |
	stream := self streamOn: 'bar'. 
	
	self assert: (stream atPosition: 3) = $r.
	self assert: (stream atPosition: 2) = $a.
	self assert: (stream atPosition: 1) = $b.
]

{ #category : #'tests - context interface' }
TPP2StreamContextInterface >> testCopyFromTo [
	| stream |
	stream := self streamOn: 'bar'.

	self assert: (stream copyFrom: 1 to: 1) = 'b'.
	self assert: (stream copyFrom: 1 to: 3) = 'bar'.

]

{ #category : #'tests - context interface' }
TPP2StreamContextInterface >> testNewTokenFromTo [
	| stream |
	stream := self streamOn: 'foo'. 
	
	self assert: (stream newToken: PP2Token from: 1 to: 3) value equals: 'foo'.
]
