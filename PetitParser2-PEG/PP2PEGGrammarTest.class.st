"
I am a set of generic tests for the PEG production rules.
"
Class {
	#name : #PP2PEGGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #'PetitParser2-PEG'
}

{ #category : #testing }
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

	| grammar prs |
	grammar := 'Grammar <- &("Foo Bar") "Foo"'.
	prs := self grammar: grammar start: 'Grammar'.
	self
		assert: prs fail: 'Foo';
		assert: prs parse: 'Foo Bar' to: #('Foo Bar' 'Foo') end: 3
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testChoice [

	| grammar prs |
	grammar := 'Grammar <- "Foo" / "Bar" / "Baz"'.
	prs := self grammar: grammar start: 'Grammar'.
	self
		assert: prs fail: '';
		assert: prs parse: 'Foo' to: 'Foo';
		assert: prs parse: 'Bar' to: 'Bar';
		assert: prs parse: 'Baz' to: 'Baz'
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testClass [

	| grammar prs chars others |
	grammar := 'Grammar <- [^a-z0-9@]'.
	prs := self grammar: grammar start: 'Grammar'.
	chars := '^abcdefghijklmnopqrstuvwxyz0123456789@'.
	others := ((0 to: 255)
				collect: #asCharacter)
				reject: [:c | chars includes: c].
	chars do: [:c | self assert: prs parse: c asString to: c].
	others do: [:c | self assert: prs fail: c asString]
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testClassQuotes [

	| grammar prs chars others |
	grammar := 'Grammar <- [\n\r\t\7\77-\277\\]'.
	prs := self grammar: grammar start: 'Grammar'.
	chars := (String new writeStream)
				nextPut: Character lf;
				nextPut: Character cr;
				nextPut: Character tab;
				nextPut: 8r7 asCharacter;
				nextPutAll: ((8r77 to: 8r277) collect: #asCharacter);
				nextPut: 8r277 asCharacter;
				nextPut: $\;
				contents.
	others := ((0 to: 255) collect: #asCharacter)
				reject: [:c | chars includes: c].
	chars do: [:c | self assert: prs parse: c asString to: c].
	others do: [:c | self assert: prs fail: c asString]
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testEndOfLine [
	"Check that line endings CR and LF are preserved."

	| prs cr lf crlf |
	prs := self parserInstance at: 'EndOfLine'.
	cr := String with: Character cr.
	lf := String with: Character lf.
	crlf := String with: Character cr with: Character lf.
	self
		assert: prs parse: cr to: cr;
		assert: prs parse: lf to: lf;
		assert: prs parse: crlf to: crlf
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testLiteral [

	| grammar prs input |
	grammar := 'Double <- "some string"
			    Single <- ''some string'''.
	prs := self grammar: grammar.
	input := 'some string'.
	self
		assert: (prs at: 'Double') parse: input to: input;
		assert: (prs at: 'Single') parse: input to: input
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testLiteralQuotes [

	| grammar prs input |
	grammar := 'Double <- "\n\r\t\7\77\277\\"
			    Single <- ''\n\r\t\7\77\277\\'''.
	prs := self grammar: grammar.
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
		assert: (prs at: 'Double') parse: input to: input;
		assert: (prs at: 'Single') parse: input to: input
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testNot [

	| grammar prs |
	grammar := 'Grammar <- !("Foo Bar") "Foo"'.
	prs := self grammar: grammar start: 'Grammar'.
	self
		assert: prs fail: 'Foo Bar' ;
		assert: prs parse: 'Foo' to: #(nil 'Foo')
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testPlus [

	| grammar prs |
	grammar := 'Grammar <- "Foo"+'.
	prs := self grammar: grammar start: 'Grammar'.
	self
		assert: prs fail: '';
		assert: prs parse: 'Foo' to: #('Foo') asOrderedCollection;
		assert: prs parse: 'FooFoo' to: #('Foo' 'Foo') asOrderedCollection
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testQuestion [

	| grammar prs |
	grammar := 'Grammar <- "Foo"?'.
	prs := self grammar: grammar start: 'Grammar'.
	self
		assert: prs parse: '' to: nil;
		assert: prs parse: 'Foo' to: 'Foo'
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testReference [

	| grammar prs |
	grammar := 'Grammar <- Foo / Bar
			    Foo <- "Foo"
			    Bar <- "Bar"'.
	prs := self grammar: grammar start: 'Grammar'.
	self
		assert: prs parse: 'Foo' to: 'Foo';
		assert: prs parse: 'Bar' to: 'Bar'
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testSequence [

	| grammar prs |
	grammar := 'Grammar <- "Foo" "Bar" "Baz"'.
	prs := self grammar: grammar start: 'Grammar'.
	self
		assert: prs fail: 'FooBar' end: 6;
		assert: prs parse: 'FooBarBaz' to: #('Foo' 'Bar' 'Baz')
]

{ #category : #'tests nonterminals' }
PP2PEGGrammarTest >> testStar [

	| grammar prs |
	grammar := 'Grammar <- "Foo"*'.
	prs := self grammar: grammar start: 'Grammar'.
	self
		assert: prs parse: '' to: OrderedCollection new;
		assert: prs parse: 'Foo' to: #('Foo') asOrderedCollection;
		assert: prs parse: 'FooFoo' to: #('Foo' 'Foo') asOrderedCollection
]
