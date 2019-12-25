Class {
	#name : #PP2JsonGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'members',
		'pair',
		'string',
		'value',
		'elements',
		'number',
		'object',
		'array',
		'trueToken',
		'falseToken',
		'nullToken',
		'char',
		'stringToken',
		'numberToken',
		'charEscape',
		'charNormal',
		'charOctal'
	],
	#classVars : [
		'CharacterTable'
	],
	#category : #'PetitParser2-JSON'
}

{ #category : #initialization }
PP2JsonGrammar class >> initialize [
	CharacterTable := Dictionary new.
	CharacterTable
		at: $\ put: $\;
		at: $/ put: $/;
		at: $" put: $";
		at: $b put: Character backspace;
		at: $f put: Character newPage;
		at: $n put: Character lf;
		at: $r put: Character cr;
		at: $t put: Character tab
]

{ #category : #grammar }
PP2JsonGrammar >> array [
	^ $[ asPParser token trim , elements optional , $] asPParser token trim
]

{ #category : #primitives }
PP2JsonGrammar >> char [
	^ charEscape / charOctal / charNormal
]

{ #category : #primitives }
PP2JsonGrammar >> charEscape [
	^ $\ asPParser , (PP2PredicateObjectNode anyOf: (String withAll: CharacterTable keys))
]

{ #category : #primitives }
PP2JsonGrammar >> charNormal [
	^ PP2PredicateObjectNode noneOf: '\"'
]

{ #category : #primitives }
PP2JsonGrammar >> charOctal [
	^ '\u' asPParser , (#hex asPParser min: 4 max: 4)
]

{ #category : #grammar }
PP2JsonGrammar >> elements [
	^ value separatedBy: $, asPParser token trim
]

{ #category : #tokens }
PP2JsonGrammar >> falseToken [
	^ 'false' asPParser token trim
]

{ #category : #grammar }
PP2JsonGrammar >> members [
	^ pair separatedBy: $, asPParser token trim
]

{ #category : #tokens }
PP2JsonGrammar >> nullToken [
	^ 'null' asPParser token trim
]

{ #category : #primitives }
PP2JsonGrammar >> number [
	^ $- asPParser optional ,
		($0 asPParser / #digit asPParser plus) ,
		($. asPParser , #digit asPParser plus) optional , 
		(($e asPParser / $E asPParser) , ($- asPParser / $+ asPParser) optional , #digit asPParser plus) optional
]

{ #category : #tokens }
PP2JsonGrammar >> numberToken [
	^ number token trim
]

{ #category : #grammar }
PP2JsonGrammar >> object [
	^ ${ asPParser token trim , members optional , $} asPParser token trim
]

{ #category : #grammar }
PP2JsonGrammar >> pair [
	^ stringToken , $: asPParser token trim , value
]

{ #category : #accessing }
PP2JsonGrammar >> start [
	^ value end
]

{ #category : #primitives }
PP2JsonGrammar >> string [
	^ $" asPParser , char star , $" asPParser
]

{ #category : #tokens }
PP2JsonGrammar >> stringToken [
	^ string token trim
]

{ #category : #tokens }
PP2JsonGrammar >> trueToken [
	^ 'true' asPParser token trim
]

{ #category : #grammar }
PP2JsonGrammar >> value [
	^ stringToken / numberToken / object / array / trueToken / falseToken / nullToken
]
