Class {
	#name : #PP2BufferStreamTest,
	#superclass : #TestCase,
	#traits : 'TPP2StreamContextInterface',
	#classTraits : 'TPP2StreamContextInterface classTrait',
	#category : 'PetitParser2-Tests-Streams'
}

{ #category : #running }
PP2BufferStreamTest >> setUp [
	super setUp
]

{ #category : #running }
PP2BufferStreamTest >> streamOn: collection [
	^ PP2BufferStream on: (PP2MinimalStream on: collection)
]

{ #category : #running }
PP2BufferStreamTest >> streamOn: collection bufferSize: size [
	^ PP2BufferStream on: (PP2MinimalStream on: collection) bufferSize: size
]

{ #category : #'tests - context interface' }
PP2BufferStreamTest >> testAtEndDifferentPosition [
	| stream |
	stream := self streamOn: 'f'.
	stream upToPosition: 1.
	self assert: (stream atEnd: 0) not.
	self assert: (stream atEnd: 1).
	
	self assert: (stream atEnd: 2).

]

{ #category : #tests }
PP2BufferStreamTest >> testContents [
	| stream |
	stream := self streamOn: 'bar'. 
	
	self assert: (stream contents) equals: ''.
]

{ #category : #tests }
PP2BufferStreamTest >> testContentsAfterRead [
	| stream |
	stream := self streamOn: 'bar'. 
	stream upToPosition: 3.	
	self assert: (stream contents) equals: 'bar'.
]

{ #category : #'tests - context interface' }
PP2BufferStreamTest >> testCopyFromToBufferOverflow [
	| stream |

	stream := self streamOn: 'bar' bufferSize:2.

	self assert: (stream copyFrom: 2 to: 3) equals: 'ar'
]

{ #category : #tests }
PP2BufferStreamTest >> testCopyFromToOOB [
	| stream |
	stream := self streamOn: 'bar'.

	self should: [ stream copyFrom: 4 to: 4 ] raise: SubscriptOutOfBounds.
	self should: [ stream copyFrom: 1 to: 4 ] raise: SubscriptOutOfBounds.

]

{ #category : #tests }
PP2BufferStreamTest >> testCopyFromToSmallBuffer [
	| stream |
	stream :=  self streamOn: 'foobar' bufferSize: 3. 

	self assert: (stream copyFrom: 1 to: 3) = 'foo'.
	self assert: (stream copyFrom: 2 to: 4) = 'oob'.

	self should: [ stream copyFrom: 1 to: 3 ] raise: Exception description: 'too much backtrack'.
	self should: [ stream copyFrom: 2 to: 5 ] raise: Exception description: 'range too big'.

]

{ #category : #tests }
PP2BufferStreamTest >> testInstanceCreation [
	| stream |
	stream := self streamOn: ''.
	self assert: (stream buffer isKindOf: String).
	self assert: (stream buffer size = stream bufferSize).

]

{ #category : #tests }
PP2BufferStreamTest >> testInstanceCreationSize [
	| stream |
	stream := self streamOn: '' bufferSize: 2. 
	self assert: (stream buffer isKindOf: String).
	self assert: (stream buffer size = stream bufferSize).
	self assert: (stream bufferSize = 2).

]

{ #category : #'tests - context interface' }
PP2BufferStreamTest >> testRandomAccessTooMuchBacktrack [
	| stream |
	stream := self streamOn: 'bar' bufferSize: 2. 
	
	self assert: (stream atPosition: 3) = $r.	
	self assert: (stream atPosition: 2) = $a.
	self should: [ stream atPosition: 1 ] raise: SubscriptOutOfBounds description: 'too much backtrack'.

]

{ #category : #'tests - context interface' }
PP2BufferStreamTest >> testRandomAccessTwoPasses [
	| stream |
	stream := self streamOn: 'foobar' bufferSize: 2. 
	
	self assert: (stream atPosition: 1) = $f.	
	self assert: (stream atPosition: 2) = $o.
	self assert: (stream atPosition: 3) = $o.	
	self assert: (stream atPosition: 4) = $b.
	self assert: (stream atPosition: 5) = $a.
	self assert: (stream atPosition: 6) = $r.
	
	self should: [(stream atPosition: 1) ] raise: Exception.
	self should: [(stream atPosition: 2) ] raise: Exception.
	self should: [(stream atPosition: 3) ] raise: Exception.
	self should: [(stream atPosition: 4) ] raise: Exception.
	self assert: (stream atPosition: 5) = $a.
	self assert: (stream atPosition: 6) = $r.

]

{ #category : #tests }
PP2BufferStreamTest >> testUncheckedNext [
	| stream |
	stream := self streamOn: 'foo'. 
	
	self assert: stream uncheckedNext = $f.
	self assert: stream uncheckedNext = $o.
	self assert: stream uncheckedNext = $o.
	self should: [ stream uncheckedNext ] raise: Exception.
]
