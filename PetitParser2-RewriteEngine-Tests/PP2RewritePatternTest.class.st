Class {
	#name : #PP2RewritePatternTest,
	#superclass : #PP2AbstractParserTest,
	#traits : 'TPP2TypeAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait',
	#instVars : [
		'result'
	],
	#category : 'PetitParser2-RewriteEngine-Tests-Parsing'
}

{ #category : #parsing }
PP2RewritePatternTest >> parse: aStream withParser: aParser withContext: aContext [
	| ctx |
	ctx := (aParser parse: aStream withContext: aContext).
	result := ctx returnValue.
	^ ctx
]

{ #category : #tests }
PP2RewritePatternTest >> testRewritePattern [
	| parser |
	parser := $a asPParser enablePatternMatching.
	
	self assert: parser parse: 'a'.
	self assert: parser fail: '`c`'.
]

{ #category : #tests }
PP2RewritePatternTest >> testRewritePatternLongestMatch [
	| parser aParser |
	aParser := $a asPParser token parseNode.
	parser := (aParser, aParser) parseNode enablePatternMatching.
	
	self assert: parser parse: 'aa'.
	self assert: parser parse: '`c`'.
	self assert: parser parse: 'a`c`'.	
	self assert: parser parse: '`c`a'.	
]

{ #category : #tests }
PP2RewritePatternTest >> testRewritePatternParseNode [
	| parser |
	parser := ($a asPParser token, $b asPParser token) parseNode enablePatternMatching.
	
	self assert: parser parse: 'ab'.
	self assert: result isParseNode.
	self deny: result isPatternParseNode
]

{ #category : #tests }
PP2RewritePatternTest >> testRewritePatternParseNode_pattern [
	| parser |
	parser := ($a asPParser token, $b asPParser token) parseNode enablePatternMatching.
	
	self assert: parser parse: '`c`'.
	self assert: result isParseNode.
	self assert: result isPatternParseNode.
]

{ #category : #tests }
PP2RewritePatternTest >> testRewritePatternRepetition [
	| parser aParser |
	aParser := $a asPParser token parseNode.
	parser := (aParser star) parseNode enablePatternMatching.
	
	self assert: parser parse: ''.
	self assert: parser parse: 'a'.
	self assert: parser parse: 'aa'.
	self assert: parser parse: '`c`'.
	self assert: parser parse: 'a`c`'.	
	self assert: parser parse: '`c`a'.	
	self assert: parser parse: 'a`c`a'.		
]

{ #category : #tests }
PP2RewritePatternTest >> testRewritePatternToken [
	| parser |
	parser := $a asPParser token enablePatternMatching.
	
	self assert: parser parse: 'a'.
	self assert: result isKindOf: PP2Token.
	self assert: result value = 'a'.
]

{ #category : #tests }
PP2RewritePatternTest >> testRewritePatternToken_pattern [
	| parser |
	parser := $a asPParser token enablePatternMatching.
	
	self assert: parser parse: '`c`'.
	self flag: 'JK: Not sure about the following assertion:'.
	self assert: result isKindOf: PP2PatternParseNode.
"	self assert: result value = '`c`'."
	self assert: result isPatternParseNode.
	self assert: result name = 'c'.
]

{ #category : #tests }
PP2RewritePatternTest >> testRewritePatternToken_patternBeToken [
	| parser |
	parser := $a asPParser token enablePatternMatching.
	
	self assert: parser parse: '`c{beToken}`'.
	self flag: 'JK: Not sure about the following assertion:'.
	self assert: result isKindOf: PP2PatternParseNode.
"	self assert: result value = '`c`'."
	self assert: result isPatternParseNode.
	self assert: result name = 'c'.
]
