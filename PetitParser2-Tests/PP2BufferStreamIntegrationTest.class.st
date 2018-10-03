Class {
	#name : #PP2BufferStreamIntegrationTest,
	#superclass : #PP2AbstractParserTest,
	#instVars : [
		'parser',
		'stream',
		'tokens'
	],
	#category : 'PetitParser2-Tests-Streams'
}

{ #category : #tests }
PP2BufferStreamIntegrationTest >> parse: aStream withParser: aParser withContext: aContext [
	^ aParser parse: aStream withContext: aContext
]

{ #category : #tests }
PP2BufferStreamIntegrationTest >> streamOn: aString [
	^ PP2BufferStream on: (PP2MinimalStream on: aString)
]

{ #category : #tests }
PP2BufferStreamIntegrationTest >> streamOn: aString bufferSize: size [
	^ PP2BufferStream on: (PP2MinimalStream on: aString) bufferSize: size
]

{ #category : #tests }
PP2BufferStreamIntegrationTest >> testIdentifier [
	"Test with stream that provides only atEnd and next:"

	parser := (#letter asPParser, #word asPParser plus) flatten.
	stream := self streamOn: 'hi123'.
	
	self assert: parser parse: 'hi123' to: 'hi123' end: 5.
]

{ #category : #tests }
PP2BufferStreamIntegrationTest >> testIdentifierSmallBuffer [
	"Test with stream that provides only atEnd and next:"

	parser := #letter asPParser, #word asPParser plus.
	stream := self streamOn: 'hi123' bufferSize: 1.
	
	self assert: parser parse: stream to: nil end: 5
]

{ #category : #tests }
PP2BufferStreamIntegrationTest >> testIdentifierSmallBufferError [
	"Test with stream that provides only atEnd and next:"

	parser := (#letter asPParser, #word asPParser plus) flatten.
	stream := self streamOn: 'hi123' bufferSize: 1.
	
	self should: [ self assert: parser parse: stream to: 'hi123' end: 5 ] raise: SubscriptOutOfBounds 
]

{ #category : #tests }
PP2BufferStreamIntegrationTest >> testPredicate [
	"Test with stream that provides only atEnd and next:"

	parser := #letter asPParser.
	stream := self streamOn: 'a'.
	
	self assert: parser parse: stream to: $a end: 1.
]

{ #category : #tests }
PP2BufferStreamIntegrationTest >> testSequence [
	"Test with stream that provides only atEnd and next:"

	parser := $a asPParser, $a asPParser.
	stream := self streamOn: 'aa'.
	
	self assert: parser parse: stream to: #($a $a) end: 2
]

{ #category : #tests }
PP2BufferStreamIntegrationTest >> testStreamBacktrack [
	parser := ('aa' asPParser, 'a' asPParser) / 'aa' asPParser.
	stream := self streamOn: 'aa'.
	
	self assert: parser parse: stream to: 'aa' end: 2.
	
]

{ #category : #tests }
PP2BufferStreamIntegrationTest >> testStreamBacktrackBufferSmall [
	parser := 'aa' asPParser.
	stream := self streamOn: 'aa' bufferSize: 2.
	
	parser := ('aa' asPParser, 'aa' asPParser) / 'aa' asPParser.
	
	self assert: parser parse: stream to: 'aa' end: 2.
	
]

{ #category : #tests }
PP2BufferStreamIntegrationTest >> testStreamBacktrackBufferTooSmall [
	parser := 'aa' asPParser.
	stream := self streamOn: 'aa' bufferSize: 1.
	
	parser := ('aa' asPParser, 'aa' asPParser) / 'aa' asPParser.
	
	self should: [ self assert: parser parse: stream to: 'aa' end: 2 ] raise: SubscriptOutOfBounds 
	
]

{ #category : #tests }
PP2BufferStreamIntegrationTest >> testStreamBufferTooSmall [
	parser := 'aa' asPParser.
	stream := self streamOn: 'aa' bufferSize: 1.
	self should: [ self assert: parser parse: stream to: 'aa' end: 2 ] raise: SubscriptOutOfBounds.	

]

{ #category : #tests }
PP2BufferStreamIntegrationTest >> testToken [
	parser := 'aa' asPParser token.
	stream := self streamOn: 'aa'.
	
	self assert: parser parse: stream toTokenValue: 'aa' end: 2
]
