Trait {
	#name : #TPP2ParseTest,
	#category : 'PetitParser2-Tests-Parsing'
}

{ #category : #test }
TPP2ParseTest >> testAction [
	| parser |
	parser := #any asPParser ==> [:e | e asUppercase ].

	self assert: parser parse: 'a' to: $A.
	self assert: parser parse: 'b' to: $B
]

{ #category : #test }
TPP2ParseTest >> testAnd [
	| parser |
	parser := 'foo' asPParser, 'bar' asPParser and.
	self
		assert: parser
		parse: 'foobar'
		to: #('foo' 'bar')
		end: 3.

	self assert: parser fail: 'foobaz' end: 3.
]

{ #category : #test }
TPP2ParseTest >> testBlock [
	| parser |
	parser := [ :ctx | 
		self assert: (ctx isPetit2Context).
		ctx next 
	] asPParser.
	
	self assert: parser parse: 'ab' to: $a end: 1.
	self assert: parser parse: 'b' to: $b.
	self assert: parser parse: '' to: nil
]

{ #category : #test }
TPP2ParseTest >> testChoice [
	| parser |
	parser := $a asPParser / $b asPParser.
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'b' to: $b.

	self assert: parser parse: 'ab' to: $a end: 1.
	self assert: parser parse: 'ba' to: $b end: 1.

	self assert: parser fail: ''.
	self assert: parser fail: 'c'.
	self assert: parser fail: 'ca'
]

{ #category : #test }
TPP2ParseTest >> testDelegateWithEndOfInput [
	| parser |
	parser := ($a asPParser / #eoi asPParser) wrapped.
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: '' to: nil.

	self assert: parser fail: 'b'.
]

{ #category : #'test - operators' }
TPP2ParseTest >> testDelimitedBy [
	| parser |
	parser := $a asPParser delimitedBy: $b asPParser.
	
	self assert: parser parse: 'a' to: #($a).
	self assert: parser parse: 'aba' to: #($a $b $a).
	self assert: parser parse: 'ababa' to: #($a $b $a $b $a).

	self assert: parser parse: 'ab' to: #($a $b).
	self assert: parser parse: 'abab' to: #($a $b $a $b).
	self assert: parser parse: 'ababab' to: #($a $b $a $b $a $b).
	
	self assert: parser parse: 'ac' to: #($a) end: 1.
	self assert: parser parse: 'abc' to: #($a $b) end: 2.
	self assert: parser parse: 'abac' to: #($a $b $a) end: 3.
	self assert: parser parse: 'ababc' to: #($a $b $a $b) end: 4.
	
	self assert: parser fail: ''.
	self assert: parser fail: 'b'.
	self assert: parser fail: 'c'
]

{ #category : #test }
TPP2ParseTest >> testEnd [
	| parser |
	parser := $a asPParser end.

	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: ''.
	self assert: parser fail: 'aa' end: 1.
]

{ #category : #test }
TPP2ParseTest >> testEndLiteral [
	| parser |
	parser := 'stuff' asPParser end.

	self assert: parser parse: 'stuff' to: 'stuff'.
	self assert: parser fail: 'stufff' end: 5.
	self assert: parser fail: 'fluff'
]

{ #category : #test }
TPP2ParseTest >> testEndOfInput [
	| parser |
	parser := #endOfInput asPParser.

	self assert: parser parse: '' to: nil.
	self assert: parser fail: 'a'.
]

{ #category : #test }
TPP2ParseTest >> testEndOfLine [
	| parser |
	parser := #endOfLine asPParser.

	self assert: parser parse: '' to: nil.
	self assert: parser fail: 'a'.

	self assert: $a asPParser, parser parse: 'a'.
]

{ #category : #test }
TPP2ParseTest >> testEpsilon [
	| parser |
	parser := nil asPParser.
	
	self assert: parser parse: '' to: nil.
	
	self assert: parser parse: 'a' to: nil end: 0.
	self assert: parser parse: 'ab' to: nil end: 0
]

{ #category : #test }
TPP2ParseTest >> testFailing [
	| parser |
	parser := PP2FailingNode message: 'Plonk'.

	self assert: parser fail: ''.
	self assert: parser fail: 'a'.
	self assert: parser fail: 'aa'.
]

{ #category : #test }
TPP2ParseTest >> testFlattenSequence [
	| parser |
	parser := ($a asPParser, $b asPParser) flatten.
	
	self assert: parser parse: 'ab' to: 'ab'.
	
	self assert: parser fail: 'ac' end: 1.
	self assert: parser fail: 'bc'
]

{ #category : #'test - mapping' }
TPP2ParseTest >> testFoldLeft [
	| parser |
	parser := #any asPParser star 
		foldLeft: [ :a :b | Array with: a with: b ].

	self assert: parser parse: 'a' to: #a.
	self assert: parser parse: 'ab' to: #($a $b).
	self assert: parser parse: 'abc' to: #(($a $b) $c).
	self assert: parser parse: 'abcd' to: #((($a $b) $c) $d).
	self assert: parser parse: 'abcde' to: #(((($a $b) $c) $d) $e)
]

{ #category : #'test - mapping' }
TPP2ParseTest >> testFoldLeft2 [
	| parser |
	parser := #any asPParser star 
		foldLeft: [ :a :b :c | Array with: a with: b with: c ].
"	self assert: parser parse: #(a) to: #a.
"
	self assert: parser parse: 'a' to: 'a'.
	self assert: parser parse: 'abc' to: #($a $b $c).
	self assert: parser parse: 'abcde' to: #(($a $b $c) $d $e)

]

{ #category : #'test - mapping' }
TPP2ParseTest >> testFoldRight [
	| parser |
	parser := #any asPParser star 
		foldRight: [ :a :b | Array with: a with: b ].

	self assert: parser parse: 'a' to: #a.
	self assert: parser parse: 'ab' to: #($a $b).
	self assert: parser parse: 'abc' to: #($a ($b $c)).
	self assert: parser parse: 'abcd' to: #($a ($b ($c $d))).
	self assert: parser parse: 'abcde' to: #($a ($b ($c ($d $e))))
]

{ #category : #'test - mapping' }
TPP2ParseTest >> testFoldRight2 [
	| parser |
	parser := #any asPParser star 
		foldRight: [ :a :b :c | Array with: a with: b with: c ].

	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'abc' to: #($a $b $c).
	self assert: parser parse: 'abcde' to: #($a $b ($c $d $e))
]

{ #category : #test }
TPP2ParseTest >> testFragment [
	"
	| fragment parser result |

	fragment := $a asPParser plus fragment.
	parser := fragment wrapped.
	
	result := (self assert: parser parse: 'aa') returnValue.

	self assert: result isPetit2Context.
	self assert: result start equals: 0.
	self assert: result stop equals: 2.
	self assert: result parsedValue size equals: 2.
	self assert: result parsedValue first equals: $a.	
	self assert: result parsedValue second equals: $a.
	self assert: result parser == fragment.	
	
	self assert: parser fail: 'b'.
	self assert: parser fail: ''.
	"
]

{ #category : #test }
TPP2ParseTest >> testLiteralObject [
	| parser |
	parser := $a asPParser.
	
	self assert: parser literal equals: $a.
	self assert: parser message equals: 'literal $a expected'.
	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: 'b'
]

{ #category : #test }
TPP2ParseTest >> testLiteralObjectCaseInsensitive [
	| parser |
	parser := $a asPParser caseInsensitive.
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'A' to: $A.

	self assert: parser fail: ''.
	self assert: parser fail: 'b'.
	self assert: parser fail: 'B'
	
]

{ #category : #test }
TPP2ParseTest >> testLiteralSequence [
	| parser |
	parser := 'abc' asPParser.
	
	self assert: parser parse: 'abc' to: 'abc'.
	self assert: parser parse: 'abcd' to: 'abc' end: 3.

	self assert: parser fail: 'ab'.
	self assert: parser fail: 'abd'
]

{ #category : #test }
TPP2ParseTest >> testLiteralSequenceCaseInsensitive [
	| parser |
	parser := 'abc' asPParser caseInsensitive.
	
	self assert: parser parse: 'abc' to: 'abc'.
	self assert: parser parse: 'ABC' to: 'ABC'.
	self assert: parser parse: 'abC' to: 'abC'.
	self assert: parser parse: 'AbC' to: 'AbC'.
	
	self assert: parser fail: 'ab'.
	self assert: parser fail: 'abd'
]

{ #category : #test }
TPP2ParseTest >> testMap [
	| parser |
	parser := #any asPParser
		map: [ :a | Array with: a ].

	self assert: parser parse: 'a' to: #($a).

	self assert: parser fail: ''.
]

{ #category : #test }
TPP2ParseTest >> testMapSequence [
	| parser |
	parser := #any asPParser, #any asPParser
		map: [ :a :b | Array with: b with: a ].

	self assert: parser parse: 'ab' to: #($b $a)
]

{ #category : #test }
TPP2ParseTest >> testMapWrappedSequence [
	| parser |
	parser := (#any asPParser, #any asPParser) wrapped
		map: [ :a :b | Array with: b with: a ].

	self assert: parser parse: 'ab' to: #($b $a)
]

{ #category : #test }
TPP2ParseTest >> testNewLine [
	| parser |
	parser := #newline asPParser.

	self assert: parser parse: '
' to: Character cr.
	self assert: parser fail: ''
]

{ #category : #test }
TPP2ParseTest >> testNot [
	| parser |
	parser := 'foo' asPParser, 'bar' asPParser  not.
	
	self assert: parser parse: 'foobaz' to: #('foo' nil) end: 3.
	self assert: parser fail: 'foobar' end: 3
]

{ #category : #test }
TPP2ParseTest >> testOptional [
	| parser |
	parser := $a asPParser optional.
	
	self assert: parser parse: '' to: nil.
	self assert: parser parse: 'a' to: $a.
	
	self assert: parser parse: 'aa' to: $a end: 1.
	self assert: parser parse: 'ab' to: $a end: 1.
	self assert: parser parse: 'b' to: nil end: 0.
	self assert: parser parse: 'bb' to: nil end: 0.
	self assert: parser parse: 'ba' to: nil end: 0
]

{ #category : #test }
TPP2ParseTest >> testPlus [
	| parser |
	parser := $a asPParser plus.

	self assert: parser parse: 'a' to: #($a).
	self assert: parser parse: 'aa' to: #($a $a).
	self assert: parser parse: 'aaa' to: #($a $a $a).
	self assert: parser parse: 'ab' to: #($a) end: 1.
	self assert: parser parse: 'aab' to: #($a $a) end: 2.
	self assert: parser parse: 'aaab' to: #($a $a $a) end: 3.
		
	self assert: parser fail: ''.
	self assert: parser fail: 'b'.
	self assert: parser fail: 'ba'
]

{ #category : #test }
TPP2ParseTest >> testPlus2 [
	| parser |
	parser := ($a asPParser, $b asPParser) plus.
	
	self assert: parser parse: 'ab' to: #(#($a $b)).
	self assert: parser fail: 'a' end: 1.
]

{ #category : #test }
TPP2ParseTest >> testPossesiveRepeatingNode [
	|  parser |
	
	parser := $a asPParser min: 1 max: 2.

	self assert: parser fail: ''.
	self assert: parser parse: 'a' to: #($a).
	self assert: parser parse: 'aa' to: #($a $a).
	self assert: parser parse: 'aaa' to: #($a $a) end: 2.

]

{ #category : #test }
TPP2ParseTest >> testPredicateAny [
	|  parser |
	
	parser := #any asPParser.

	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: Character null asString to: Character null.
	
	self assert: parser fail: ''.
]

{ #category : #test }
TPP2ParseTest >> testPredicateDigit [
	|  parser |
	
	parser := #digit asPParser.

	self assert: parser parse: '1' to: $1.
	self assert: parser parse: '0' to: $0.
	self assert: parser parse: '9' to: $9.
	self assert: parser fail: 'a'.
]

{ #category : #test }
TPP2ParseTest >> testPredicateLetter [
	|  parser |
	
	parser := #letter asPParser.

	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'b' to: $b.
	self assert: parser parse: 'z' to: $z.
	self assert: parser fail: ''.
]

{ #category : #test }
TPP2ParseTest >> testRepetitions [
	| parser result |
	parser := ('foo' asPParser, ':=' asPParser) plus.
	
	result := (self assert: parser parse: 'foo:=').
	
	self assert: result value size equals: 1.
	self assert: result value first equals: #('foo' ':=').
	
	self assert: parser fail: 'foo' end: 3.
]

{ #category : #'test - operators' }
TPP2ParseTest >> testSeparatedBy [
	| parser |
	parser := $a asPParser separatedBy: $b asPParser.
	
	self assert: parser parse: 'a' to: #($a).
	self assert: parser parse: 'aba' to: #($a $b $a).
	self assert: parser parse: 'ababa' to: #($a $b $a $b $a).
	
	self assert: parser parse: 'ab' to: #($a) end: 1.
	self assert: parser parse: 'abab' to: #($a $b $a) end: 3.
	self assert: parser parse: 'ac' to: #($a) end: 1.
	self assert: parser parse: 'abac' to: #($a $b $a) end: 3.
	
	self assert: parser fail: ''.
	self assert: parser fail: 'c'
]

{ #category : #test }
TPP2ParseTest >> testSequence [
	| parser |
	parser := $a asPParser , $b asPParser.
	
	self assert: parser parse: 'ab' to: #($a $b).
	
	self assert: parser parse: 'aba' to: #($a $b) end: 2.
	self assert: parser parse: 'abb' to: #($a $b) end: 2.
	
	self assert: parser fail: ''.
	self assert: parser fail: 'a' end: 1.
	self assert: parser fail: 'aa' end: 1.
	self assert: parser fail: 'ba' end: 0.
	self assert: parser fail: 'bab' end: 0
]

{ #category : #test }
TPP2ParseTest >> testSequence2 [
	| parser |
	parser := ($a asPParser , $b asPParser) star, $a asPParser.

	self assert: parser parse: 'a' to: (Array with: OrderedCollection new with: $a).

	self assert: parser fail: 'ab' end: 2.
	self assert: parser fail: ''.
]

{ #category : #test }
TPP2ParseTest >> testSequenceOfThree [
	| parser |
	parser := $a asPParser , $b asPParser, $c asPParser.
	
	self assert: parser parse: 'abc' to: #($a $b $c).
	self assert: parser fail: 'ab' end: 2.
]

{ #category : #test }
TPP2ParseTest >> testStar [
	| parser |
	parser := $a asPParser star.

	self assert: parser parse: '' to: #().
	self assert: parser parse: 'a' to: #($a).
	self assert: parser parse: 'aa' to: #($a $a).
	self assert: parser parse: 'aaa' to: #($a $a $a).
	self
		assert: parser
		parse: 'b'
		to: #()
		end: 0.
	self
		assert: parser
		parse: 'ab'
		to: #($a)
		end: 1.
	self
		assert: parser
		parse: 'aab'
		to: #($a $a)
		end: 2.
	self
		assert: parser
		parse: 'aaab'
		to: #($a $a $a)
		end: 3
]

{ #category : #test }
TPP2ParseTest >> testStartOfLine [
	| parser |
	parser := #startOfLine asPParser.

	self assert: parser parse: '' to: nil.
	self assert: parser parse: 'a' to: nil end: 0.

	self assert: $a asPParser, parser fail: 'ab' end: 1.
]

{ #category : #test }
TPP2ParseTest >> testTimes [
	| parser |
	parser := $a asPParser times: 2.
	
	self assert: parser fail: ''.
	self assert: parser fail: 'a' end: 1.
	self assert: parser parse: 'aa' to: #($a $a).
	self assert: parser parse: 'aaa' to: #($a $a) end: 2
]

{ #category : #test }
TPP2ParseTest >> testToken [
	| parser |
	parser := $a asPParser token.

	self assert: parser parse: 'a'	toTokenValue: 'a'.
		
	self assert: parser fail: 'b'.
	self assert: parser fail: ''.
]

{ #category : #test }
TPP2ParseTest >> testTokenLiteral [
	| parser |
	parser := 'foo' asPParser token.

	self assert: parser parse: 'foo' toTokenValue: 'foo'.
		
	self assert: parser fail: 'bar'.
	self assert: parser fail: ''.
]

{ #category : #test }
TPP2ParseTest >> testTokenTrim [
	| parser |
	parser := $a asPParser token trim.
	
	self assert: parser parse: 'a' toTokenValue: 'a'.
	self assert: parser parse: ' a' toTokenValue: 'a'.
	self assert: parser parse: 'a ' toTokenValue: 'a' end: 2.
	self assert: parser parse: ' a ' toTokenValue: 'a' end: 3.
	self assert: parser parse: '  a  ' toTokenValue: 'a' end: 5.

	self assert: parser fail: 'b'.
]

{ #category : #test }
TPP2ParseTest >> testTrim [
	| parser |
	parser := 'a' asPParser trim.
	
	self assert: parser parse: 'a' to: 'a'.
	self assert: parser parse: ' a' to: 'a'.
	self assert: parser parse: 'a ' to: 'a' end: 2.
	self assert: parser parse: ' a ' to: 'a' end: 3.
	self assert: parser parse: '  a  ' to: 'a' end: 5.

	self assert: parser fail: 'b'.

]

{ #category : #test }
TPP2ParseTest >> testWrapped [
	| parser |
	parser := $a asPParser wrapped.
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: 'b'.
]

{ #category : #test }
TPP2ParseTest >> testWrappedSequence [
	| parser |

	parser := (($a asPParser , $b asPParser ) wrapped , $c asPParser).
	self assert: parser parse: 'abc' to: #(#($a $b) $c)
]

{ #category : #test }
TPP2ParseTest >> testWrapping [
	| parser |
	parser := $a asPParser >=> [:c :cc | cc value].
	
	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: 'b'.
]
