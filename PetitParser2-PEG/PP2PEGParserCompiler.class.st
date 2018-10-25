"
I am compiler from PEG ASCII syntax to PetitParser2 parser classes.

I parse a PEG and add corresponding methods and variables to a given parser class.
Usually, the parser class is a subclass of PP2CompositeNode.
My formal syntax definition can be found in PP2PEGGrammar class>>grammarPEG.

To configure me with a class and start production use
	class>>parser: aClass
	class>>parser: aClass start: aProductionName

To actually parse a PEG and generate code use
	>>parse: aPEG

See PP2PEGGrammar class>>bootstrap for an example.

Instance Variables:
	definitions		<Dictionary>		production rules of the PEG
	parserClass	<Class>			compilation target class
	references		<(Set of: (String))> names of referenced productions
	start			<String>			name of the start production
"
Class {
	#name : #PP2PEGParserCompiler,
	#superclass : #PP2PEGGrammar,
	#instVars : [
		'definitions',
		'parserClass',
		'references',
		'start'
	],
	#category : #'PetitParser2-PEG'
}

{ #category : #parsers }
PP2PEGParserCompiler class >> bootstrap [
	"Prevent the receiver from self-destruction."

	self shouldNotImplement
]

{ #category : #accessing }
PP2PEGParserCompiler class >> ignoredNames [

	^super ignoredNames , #(#definitions #parserClass #references #start)
]

{ #category : #'instance creation' }
PP2PEGParserCompiler class >> parser: aClass [
	"Use aClass as compilation target and assume 'Grammar' as start production"

	^self new parser: aClass start: 'Grammar'
]

{ #category : #'instance creation' }
PP2PEGParserCompiler class >> parser: aClass start: aProductionName [
	"Use aClass as compilation target and aProductionName as start production"

	^self new parser: aClass start: aProductionName
]

{ #category : #'lexical symbols' }
PP2PEGParserCompiler >> AND [

	^super AND ==> [:args | [:par | par , ' and']]
]

{ #category : #lexical }
PP2PEGParserCompiler >> Char [

	^super Char ==> 
			[:args |
			| char |
			char := args second.
			args first = '\' ifTrue: [self escape: args] ifFalse: [char]]
]

{ #category : #lexical }
PP2PEGParserCompiler >> Class [

	^super Class ==> 
			[:args |
			| sets predicate |
			sets := args second collect: #second.
			predicate := sets isEmpty
						ifTrue: ['false']
						ifFalse: 
							[(sets fold: [:test :range | test , ' or: [' , range])
								, (String new: sets size - 1 withAll: $])].
			'(PP2PredicateObjectNode on: [:char | ' , predicate , '] message: ''expected char from char set'')']
]

{ #category : #'lexical symbols' }
PP2PEGParserCompiler >> DOT [

	^super DOT ==> [:args | '#any asPParser']
]

{ #category : #hierarchical }
PP2PEGParserCompiler >> Definition [

	| method |
	^super Definition ==> 
			[:args |
			| identifier expression |
			identifier := args first.
			expression := args third.
			definitions at: identifier
				ifPresent: [self error: 'Redefinition of: ' , identifier].
			method := (String new writeStream)
						nextPutAll: identifier;
						cr;
						cr;
						tab;
						nextPut: $^;
						space;
						nextPutAll: expression;
						contents.
			definitions at: identifier put: method.
			identifier -> expression]
]

{ #category : #hierarchical }
PP2PEGParserCompiler >> Expression [

	^super Expression ==> 
			[:args |
			| first rest |
			first := args first.
			rest := args second.
			rest isEmpty
				ifTrue: [first]
				ifFalse: 
					[self
						parenthesize: (rest inject: first into: [:par :alt | par , ' / ' , alt last])]]
]

{ #category : #hierarchical }
PP2PEGParserCompiler >> Grammar [

	^super Grammar ==> 
			[:args |
			| methodStart |
			references do: 
					[:ref |
					(definitions keys includes: ref)
						ifFalse: [self error: 'Missing definition of ' , ref]].
			definitions keysDo: [:variable | (parserClass allInstVarNames includes: variable) ifFalse: [parserClass addInstVarNamed: variable]].
			definitions values do: [:method | parserClass compile: method].
			methodStart := (String new writeStream)
						nextPutAll: 'start';
						cr;
						cr;
						tab;
						nextPut: $^;
						nextPutAll: start;
						contents.
			parserClass compile: methodStart classified: 'accessing'.
			parserClass]
]

{ #category : #lexical }
PP2PEGParserCompiler >> Identifier [

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
PP2PEGParserCompiler >> Literal [

	^super Literal ==> 
			[:args |
			| characters stream |
			characters := args second.
			stream := (String new: characters size) writeStream.
			characters do: [:each | stream nextPut: each second].
			stream contents storeString , ' asPParser']
]

{ #category : #'lexical symbols' }
PP2PEGParserCompiler >> NOT [

	^super NOT ==> [:args | [:par | par , ' not']]
]

{ #category : #'lexical symbols' }
PP2PEGParserCompiler >> PLUS [

	^super PLUS ==> [:args | [:par | par , ' plus']]
]

{ #category : #hierarchical }
PP2PEGParserCompiler >> Parenthesised [

	^super Parenthesised ==> [:args | args second]
]

{ #category : #hierarchical }
PP2PEGParserCompiler >> Prefix [

	^super Prefix ==> 
			[:args |
			| modifier suffix |
			modifier := args first.
			suffix := args second.
			modifier ifNil: [suffix] ifNotNil: [modifier value: suffix]]
]

{ #category : #'lexical symbols' }
PP2PEGParserCompiler >> QUESTION [

	^super QUESTION ==> [:args | [:par | par , ' optional']]
]

{ #category : #lexical }
PP2PEGParserCompiler >> Range [

	^super Range ==> 
			[:args |
			| from |
			from := args first storeString.
			args second
				ifNil: ['char = ' , from]
				ifNotNil: 
					[:pair |
					| to |
					to := pair second storeString.
					self parenthesize: 'char between: ' , from , ' and: ' , to]]
]

{ #category : #hierarchical }
PP2PEGParserCompiler >> Reference [

	^super Reference ==> [:args | references add: args first]
]

{ #category : #'lexical symbols' }
PP2PEGParserCompiler >> STAR [

	^super STAR ==> [:args | [:par | par , ' star']]
]

{ #category : #hierarchical }
PP2PEGParserCompiler >> Sequence [

	^super Sequence ==> 
			[:parsers |
			parsers size = 1
				ifTrue: [parsers first]
				ifFalse: [self parenthesize: (parsers fold: [:seq :par | seq , ' , ' , par])]]
]

{ #category : #hierarchical }
PP2PEGParserCompiler >> Suffix [

	^super Suffix ==> 
			[:args |
			| primary cardinality |
			primary := args first.
			cardinality := args second.
			cardinality ifNil: [primary] ifNotNil: [cardinality value: primary]]
]

{ #category : #private }
PP2PEGParserCompiler >> escape: characters [

	| character |
	character := characters second.
	"whitespace"
	character = $n ifTrue: [^Character lf].
	character = $r ifTrue: [^Character cr].
	character = $t ifTrue: [^Character tab].
	"octal code"
	character isDigit
		ifTrue: 
			[| code |
			code := characters reject: [:c | c isNil or: [c isCollection]].
			^('8r' , (String withAll: code)) asNumber asCharacter].
	"literal character"
	^character
]

{ #category : #'initialize-release' }
PP2PEGParserCompiler >> initialize [
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	self reset.
	^self
]

{ #category : #private }
PP2PEGParserCompiler >> parenthesize: parser [

	^'(' , parser , ')'
]

{ #category : #'parsing - private' }
PP2PEGParserCompiler >> parseOn: context [

	self reset.
	^super parseOn: context
]

{ #category : #accessing }
PP2PEGParserCompiler >> parser: aClass start: aProductionName [

	parserClass := aClass.
	start := aProductionName.
]

{ #category : #'initialize-release' }
PP2PEGParserCompiler >> reset [

	definitions := Dictionary new.
	references := Set new
]
