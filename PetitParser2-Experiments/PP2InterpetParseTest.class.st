Class {
	#name : #PP2InterpetParseTest,
	#superclass : #PP2AbstractParserTest,
	#traits : 'TPP2ParseTest',
	#classTraits : 'TPP2ParseTest classTrait',
	#category : 'PetitParser2-Experiments-Interpret'
}

{ #category : #accessing }
PP2InterpetParseTest >> context [
	^ PP2Context new
]

{ #category : #accessing }
PP2InterpetParseTest >> parse: aStream withParser: aParser withContext: aContext [
	^ (PP2Interpret  on: aParser) parse: aStream withContext: aContext
]

{ #category : #test }
PP2InterpetParseTest >> testPredicateDigit [
	|  parser |
	
	parser := #digit asPParser.

	self assert: parser parse: '1' to: $1.
	self assert: parser parse: '0' to: $0.
	self assert: parser parse: '9' to: $9.
	self assert: parser fail: 'a'.
]
