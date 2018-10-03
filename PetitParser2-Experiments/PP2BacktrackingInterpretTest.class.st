Class {
	#name : #PP2BacktrackingInterpretTest,
	#superclass : #PP2AbstractParserTest,
	#traits : 'TPP2ParseTest',
	#classTraits : 'TPP2ParseTest classTrait',
	#category : 'PetitParser2-Experiments-Backtracking'
}

{ #category : #tests }
PP2BacktrackingInterpretTest >> parse: aStream withParser: aParser withContext: aContext [
	^ (PP2BacktrackingInterpret on: aParser) parse: aStream withContext: aContext
]

{ #category : #tests }
PP2BacktrackingInterpretTest >> testBacktrackingChoice [
	| parser |
	parser := $a asPParser // $b asPParser.
	
	self assert: parser parse: 'a'.
	self assert: parser parse: 'b'.
	self assert: parser fail: 'c'.
]

{ #category : #tests }
PP2BacktrackingInterpretTest >> testChoiceAndPlusInteraction [
	| parser |
	parser := ($a asPParser // $b asPParser) plus end.
	
	self assert: parser parse: 'aaa' to: #($a $a $a).
	self assert: parser parse: 'bbb' to: #($b $b $b).
	self assert: parser parse: 'abab' to: #($a $b $a $b).
	self assert: parser fail: ''.	
]

{ #category : #tests }
PP2BacktrackingInterpretTest >> testChoiceAndPriorityChoice [
	| parser1 parser2 parser |
	
	parser1 := $a asPParser // $b asPParser.
	parser2 := $c asPParser // $d asPParser.
	parser := parser1 / parser2.
	
	self assert: parser parse: 'a'.
	self assert: parser parse: 'b'.
	self assert: parser parse: 'c'.
	self assert: parser parse: 'd'.
	self assert: parser fail: 'e'.
]

{ #category : #tests }
PP2BacktrackingInterpretTest >> testChoiceAndPriorityChoiceOrder [
	| parser1 parser2 parser |
	
	parser1 := $a asPParser // $b asPParser.
	parser2 := 'b' asPParser // $c asPParser.
	parser := parser1 / parser2.
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'b' to: $b.
	self assert: parser parse: 'c' to: $c.
	self assert: parser fail: 'd'.
]

{ #category : #tests }
PP2BacktrackingInterpretTest >> testChoiceBacktrackPlus [
	| parser |
	parser := ((#letter asPParser // $a asPParser) plus, 'bbb' asPParser) end.
	
	self assert: parser parse: 'abbb' to: (OrderedCollection with: (OrderedCollection with: $a) with: 'bbb').
]

{ #category : #tests }
PP2BacktrackingInterpretTest >> testChoiceBacktrackSequence [
	| parser |
	parser := ('aa' asPParser // 'a' asPParser), $a asPParser.
	
	self assert: parser parse: 'aaaa' to: #('aa' $a) end: 3.
	self assert: parser parse: 'aaa' to: #('aa' $a).
	self assert: parser parse: 'aa' to: #('a' $a).
	self assert: parser fail: 'a'.
]

{ #category : #tests }
PP2BacktrackingInterpretTest >> testChoiceBacktrackSequenceWithOptional [
	| parser |
	parser := ('aa' asPParser // 'a' asPParser), $b asPParser optional.
	
	self assert: parser parse: 'aab'.
	self assert: parser parse: 'ab'.
	self assert: parser parse: 'aa'.
	self assert: parser parse: 'a'.
	self assert: parser fail: 'b'.
]

{ #category : #tests }
PP2BacktrackingInterpretTest >> testDeepChoice [
	| parser1 parser2 parser |
	
	parser1 := $a asPParser // $b asPParser.
	parser2 := $c asPParser // $d asPParser.
	parser := parser1 // parser2.
	
	self assert: parser parse: 'a'.
	self assert: parser parse: 'b'.
	self assert: parser parse: 'c'.
	self assert: parser parse: 'd'.
	self assert: parser fail: 'e'.
]
