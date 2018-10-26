"
I am parser from PEG ASCII syntax to PetitParser2 parser combinators.

I parse a PEG and build a dictionary productions and corresponding parsers.
My formal syntax definition can be found in PP2PEGGrammar class>>grammarPEG.

To parse a PEG and build a parser use
	class>>grammar: aPEG
	class>>grammar: aPEG start: aProductionName

For example, to build a PEG parser do
	PP2PEGParserParser grammar: PP2PEGGrammar grammarPEG start: 'Grammar'.

Instance Variables:
	definitions		<Dictionary>		production rules of the PEG

"
Class {
	#name : #PP2PEGParserParser,
	#superclass : #PP2PEGGrammar,
	#instVars : [
		'definitions'
	],
	#category : #'PetitParser2-PEG'
}

{ #category : #parsers }
PP2PEGParserParser class >> bootstrap [
	"Prevent the receiver from self-destruction."

	self shouldNotImplement
]

{ #category : #parsing }
PP2PEGParserParser class >> grammar: aPEG [
	"Parse a grammar and answer a dictionary of named productions."

	^self new parse: aPEG
]

{ #category : #parsing }
PP2PEGParserParser class >> grammar: aPEG start: aProductionName [
	"Parse a grammar and answer the parser for aProductionName."

	^(self grammar: aPEG) at: aProductionName
]

{ #category : #accessing }
PP2PEGParserParser class >> ignoredNames [

	^super ignoredNames , #(#definitions)
]

{ #category : #'lexical symbols' }
PP2PEGParserParser >> AND [

	^super AND ==> [:args | #and]
]

{ #category : #lexical }
PP2PEGParserParser >> CharEscape [

	^super CharEscape ==> [:args | self escape: args second]
]

{ #category : #lexical }
PP2PEGParserParser >> CharNormal [

	^super CharNormal ==> [:args | args second]
]

{ #category : #lexical }
PP2PEGParserParser >> CharOctal [

	^super CharOctal ==> 
			[:args |
			| octals |
			octals := args second.
			octals := octals isCollection
						ifTrue: [String withAll: octals]
						ifFalse: [String with: octals].
			('8r' , octals) asNumber asCharacter]
]

{ #category : #lexical }
PP2PEGParserParser >> Class [

	^super Class ==> 
			[:args |
			| sets predicate |
			sets := args second collect: #second.
			predicate := [:char | sets anySatisfy: [:range | range value: char]].
			PP2PredicateObjectNode on: predicate message: 'expected char from char set']
]

{ #category : #'lexical symbols' }
PP2PEGParserParser >> DOT [

	^super DOT ==> [:args | #any asPParser]
]

{ #category : #hierarchical }
PP2PEGParserParser >> Definition [

	^super Definition ==> 
			[:args |
			| identifier expression |
			identifier := args first.
			expression := args third.
			(definitions includesKey: identifier)
				ifTrue: 
					[| par |
					par := definitions at: identifier.
					par isUnresolved
						ifTrue: [par def: expression]
						ifFalse: [self error: 'Redefinition of: ' , identifier]]
				ifFalse: [definitions at: identifier put: expression].
			identifier -> (definitions at: identifier)]
]

{ #category : #hierarchical }
PP2PEGParserParser >> Expression [

	^super Expression
		==> [:args | args second inject: args first into: [:par :alt | par / alt last]]
]

{ #category : #hierarchical }
PP2PEGParserParser >> Grammar [

	^super Grammar ==> [:args | definitions]
]

{ #category : #lexical }
PP2PEGParserParser >> Identifier [

	^super Identifier ==> 
			[:args |
			| first rest |
			first := args first.
			rest := args second.
			((String new: rest size + 1) writeStream)
				nextPut: first;
				nextPutAll: rest;
				contents]
]

{ #category : #lexical }
PP2PEGParserParser >> Literal [

	^super Literal ==> 
			[:args |
			| characters stream |
			characters := args second.
			stream := (String new: characters size) writeStream.
			characters do: [:each | stream nextPut: each second].
			stream contents asPParser]
]

{ #category : #'lexical symbols' }
PP2PEGParserParser >> NOT [

	^super NOT ==> [:args | #not]
]

{ #category : #'lexical symbols' }
PP2PEGParserParser >> PLUS [

	^super PLUS ==> [:args | #plus]
]

{ #category : #hierarchical }
PP2PEGParserParser >> Parenthesised [

	^super Parenthesised ==> [:args | args second]
]

{ #category : #hierarchical }
PP2PEGParserParser >> Prefix [

	^super Prefix ==> 
			[:args |
			| modifier suffix |
			modifier := args first.
			suffix := args second.
			modifier ifNil: [suffix] ifNotNil: [modifier value: suffix]]
]

{ #category : #'lexical symbols' }
PP2PEGParserParser >> QUESTION [

	^super QUESTION ==> [:args | #optional]
]

{ #category : #lexical }
PP2PEGParserParser >> Range [

	^super Range ==> 
			[:args |
			| from |
			from := args first.
			args second
				ifNil: [[:char | char = from]]
				ifNotNil: 
					[:pair |
					| to |
					to := pair second.
					[:char | char between: from and: to]]]
]

{ #category : #hierarchical }
PP2PEGParserParser >> Reference [

	^super Reference
		==> [:args | definitions at: args first ifAbsentPut: [PP2UnresolvedNode new]]
]

{ #category : #'lexical symbols' }
PP2PEGParserParser >> STAR [

	^super STAR ==> [:args | #star]
]

{ #category : #hierarchical }
PP2PEGParserParser >> Sequence [

	^super Sequence ==> [:parsers | parsers fold: [:seq :par | seq , par]]
]

{ #category : #hierarchical }
PP2PEGParserParser >> Suffix [

	^super Suffix ==> 
			[:args |
			| primary cardinality |
			primary := args first.
			cardinality := args second.
			cardinality ifNil: [primary] ifNotNil: [cardinality value: primary]]
]

{ #category : #private }
PP2PEGParserParser >> escape: character [

	character = $n ifTrue: [^Character lf].
	character = $r ifTrue: [^Character cr].
	character = $t ifTrue: [^Character tab].
	^character
]

{ #category : #'initialize-release' }
PP2PEGParserParser >> initialize [

	super initialize.
	definitions := Dictionary new.
]
