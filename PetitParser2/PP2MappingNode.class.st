"
Performs an action block with the given number of arguments with the successful parse result of the delegate. The delegate must return result with the expected number of arguments.

Example:
($a asPParser, $b asPParser map: [ :a :b | Array with: a uppercase with: b uppercase ])
  parse: 'ab'
"
Class {
	#name : #PP2MappingNode,
	#superclass : #PP2AbstractActionNode,
	#category : #'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2MappingNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitMapping: self
]

{ #category : #initialization }
PP2MappingNode >> resetStrategy [
	strategy := PP2Mapping on: self
]
