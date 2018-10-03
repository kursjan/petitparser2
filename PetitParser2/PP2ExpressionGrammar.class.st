Class {
	#name : #PP2ExpressionGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'terms',
		'addition',
		'number',
		'parentheses',
		'multiplication',
		'primary',
		'openBracket',
		'closeBracket',
		'plus',
		'star'
	],
	#category : 'PetitParser2-Examples'
}

{ #category : #grammar }
PP2ExpressionGrammar >> addition [
	^ primary, plus trim, terms
]

{ #category : #tokens }
PP2ExpressionGrammar >> closeBracket [
	^ $) asPParser
]

{ #category : #grammar }
PP2ExpressionGrammar >> multiplication [
	^ primary, star trim, terms
]

{ #category : #tokens }
PP2ExpressionGrammar >> number [
	^ ($- asPParser optional , #digit asPParser plus , ($. asPParser, #digit asPParser plus) optional) flatten
]

{ #category : #tokens }
PP2ExpressionGrammar >> openBracket [
	^ $( asPParser
]

{ #category : #grammar }
PP2ExpressionGrammar >> parentheses [
	^ openBracket trim , terms , closeBracket trim
]

{ #category : #tokens }
PP2ExpressionGrammar >> plus [
	^ $+ asPParser
]

{ #category : #grammar }
PP2ExpressionGrammar >> primary [
	^ number / parentheses
]

{ #category : #tokens }
PP2ExpressionGrammar >> star [
	^ $* asPParser
]

{ #category : #accessing }
PP2ExpressionGrammar >> start [
	^ terms end
]

{ #category : #grammar }
PP2ExpressionGrammar >> terms [
	^ addition / multiplication / primary
]
