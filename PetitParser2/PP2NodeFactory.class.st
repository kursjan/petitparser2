Class {
	#name : #PP2NodeFactory,
	#superclass : #Object,
	#classInstVars : [
		'Instance'
	],
	#category : 'PetitParser2-Core'
}

{ #category : #accessing }
PP2NodeFactory class >> instance [
	Instance isNil ifTrue: [  
		Instance := PP2NodeFactory new
	].

	^ Instance
]

{ #category : #accessing }
PP2NodeFactory class >> reset [
	Instance := nil
]

{ #category : #predicates }
PP2NodeFactory >> any [
	^ PP2PredicateObjectNode new
		predicate: [ :each | true ];
		predicateMessage: 'input expected';
		negated: [ :each | false ];
		negatedMessage: 'no input expected';
		yourself

]

{ #category : #predicates }
PP2NodeFactory >> blank [
	| collection |
	collection := OrderedCollection with: Character space with: Character tab.
	^ PP2PredicateObjectNode new 
		predicate: (PP2CharSetPredicate on: [ :char | collection includes: char ]);
		predicateMessage: 'blank expected';
		negated: (PP2CharSetPredicate on: [:char | (collection includes: char) not ]);
		negatedMessage: 'blank not expected';
		yourself
]

{ #category : #predicates }
PP2NodeFactory >> digit [
	^ PP2PredicateObjectNode new
		predicate: (PP2CharSetPredicate on: [ :char | char isDigit ]);
		predicateMessage: 'digit expected';
		negated: (PP2CharSetPredicate on: [ :char | char isDigit not ]);
		negatedMessage: 'digit not expected';
		yourself
]

{ #category : #'instance creation' }
PP2NodeFactory >> endOfInput [
	^ PP2EndOfInputNode new
]

{ #category : #'instance creation' }
PP2NodeFactory >> endOfLine [
	^ PP2EndOfLineNode new
]

{ #category : #'instance creation' }
PP2NodeFactory >> eoi [
	^ PP2EndOfInputNode new
]

{ #category : #'instance creation' }
PP2NodeFactory >> epsilon [
	^ PP2EpsilonNode instance
]

{ #category : #'instance creation' }
PP2NodeFactory >> failure [
	^ PP2FailingNode new
]

{ #category : #predicates }
PP2NodeFactory >> hex [
	| hexBlock |
	hexBlock := [ :char | (char between: $0 and: $9) 
					or: [ (char between: $a and: $f) 
					or: [ (char between: $A and: $F) ] ]  ].
		
	^ PP2PredicateObjectNode new
		predicate: (PP2CharSetPredicate on: hexBlock);
		predicateMessage: 'hex digit expected';
		negated: (PP2CharSetPredicate on: [:char | (hexBlock value: char) not]);
		negatedMessage: 'hex digit not expected';
		yourself
]

{ #category : #predicates }
PP2NodeFactory >> letter [
	^ PP2PredicateObjectNode new
		predicate: (PP2CharSetPredicate on: [ :char | char isLetter ]);
		predicateMessage: 'letter expected';
		negated: (PP2CharSetPredicate on: [ :char | char isLetter not ]);
		negatedMessage: 'letter not expected';
		yourself
]

{ #category : #'instance creation' }
PP2NodeFactory >> newline [
	^ PP2NewLineNode new
]

{ #category : #context }
PP2NodeFactory >> pop [
	^ nil asPParser pop
]

{ #category : #predicates }
PP2NodeFactory >> space [
	^ PP2PredicateObjectNode new 
		predicate: (PP2CharSetPredicate on: [ :char | char isSeparator ]);
		predicateMessage: 'separator expected';
		negated: (PP2CharSetPredicate on: [ :char | char isSeparator not ]);
		negatedMessage: 'separator not expected';
		yourself
]

{ #category : #'instance creation' }
PP2NodeFactory >> startOfLine [
	^ PP2StartOfLineNode new
]

{ #category : #seas }
PP2NodeFactory >> water [
	^ nil asPParser sea flatten
]

{ #category : #predicates }
PP2NodeFactory >> word [
	^ PP2PredicateObjectNode new
		predicate: (PP2CharSetPredicate on: [ :char | char isAlphaNumeric ]);
		predicateMessage: 'letter or digit expected';
		negated: (PP2CharSetPredicate on: [ :char | char isAlphaNumeric not ]);
		negatedMessage: 'letter or digit not expected';
		yourself
]
