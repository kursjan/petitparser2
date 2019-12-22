"
The default repeating parser with standard PEG semantics (i.e. possessive, blind, eager).

Examples:
$a asPParser star parse: 'aaaa'
""always fails, because star is greedy""
($a asPParser star, $a asPParser) parse: 'aaa' 


Use #starLazy if you want a non-greedy parse:
($a asPParser starLazy, ($a asPParser, #endOfInput asPParser)) parse: 'aaa'

Note that #starLazy consumes as little as possible, contrary to your expectations:
($a asPParser starLazy, $a asPParser) parse: 'aaa'

"
Class {
	#name : #PP2PossesiveRepeatingNode,
	#superclass : #PP2RepeatingNode,
	#category : #'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2PossesiveRepeatingNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitPossesiveRepeating: self
]

{ #category : #comparing }
PP2PossesiveRepeatingNode >> hash [
	^ super hash bitXor: (min hash bitXor: max hash)
]

{ #category : #comparing }
PP2PossesiveRepeatingNode >> localEquals: anotherNode [
	(super localEquals: anotherNode) ifFalse: [ ^ false ].
	
	self min = anotherNode min ifFalse: [ ^ false ].
	self max = anotherNode max ifFalse: [ ^ false ].
	^ true
]

{ #category : #initialization }
PP2PossesiveRepeatingNode >> resetStrategy [
	strategy := PP2PossesiveRepeating on: self
]
