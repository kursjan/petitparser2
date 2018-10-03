Class {
	#name : #PP2CommaSeparatedParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'row',
		'cell',
		'rows',
		'endOfLine',
		'whitespace',
		'nonComma'
	],
	#category : 'PetitParser2-CSV'
}

{ #category : #accessing }
PP2CommaSeparatedParser >> cell [
	^ whitespace star , nonComma star flatten , whitespace star
		==> [ :nodes | nodes second value ]
]

{ #category : #accessing }
PP2CommaSeparatedParser >> endOfLine [
	^ #newline asPParser token
]

{ #category : #accessing }
PP2CommaSeparatedParser >> nonComma [
	^ PP2PredicateObjectNode noneOf: {Character space . Character tab . Character cr . Character lf . $, }
]

{ #category : #accessing }
PP2CommaSeparatedParser >> number [ 
	^ ($- asPParser optional , #digit asPParser plus , ($. asPParser , #digit asPParser plus) optional) token
		==> [ :nodes | nodes first value asNumber ]
]

{ #category : #accessing }
PP2CommaSeparatedParser >> row [
	^ (cell delimitedBy: $, asPParser token) ==> [ :nodes | nodes reject: [ :each | each isToken ] ]
]

{ #category : #accessing }
PP2CommaSeparatedParser >> rows [
	^ (row delimitedBy: endOfLine)  ==> [ :nodes | nodes reject: [ :each | each isToken ] ]
]

{ #category : #accessing }
PP2CommaSeparatedParser >> start [
	^ rows end
]

{ #category : #accessing }
PP2CommaSeparatedParser >> whitespace [
	^ #blank asPParser
]
