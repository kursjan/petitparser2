Class {
	#name : #PP2PredicateTest,
	#superclass : #PP2AbstractParserTest,
	#category : 'PetitParser2-Tests-Nodes'
}

{ #category : #utilities }
PP2PredicateTest >> assertCharacterSets: aParser [
	"Assert the character set of aParser does not overlap with the character set with the negated parser, and that they both cover the complete character space."

	| positives negatives |
	positives := self parsedCharacterSet: aParser.
	negatives := self parsedCharacterSet: aParser negate.
	self charactersDo: [ :char | 
		| positive negative |
		positive := positives includes: char.
		negative := negatives includes: char.
		self 
			assert: ((positive and: [ negative not ])
				or: [ positive not and: [ negative ] ])
			description: char printString , ' should be in exactly one set' ]
]

{ #category : #private }
PP2PredicateTest >> charactersDo: aBlock [
	1 to: 256 do: [ :index | aBlock value: (Character codePoint: index) ]
]

{ #category : #accessing }
PP2PredicateTest >> parse: aStream withParser: aParser withContext: aContext [
	^ aParser parse: aStream withContext: aContext
]

{ #category : #utilities }
PP2PredicateTest >> parsedCharacterSet: aParser [
	| result |
	result := WriteStream on: String new.
	self charactersDo: [ :char |
		(aParser matches: (char asString))
			ifTrue: [ result nextPut: char ] ].
	^ result contents
]

{ #category : #'testing-objects' }
PP2PredicateTest >> testAny [
	| parser |
	parser := #any asPParser.
	self assertCharacterSets: parser.
	self assert: parser parse: ' ' to: $ .
	self assert: parser parse: '1' to: $1.
	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: ''
]

{ #category : #'testing-objects' }
PP2PredicateTest >> testAnyExceptAnyOf [
	| parser |
	parser := PP2PredicateObjectNode noneOf: #($: $,).
	self assertCharacterSets: parser.
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'z' to: $z.
	self assert: parser fail: ':'.
	self assert: parser fail: ','
]

{ #category : #'testing-objects' }
PP2PredicateTest >> testAnyOf [
	| parser |
	parser := PP2PredicateObjectNode anyOf: #($a $z).
	self assertCharacterSets: parser.
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'z' to: $z.
	self assert: parser fail: 'x'
]

{ #category : #'testing-chars' }
PP2PredicateTest >> testBlank [
	| parser |
	parser := #blank asPParser.
	self assertCharacterSets: parser.
	self assert: parser parse: (String with: Character space) to: Character space.
	self assert: parser parse: (String with: Character tab) to: Character tab.
	self assert: parser fail: ''.
	self assert: parser fail: '1'.
	self assert: parser fail: (String with: Character cr)
]

{ #category : #'testing-chars' }
PP2PredicateTest >> testChar [
	| parser |
	parser := $* asPParser.
	self assertCharacterSets: parser.
	self assert: parser parse: '*' to: $*.
	self assert: parser parse: '**' to: $* end: 1.
	self assert: parser fail: ''.
	self assert: parser fail: '1'.
	self assert: parser fail: 'a'
]

{ #category : #'testing-chars' }
PP2PredicateTest >> testDigit [
	| parser |
	parser := #digit asPParser.
	self assertCharacterSets: parser.
	self assert: parser parse: '0' to: $0.
	self assert: parser parse: '9' to: $9.
	self assert: parser fail: ''.
	self assert: parser fail: 'a'
]

{ #category : #'testing-objects' }
PP2PredicateTest >> testExpect [
	| parser |
	parser := PP2PredicateObjectNode expect: $a message: '$a expected'.
	self assertCharacterSets: parser.
	self assert: parser parse: 'a' to: $a.
	self assert: parser fail: 'b'.
	self assert: parser fail: ''
]

{ #category : #'testing-chars' }
PP2PredicateTest >> testHex [
	| parser |
	parser := #hex asPParser.
	self assertCharacterSets: parser.
	self assert: parser parse: '0' to: $0.
	self assert: parser parse: '5' to: $5.
	self assert: parser parse: '9' to: $9.
	self assert: parser parse: 'A' to: $A.
	self assert: parser parse: 'D' to: $D.
	self assert: parser parse: 'F' to: $F.
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'e' to: $e.
	self assert: parser parse: 'f' to: $f.
	self assert: parser fail: ''.
	self assert: parser fail: 'g'
]

{ #category : #'testing-chars' }
PP2PredicateTest >> testLetter [
	| parser |
	parser := #letter asPParser.
	self assertCharacterSets: parser.
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'Z' to: $Z.
	self assert: parser fail: ''.
	self assert: parser fail: '0'
]

{ #category : #'testing-chars' }
PP2PredicateTest >> testNewline [
	| parser |
	parser := #newline asPParser.

	self assert: parser parse: String cr to: String cr.
	self assert: parser parse: String lf to: String lf.
	self assert: parser parse: String crlf to: String  crlf.
	self assert: parser fail: ' '
]

{ #category : #'testing-sequence' }
PP2PredicateTest >> testSequenceParser [
	| parser |
	parser := PP2PredicateSequenceNode
		on: [ :value | value first isUppercase ]
		message: 'uppercase 3 letter words'
		size: 3.
	self assert: parser size equals: 3.
	self assert: parser parse: 'Abc'.
	self assert: parser parse: 'ABc'.
	self assert: parser parse: 'ABC'.
	self assert: parser fail: 'abc'.
	self assert: parser fail: 'aBC'.
	self assert: parser fail: 'Ab'.
	parser := parser negate.
	self assert: parser size equals: 3.
	self assert: parser fail: 'Abc'.
	self assert: parser fail: 'ABc'.
	self assert: parser fail: 'ABC'.
	self assert: parser parse: 'abc'.
	self assert: parser parse: 'aBC'.
	self assert: parser fail: 'Ab'
]

{ #category : #'testing-chars' }
PP2PredicateTest >> testSpace [
	| parser |
	parser := #space asPParser.
	self assertCharacterSets: parser.
	self assert: parser parse: (String with: Character tab) to: Character tab.
	self assert: parser parse: ' ' to: Character space.
	self assert: parser fail: ''.
	self assert: parser fail: 'a'
]

{ #category : #'testing-chars' }
PP2PredicateTest >> testWord [
	| parser |
	parser := #word asPParser.
	self assertCharacterSets: parser.
	self assert: parser parse: 'a' to: $a.
	self assert: parser parse: 'A' to: $A.
	self assert: parser parse: '0' to: $0.
	self assert: parser fail: ''.
	self assert: parser fail: '-'
]
