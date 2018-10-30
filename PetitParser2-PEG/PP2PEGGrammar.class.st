"
I am a PEG formally describing my own ASCII syntax from [1].

Please see #grammarPEG on my class side for my textual representation.
I slightly adapt the definitions of 'Primary' and 'Char' to facilitate easier parser construction.

All my production methods and variables are generated using #bootstrap on the class side.
Warning: Modifying them manually may break the bootstrapping process.

[1] Bryan Ford.
'Parsing Expression Grammars: A Recognition-based Syntactic Foundation'.
"
Class {
	#name : #PP2PEGGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'LEFTARROW',
		'DOT',
		'OPEN',
		'IdentCont',
		'EndOfFile',
		'Suffix',
		'Comment',
		'QUESTION',
		'Primary',
		'STAR',
		'Identifier',
		'Literal',
		'EndOfLine',
		'CLOSE',
		'SLASH',
		'Spacing',
		'NOT',
		'Definition',
		'Space',
		'Reference',
		'Char',
		'Class',
		'Grammar',
		'PLUS',
		'Sequence',
		'Range',
		'IdentStart',
		'Parenthesised',
		'Prefix',
		'AND',
		'Expression',
		'CharEscape',
		'CharOctal',
		'CharNormal'
	],
	#category : #'PetitParser2-PEG'
}

