"
Example of a grammar that differs depending on the input. Based on the value read in the `head` rule, the rule of `body` is created.
"
Class {
	#name : #PP2AdaptableGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'body',
		'content',
		'head',
		'element'
	],
	#category : 'PetitParser2-Experiments-Adaptable'
}

{ #category : #accessing }
PP2AdaptableGrammar >> body [
	^ PP2AdaptableNode new
]

{ #category : #accessing }
PP2AdaptableGrammar >> content [
	^ element star
]

{ #category : #accessing }
PP2AdaptableGrammar >> element [
	^ head, body
]

{ #category : #accessing }
PP2AdaptableGrammar >> head [
	"I set the body parser dynamically; based on the result of the head"
	^ #digit asPParser plus flatten 
	
	==> [ :_number |
		body changeChild: (#any asPParser times: _number asNumber) flatten
	]
]

{ #category : #accessing }
PP2AdaptableGrammar >> start [
	^ content
]
