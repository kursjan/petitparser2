"
I match input against a predicate block, like PP2PredicateSequenceNode, but for an unknown/variable length. 

For example, whereas for fixed-length matches you can already do: 
	parser := PP2PredicateSequenceNode 
		on: [ :value | value first isUppercase ] 
		message: 'uppercase 3 letter words' 
		size: 3. 
	(parser parse: 'Abc') isPetitFailure not. 

Now you can do: 
	parser := PP2FlexiblePredicateSequenceNode 
		on: [ :value | Object new respondsTo: value asSymbol  ] 
		message: 'message to an object' 
		while: [ :e | e ~= Character space ]. 
                
		(parser parse: 'hash ijk') isPetitFailure not. 
		(parser parse: '99 ijk') isPetitFailure. 
"
Class {
	#name : #PP2FlexiblePredicateSequenceNode,
	#superclass : #PP2PredicateNode,
	#instVars : [
		'condition'
	],
	#category : #'PetitParser2-Nodes'
}

{ #category : #'instance creation' }
PP2FlexiblePredicateSequenceNode class >> on: predicateBlock message: aString while: conditionBlock [

	^ (self on: predicateBlock message: aString)
		condition: conditionBlock;
		yourself
]

{ #category : #visiting }
PP2FlexiblePredicateSequenceNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitFlexiblePredicateSequence: self
]

{ #category : #accessing }
PP2FlexiblePredicateSequenceNode >> condition [
	^ condition
]

{ #category : #accessing }
PP2FlexiblePredicateSequenceNode >> condition: anObject [
	condition := anObject
]

{ #category : #operators }
PP2FlexiblePredicateSequenceNode >> negate [
	"Answer a parser that is the negation of the receiving predicate parser."
	
	^ super negate
		condition: self condition;
		yourself
]

{ #category : #initialization }
PP2FlexiblePredicateSequenceNode >> resetStrategy [
	strategy := PP2FlexiblePredicateSequence on: self
]