{ #category : #'initialize-release' }
PP2PEGGrammar class >> bootstrap [
	"Generate the receiver's production methods and variables from the textual description.
	Warning: This is circular and ovewrites the receiver's productions. Hence, be sure the grammar is correct."
	
	^(PP2PEGParserCompiler parser: self grammar: self grammarPEG)
]

{ #category : #grammars }
PP2PEGGrammar class >> grammarPEG [
	"PEG formally describing its own ASCII syntax from [1].
	Definitions of 'Primary' and 'Char' slightly adapted to parsing to facilitate easier parser construction.

	[1] Bryan Ford.
	'Parsing Expression Grammars: A Recognition-based Syntactic Foundation'.
	POPL'04.
	http://doi.acm.org/10.1145/964001.964011 ."

	^'
# Hierarchical syntax
Grammar	<- Spacing Definition+ EndOfFile
Definition	<- Identifier LEFTARROW Expression
Expression	<- Sequence (SLASH Sequence)*
Sequence	<- Prefix*
Prefix		<- (AND / NOT)? Suffix
Suffix		<- Primary (QUESTION / STAR / PLUS)?
Primary		<- Reference
			  / Parenthesised
			  / Literal / Class / DOT
Reference	<- Identifier !LEFTARROW
Parenthesised <- OPEN Expression CLOSE

# Lexical syntax
Identifier		<- IdentStart IdentCont* Spacing
IdentStart	<- [a-zA-Z_]
IdentCont	<- IdentStart / [0-9]

Literal		<- [''] (![''] Char)* [''] Spacing
			  / ["] (!["] Char)* ["] Spacing
Class		<- ''['' (!'']'' Range)* '']'' Spacing
Range		<- Char (''-'' Char)?
Char		<- CharEscape / CharOctal / CharNormal
CharEscape	<- ''\\'' [nrt''"\[\]\\]
CharOctal	<- "\\" ( [0-2][0-7][0-7] / [0-7][0-7] / [0-7] )
CharNormal	<- !''\\'' .

LEFTARROW	<- ''<-'' Spacing
SLASH		<- ''/'' Spacing
AND		<- ''&'' Spacing
NOT		<- ''!'' Spacing
QUESTION	<- ''?'' Spacing
STAR		<- ''*'' Spacing
PLUS		<- ''+'' Spacing
OPEN		<- ''('' Spacing
CLOSE		<- '')'' Spacing
DOT		<- ''.'' Spacing

Spacing		<- (Space / Comment)*
Comment	<- ''#'' (!EndOfLine .)* EndOfLine
Space		<- '' '' / ''\t'' / EndOfLine
EndOfLine	<- ''\r\n'' / ''\n'' / ''\r''
EndOfFile	<- !.'
]

{ #category : #'initialize-release' }
PP2PEGGrammar class >> resetProductions [
	"Warning: Use with care, resetting breaks this parser and its subclasses."

	| ignore |
	ignore := self ignoredNames.
	self instVarNames do: 
			[:prod |
			(ignore includes: prod)
				ifFalse: 
					[self
						removeInstVarName: prod;
						removeSelector: prod asSymbol;
						removeSelector: #start]]
]

{ #category : #'lexical symbols' }
PP2PEGGrammar >> AND [

	^ ('&' asPParser , Spacing)
]

{ #category : #'lexical symbols' }
PP2PEGGrammar >> CLOSE [

	^ (')' asPParser , Spacing)
]

{ #category : #lexical }
PP2PEGGrammar >> Char [

	^ (CharEscape / CharOctal / CharNormal)
]

{ #category : #lexical }
PP2PEGGrammar >> CharEscape [

	^ ('\' asPParser , (PP2PredicateObjectNode on: [:char | char = $n or: [char = $r or: [char = $t or: [char = $' or: [char = $" or: [char = $[ or: [char = $] or: [char = $\]]]]]]]] message: 'expected char from char set'))
]

{ #category : #lexical }
PP2PEGGrammar >> CharNormal [

	^ ('\' asPParser not , #any asPParser)
]

{ #category : #lexical }
PP2PEGGrammar >> CharOctal [

	^ ('\' asPParser , (((PP2PredicateObjectNode on: [:char | (char between: $0 and: $2)] message: 'expected char from char set') , (PP2PredicateObjectNode on: [:char | (char between: $0 and: $7)] message: 'expected char from char set') , (PP2PredicateObjectNode on: [:char | (char between: $0 and: $7)] message: 'expected char from char set')) / ((PP2PredicateObjectNode on: [:char | (char between: $0 and: $7)] message: 'expected char from char set') , (PP2PredicateObjectNode on: [:char | (char between: $0 and: $7)] message: 'expected char from char set')) / (PP2PredicateObjectNode on: [:char | (char between: $0 and: $7)] message: 'expected char from char set')))
]

{ #category : #lexical }
PP2PEGGrammar >> Class [

	^ ('[' asPParser , (']' asPParser not , Range) star , ']' asPParser , Spacing)
]

{ #category : #'lexical whitespace' }
PP2PEGGrammar >> Comment [

	^ ('#' asPParser , (EndOfLine not , #any asPParser) star , EndOfLine)
]

{ #category : #'lexical symbols' }
PP2PEGGrammar >> DOT [

	^ ('.' asPParser , Spacing)
]

{ #category : #hierarchical }
PP2PEGGrammar >> Definition [

	^ (Identifier , LEFTARROW , Expression)
]

{ #category : #'lexical whitespace' }
PP2PEGGrammar >> EndOfFile [

	^ #any asPParser not
]

{ #category : #'lexical whitespace' }
PP2PEGGrammar >> EndOfLine [

	^ ((String new writeStream nextPut: Character cr; nextPut: Character lf; contents) asPParser / (String new writeStream nextPut: Character lf; contents) asPParser / (String new writeStream nextPut: Character cr; contents) asPParser)
]

{ #category : #hierarchical }
PP2PEGGrammar >> Expression [

	^ (Sequence , (SLASH , Sequence) star)
]

{ #category : #hierarchical }
PP2PEGGrammar >> Grammar [

	^ (Spacing , Definition plus , EndOfFile)
]

{ #category : #lexical }
PP2PEGGrammar >> IdentCont [

	^ (IdentStart / (PP2PredicateObjectNode on: [:char | (char between: $0 and: $9)] message: 'expected char from char set'))
]

{ #category : #lexical }
PP2PEGGrammar >> IdentStart [

	^ (PP2PredicateObjectNode on: [:char | (char between: $a and: $z) or: [(char between: $A and: $Z) or: [char = $_]]] message: 'expected char from char set')
]

{ #category : #lexical }
PP2PEGGrammar >> Identifier [

	^ (IdentStart , IdentCont star , Spacing)
]

{ #category : #'lexical symbols' }
PP2PEGGrammar >> LEFTARROW [

	^ ('<-' asPParser , Spacing)
]

{ #category : #lexical }
PP2PEGGrammar >> Literal [

	^ (((PP2PredicateObjectNode on: [:char | char = $'] message: 'expected char from char set') , ((PP2PredicateObjectNode on: [:char | char = $'] message: 'expected char from char set') not , Char) star , (PP2PredicateObjectNode on: [:char | char = $'] message: 'expected char from char set') , Spacing) / ((PP2PredicateObjectNode on: [:char | char = $"] message: 'expected char from char set') , ((PP2PredicateObjectNode on: [:char | char = $"] message: 'expected char from char set') not , Char) star , (PP2PredicateObjectNode on: [:char | char = $"] message: 'expected char from char set') , Spacing))
]

{ #category : #'lexical symbols' }
PP2PEGGrammar >> NOT [

	^ ('!' asPParser , Spacing)
]

{ #category : #'lexical symbols' }
PP2PEGGrammar >> OPEN [

	^ ('(' asPParser , Spacing)
]

{ #category : #'lexical symbols' }
PP2PEGGrammar >> PLUS [

	^ ('+' asPParser , Spacing)
]

{ #category : #hierarchical }
PP2PEGGrammar >> Parenthesised [

	^ (OPEN , Expression , CLOSE)
]

{ #category : #hierarchical }
PP2PEGGrammar >> Prefix [

	^ ((AND / NOT) optional , Suffix)
]

{ #category : #hierarchical }
PP2PEGGrammar >> Primary [

	^ (Reference / Parenthesised / Literal / Class / DOT)
]

{ #category : #'lexical symbols' }
PP2PEGGrammar >> QUESTION [

	^ ('?' asPParser , Spacing)
]

{ #category : #lexical }
PP2PEGGrammar >> Range [

	^ (Char , ('-' asPParser , Char) optional)
]

{ #category : #hierarchical }
PP2PEGGrammar >> Reference [

	^ (Identifier , LEFTARROW not)
]

{ #category : #'lexical symbols' }
PP2PEGGrammar >> SLASH [

	^ ('/' asPParser , Spacing)
]

{ #category : #'lexical symbols' }
PP2PEGGrammar >> STAR [

	^ ('*' asPParser , Spacing)
]

{ #category : #hierarchical }
PP2PEGGrammar >> Sequence [

	^ Prefix star
]

{ #category : #'lexical whitespace' }
PP2PEGGrammar >> Space [

	^ (' ' asPParser / '	' asPParser / EndOfLine)
]

{ #category : #'lexical whitespace' }
PP2PEGGrammar >> Spacing [

	^ (Space / Comment) star
]

{ #category : #hierarchical }
PP2PEGGrammar >> Suffix [

	^ (Primary , (QUESTION / STAR / PLUS) optional)
]

{ #category : #accessing }
PP2PEGGrammar >> at: aProductionName [

	^super productionAt: aProductionName
]

{ #category : #accessing }
PP2PEGGrammar >> start [

	^Grammar
]
