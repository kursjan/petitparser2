"
I am a set of generic tests for the PEG production rules.
"
Class {
	#name : #PP2PEGGrammarTest,
	#superclass : #TestCase,
	#category : #'PetitParser2-PEG'
}

{ #category : #'instance creation' }
PP2PEGGrammarTest class >> isAbstract [

	^self name = #PP2PEGGrammarTest
]

{ #category : #'instance creation' }
PP2PEGGrammarTest class >> new [
	"Answer a newly created and initialized instance."

	^super new initialize
]

{ #category : #parsers }
PP2PEGGrammarTest >> grammar: grammar [

	self subclassResponsibility
]

{ #category : #parsers }
PP2PEGGrammarTest >> grammar: aPEG start: aProductionName [

	self subclassResponsibility
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testAnd [

	| grammar parser |
	grammar := 'Grammar <- &("Foo Bar") "Foo"'.
	parser := self grammar: grammar start: 'Grammar'.
	self
		assert: ((parser parse: 'Foo') isKindOf: PP2Failure);
		assert: (parser parse: 'Foo Bar') equals: #('Foo Bar' 'Foo')
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testChoice [

	| grammar parser |
	grammar := 'Grammar <- "Foo" / "Bar" / "Baz"'.
	parser := self grammar: grammar start: 'Grammar'.
	self
		assert: ((parser parse: '') isKindOf: PP2Failure);
		assert: (parser parse: 'Foo') equals: 'Foo';
		assert: (parser parse: 'Bar') equals: 'Bar';
		assert: (parser parse: 'Baz') equals: 'Baz'
]

{ #category : #'tests terminals' }
PP2PEGGrammarTest >> testClass [

	| grammar parser chars others |
	grammar := 'Grammar <- [^a-z0-9@]'.
	parser := self grammar: grammar start: 'Grammar'.
	chars := '^abcdefghijklmnopqrstuvwxyz0123456789@'.
	others := ((0 to: 255)
				collect: #asCharacter)
				reject: [:c | chars includes: c].
	chars do: [:c | self assert: (parser parse: c asString) equals: c].
	others do: [:c | self assert: ((parser parse: c asString) isKindOf: PP2Failure)]
]

{ #category : #'tests terminals' }
PP2PEGGrammarTest >> testClassQuotes [

	| grammar parser chars others |
	grammar := 'Grammar <- [\n\r\t\7\77-\277\\]'.
	parser := self grammar: grammar start: 'Grammar'.
	chars := (String new writeStream)
				nextPut: Character lf;
				nextPut: Character cr;
				nextPut: Character tab;
				nextPut: 8r7 asCharacter;
				nextPutAll: ((8r77 to: 8r277) collect: #asCharacter);
				nextPut: 8r277 asCharacter;
				nextPut: $\;
				contents.
	others := ((0 to: 255)
				collect: #asCharacter)
				reject: [:c | chars includes: c].
	chars do: [:c | self assert: (parser parse: c asString) equals: c].
	others do: [:c | self assert: ((parser parse: c asString) isKindOf: PP2Failure)].
]

{ #category : #'tests terminals' }
PP2PEGGrammarTest >> testLiteral [

	| grammar parser input |
	grammar := 'Double <- "some string"
			    Single <- ''some string'''.
	parser := self grammar: grammar.
	input := 'some string'.
	self
		assert: ((parser at: 'Double') parse: input) equals: input;
		assert: ((parser at: 'Single') parse: input) equals: input
]

{ #category : #'tests terminals' }
PP2PEGGrammarTest >> testLiteralQuotes [

	| grammar parser input |
	grammar := 'Double <- "\n\r\t\7\77\277\\"
			    Single <- ''\n\r\t\7\77\277\\'''.
	parser := self grammar: grammar.
	input := (String new writeStream)
				nextPut: Character lf;
				nextPut: Character cr;
				nextPut: Character tab;
				nextPut: 8r7 asCharacter;
				nextPut: 8r77 asCharacter;
				nextPut: 8r277 asCharacter;
				nextPut: $\;
				contents.
	self
		assert: ((parser at: 'Double') parse: input) equals: input;
		assert: ((parser at: 'Single') parse: input) equals: input
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testNot [

	| grammar parser |
	grammar := 'Grammar <- !("Foo Bar") "Foo"'.
	parser := self grammar: grammar start: 'Grammar'.
	self
		assert: ((parser parse: 'Foo Bar') isKindOf: PP2Failure);
		assert: (parser parse: 'Foo') equals: #(nil 'Foo')
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testPlus [

	| grammar parser |
	grammar := 'Grammar <- "Foo"+'.
	parser := self grammar: grammar start: 'Grammar'.
	self
		assert: ((parser parse: '') isKindOf: PP2Failure);
		assert: (parser parse: 'Foo') equals: #('Foo') asOrderedCollection;
		assert: (parser parse: 'FooFoo') equals: #('Foo' 'Foo') asOrderedCollection
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testQuestion [

	| grammar parser |
	grammar := 'Grammar <- "Foo"?'.
	parser := self grammar: grammar start: 'Grammar'.
	self
		assert: (parser parse: '') equals: nil;
		assert: (parser parse: 'Foo') equals: 'Foo'
]

{ #category : #'tests grammar' }
PP2PEGGrammarTest >> testReference [

	| grammar parser |
	grammar := 'Grammar <- Foo / Bar
			    Foo <- "Foo"
			    Bar <- "Bar"'.
	parser := self grammar: grammar start: 'Grammar'.
	self
		assert: (parser parse: 'Foo') equals: 'Foo';
		assert: (parser parse: 'Bar') equals: 'Bar'
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testSequence [

	| grammar parser |
	grammar := 'Grammar <- "Foo" "Bar" "Baz"'.
	parser := self grammar: grammar start: 'Grammar'.
	self
		assert: ((parser parse: 'FooBar') isKindOf: PP2Failure);
		assert: (parser parse: 'FooBarBaz') equals: #('Foo' 'Bar' 'Baz')
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testStar [

	| grammar parser |
	grammar := 'Grammar <- "Foo"*'.
	parser := self grammar: grammar start: 'Grammar'.
	self
		assert: (parser parse: '') equals: OrderedCollection new;
		assert: (parser parse: 'Foo') equals: #('Foo') asOrderedCollection;
		assert: (parser parse: 'FooFoo') equals: #('Foo' 'Foo') asOrderedCollection
]
